/**
 * @file get_state.cpp
 * @ Get state for DDPG, written with MAVROS version 0.19.x, PX4 Pro Flight
 * Stack and tested in Gazebo SITL
 */

#include <ros/ros.h>
//#include <node_handle.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <sensor_msgs/BatteryState.h>

mavros_msgs::State current_state;
void state_cb(const mavros_msgs::State::ConstPtr& smsg) {
    current_state = *smsg;
}

sensor_msgs::BatteryState current_voltage;
void volt_cb(const sensor_msgs::BatteryState::ConstPtr& vmsg){
    current_voltage = *vmsg;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "get_state");
    ros::NodeHandle nh;

    ros::Subscriber state_sub = nh.subscribe<mavros_msgs::State>("mavros/state", 10, state_cb);
    ros::Subscriber volt_sub = nh.subscribe<sensor_msgs::BatteryState>("mavros/battery", 10, volt_cb);
//    ros::Publisher xy_velocity = nh.advertise<geometry_msgs::TwistStamped>("mavros/setpoint_velocity/cmd_vel", 10);
    ros::Publisher init_pos = nh.advertise<geometry_msgs::PoseStamped>("mavros/setpoint_position/local", 10);
    ros::ServiceClient arming_client = nh.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    ros::ServiceClient set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
    
    //Set default params to throw name error if node is launched without GPS coords
    nh.setParam("/lat", "~");
    nh.setParam("/lon","~");

    //the setpoint publishing rate MUST be faster than 2Hz
    ros::Rate rate(20.0);

    // Voltage trackers
    float dV=0, curV=0, oldV=0;

    // wait for FCU connection
    while(ros::ok() && current_state.connected){
        ros::spinOnce();
        rate.sleep();
    }

    //Get current GPS coords
    //Calculate heading to target
    float hdg = 2;

    //This needs abstracted to a "launch" node. It should launch this node with the line equation
    geometry_msgs::PoseStamped pose;
    pose.pose.orientation.x = 0;
    pose.pose.orientation.y = 0;
    pose.pose.orientation.z = 2;
    pose.pose.orientation.w = hdg;

    mavros_msgs::SetMode offb_set_mode;
    offb_set_mode.request.custom_mode = "OFFBOARD";

    mavros_msgs::CommandBool arm_cmd;
    arm_cmd.request.value = true;

    ros::Time last_request = ros::Time::now();

    //Init oldV to initial voltage
    oldV = current_voltage.voltage; //There are several other options for measuring battery consumption

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
        // Get the drone's current location

        //Calculate the distance to the goal

        // Get the current voltage
        curV = //get this from Mavros;

        //Calculate the voltage since the last time step
        dV = oldV - curV;
        printf("Current Voltage: %f", dV);


        init_pos.publish(pose);
        //xy_velocity.publish(pose);

        ros::spinOnce();
        rate.sleep();
    }

    return 0;
}