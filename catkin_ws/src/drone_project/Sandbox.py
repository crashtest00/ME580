#!/usr/bin/env python
import sys
import rospy
import numpy as np
from geometry_msgs.msg import Pose, PoseStamped
from std_msgs.msg import Header
import math
import time

home = [rospy.get_param("/home_lat"), rospy.get_param("/home_lon")]
print(home)
