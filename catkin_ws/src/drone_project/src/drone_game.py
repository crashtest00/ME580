#!/usr/bin/env python
import sys
import rospy
import numpy as np
from geometry_msgs.msg import Pose, PoseStamped,
from std_msgs.msg import Header
import math
import time

class drone_game():
    def __init__(self):
        # init code
        rospy.init_node("drone_game")
        self.reached = False
        self.state_names = ['Distance to path','Distance to goal','Heading','x-Velocity','y-Velocity']
        self.state = np.zeros([1,len(self.state_names)])
        self.action_names = ["x-Velocity", "y-Velocity", "z-Velocity", "Heading"]
        self.action =  np.zeros([1,len(self.action_names)])
        self.sub = rospy.Subscriber('/topic', msg_type , self.stateCB) #This needs MAJOR help
        self.goal = [0.0, 0.0]
        self.home = [0.0, 0.0]
        self.current_position = [0.0, 0.0]
        self.reset()
        self.error = 2 # GPS Error in meters

    def get_state(self):
        return self.state

    def set_state(self, action):
        publish action
        set self.action equal to what was published

    def check_ai_nav(self):
        ai_nav = rospy.get_param('ai_nav')
        if ai_nav == True:
            print ("AI Nav has been triggered!")
        return ai_nav

    #Callback needs rewritten. Basically it takes the message and applies it to self.state
    def stateCB(self, msg):
        self.state = msg

    # def getCurrentJointValues(self):
    #     return self.rjv

    # def getCurrentPose(self):
    #     self.tf.waitForTransform("/world", "/gripper_r_finger_r", rospy.Time(), rospy.Duration(10))
    #     t = self.tf.getLatestCommonTime("/world", "/gripper_r_finger_r")
    #     position, quaternion = self.tf.lookupTransform("/world", "/gripper_r_finger_r", t)
    #     return [position[0], position[1], position[2]]

    # def setJointValues(self, param):
    #     self.right_positions = param
    #     self.right_positions[-1] = 0  # close gripper
    #     rospy.sleep(0.20)
    #     return True

    def get_path_dist(self):
        p1 = self.home
        p2 = self.goal
        p3 = self.current_position
        d = norm(np.cross(p2 - p1, p1 - p3)) / norm(p2 - p1)
        return np.abs(d)

    def get_goal_dist(self):
        d = np.linalg.norm(self.current_position-self.goal)
        return d

    def reset(self):
        self.home = [rospy.get_param("/home_lat"), rospy.get_param("/home_lon")]
        self.current_position = get from subscriber
        self.state = self.get_state()
        # print self.destPos
        self.goal = [rospy.get_param('lat'), rospy.get_param('lon')]
        # print self.destPos
        return True

    def step(self, vals):
        done = False
        #prevDist = self.getDist()
        action = [x + y for x, y in zip(vals.flatten().tolist(), self.get_state())] #This is the deterministic part I think
        do_action = self.setState(action)
        path_dist = self.get_path_dist()
        goal_dist = self.get_goal_dist()
        reward = -path_dist - 0.00 * np.linalg.norm(vals) - 0.5 * math.log10(goal_dist) #need to test this, looks fishy
        #print self.destPos, -curDist - 0.5 * math.log10(curDist), -curDist, np.linalg.norm(vals)
        if np.abs(goal_dist)-self.error < 0.01:
            reward += 10
            done = True
        time.sleep(0.1)
        return [state_1, reward, done]

    def done(self):
        self.sub.unregister()
        rospy.signal_shutdown("done")


if __name__ == "__main__":
    r = drone_game()
    print r.get_state()
    r.reset()
    print r.get_state()