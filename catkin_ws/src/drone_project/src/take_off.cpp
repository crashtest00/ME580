//
// Created by jack on 12/6/17.
//

/**
 * @file take_off.cpp
 * @ Take off node for DDPG-Navigator, written with MAVROS version 0.19.x, PX4 Pro Flight
 * Stack and tested in Gazebo SITL
 */

#include <ros/ros.h>
//#include <node_handle.h>
#include <std_msgs/String.h>
#include <std_msgs/Float32.h>
#include <sensor_msgs/NavSatFix.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/CommandHome.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <mavros_msgs/Altitude.h>
#include <mavros_msgs/CommandTOL.h>
#include <drone_project/drone_state.h>

//template<class state_talker>
//ros::Publisher advertise(const std::string& drone_state, uint32_t 1);

sensor_msgs::NavSatFix drone_home_pos;
void home_cb(const sensor_msgs::NavSatFix::ConstPtr& hmsg) {
    drone_home_pos = *hmsg;
}
mavros_msgs::State current_state;
void state_cb(const mavros_msgs::State::ConstPtr& smsg) {
    current_state = *smsg;
}
mavros_msgs::Altitude current_altitude;
void altitude_cb(const mavros_msgs::Altitude::ConstPtr& amsg) {
    current_altitude = *amsg;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "take_off");
    ros::NodeHandle nh;

    ros::Subscriber home = nh.subscribe<sensor_msgs::NavSatFix>("mavros/global_position/global", 10, home_cb);
    ros::Subscriber state_sub = nh.subscribe<mavros_msgs::State>("mavros/state", 10, state_cb);
    ros::Subscriber altitude_sub = nh.subscribe<mavros_msgs::Altitude>("mavros/altitude", 10, altitude_cb);
    ros::Publisher init_pos = nh.advertise<geometry_msgs::PoseStamped>("mavros/setpoint_position/local", 10);
    ros::Publisher velocity = nh.advertise<geometry_msgs::TwistStamped>("mavros/setpoint_velocity/cmd_vel", 10);
    ros::Publisher drone_state = nh.advertise<drone_project::drone_state>("drone_state", 10);
    ros::ServiceClient set_home_client = nh.serviceClient<mavros_msgs::CommandHome>("mavros/cmd/set_home");
    ros::ServiceClient arming_client = nh.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    ros::ServiceClient set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");

    bool do_take_off = true;

    //Set goal param
    nh.setParam("goal_lat", argv[1]);
    nh.setParam("goal_lon", argv[2]);
    nh.setParam("ai_nav", false);

    //init velocity params
    nh.setParam("x_vel", 0);
    nh.setParam("y_vel", 0);
    nh.setParam("z_vel", 0);
    nh.setParam("z_rot", 0);

    //Take off settings
    int target_alt = 2;
    geometry_msgs::PoseStamped initial_pose;
    initial_pose.pose.position.x = 0;
    initial_pose.pose.position.y = 0;
    initial_pose.pose.position.z = target_alt;

    // Initialize velocity
    geometry_msgs::TwistStamped xy_vel;
    xy_vel.header.frame_id = "velocity";
    xy_vel.header.stamp.now();
    nh.getParam("x_vel", xy_vel.twist.linear.x);
    nh.getParam("y_vel", xy_vel.twist.linear.y);
    nh.getParam("z_vel", xy_vel.twist.linear.z);
    nh.getParam("z_rot", xy_vel.twist.angular.z);

    //Set home position
    mavros_msgs::CommandHome set_home;
    set_home.request.current_gps = true;
    nh.setParam("home_lat", drone_home_pos.latitude);
    nh.setParam("home_lon", drone_home_pos.longitude);

    //the setpoint publishing rate MUST be faster than 2Hz
    ros::Rate rate(20.0);

    // wait for FCU connection
    while(ros::ok() && current_state.connected){
        ros::spinOnce();
        rate.sleep();
    }

    mavros_msgs::SetMode offb_set_mode;
    offb_set_mode.request.custom_mode = "OFFBOARD";

    mavros_msgs::CommandBool arm_cmd;
    arm_cmd.request.value = true;

    ros::Time last_request = ros::Time::now();

    while(ros::ok()){
        if( current_state.mode != "OFFBOARD" &&
            (ros::Time::now() - last_request > ros::Duration(5.0))){
            if( set_mode_client.call(offb_set_mode) &&
                offb_set_mode.response.mode_sent){
                ROS_INFO("Offboard enabled");
            }
            last_request = ros::Time::now();
        } else {
            if( !current_state.armed &&
                (ros::Time::now() - last_request > ros::Duration(5.0))){
                if( arming_client.call(arm_cmd) &&
                    arm_cmd.response.success){
                    ROS_INFO("Vehicle armed");
                }
                last_request = ros::Time::now();
            }
        }

        if(do_take_off) {
            init_pos.publish(initial_pose);
            ROS_INFO("Current Altitude: %f \n Target Altitude: %i", current_altitude.relative, target_alt);
            if(current_altitude.relative >= target_alt*0.9) { //Allow for barometer error = 10%
                nh.setParam("ai_nav", true);
                do_take_off = false;
            }
        }else {
            ROS_INFO("Update Velocities");
            //Update velocity values
            xy_vel.header.stamp.now();
            nh.getParam("x_vel", xy_vel.twist.linear.x);
            nh.getParam("y_vel", xy_vel.twist.linear.y);
            nh.getParam("z_vel", xy_vel.twist.linear.z);
            nh.getParam("z_rot", xy_vel.twist.angular.z);
            velocity.publish(xy_vel);
        }

        // Need state publisher here

        // When the state is calculated, a sign will need applied to the distances and the sign should be based on
        // right, up = positive. There's going to be some funky vector math for this...

        ros::spinOnce();
        rate.sleep();
    }

    return 0;
}