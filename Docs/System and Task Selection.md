<h1>System and Task Selection</h1>

<h2>Task</h2>
<i><h3>Primary</h3></i>
  The primary task of this system is to train the deep neural network to fly the drone to a specific point, execute an action (e.g. take a picture) and return home. This task should be accomplished using sensor feedback from the Pixhawk (GPS, compass, altitude, and attitude).
  
  This neural network will receive initial training using the Pixhawk flight controller and either Gazebo or jMAVsim flight simulators. This simulators provide artificial inputs to the Pixhawk sensors, so the neural network will not be able to distinguish between a simulator mission and an actual mission. As an additional safe guard, the pilot will be able to take manual control in case of a neural network failure.
The pilot/student is Part 107 certified.

<i><h3>Secondary (Stretch)</h3></i>
  Flying a drone is hardly novel today. However, almost all drones require a pre-programmed flight path. The purpose of utilizing an onboard AI neural network is enable the drone to fly autonomously without requiring a preplanned mission. Specifically, the secondary stretch goal for this project is to add a camera to the neural network’s sensor inputs to enable the TX2 autopilot to follow a distinct nominally linear pattern identified in the camera imagery. I expect that the simplest feature to follow will be a road, as they are very straight and have a high contrast to their surroundings in the test area (Central Illinois). In addition to following the road, the drone will capture images that can then be geolocated on a map using QGIS. While further refinement lies beyond the scope of this project, improvements to the feature extraction and image classification would enable the drone to survey pipelines and railroad tracks without requiring a preplanned flight path.
<h2>Platform Description</h2>
  The platform is a quadrotor drone. This model is a non-production prototype salvaged from Horizon Precision Systems, a now-defunct business unit of Horizon Hobby. This platform uses an X-style motor pattern. The chassis is primarily carbon fiber plate with aluminum standoffs. The arms are carbon tube and fold in against the chassis to facilitate transport. The motors are OEM of unknown manufacture. The propellers will be selected once the final flying weight is determined and the proper balance of endurance vs agility is ascertained. No battery has been selected yet. Surface-to-air communication will consist of a 2.4Ghz Spektrum control link and a 900Mhz telemetry link.
<h2>Sensors/Electronics</h2>
  The drone will utilize a Pixhawk flight controller running the PX4 flight stack for basic stabilization. This unit includes a GPS, magnetometer, barometer, and a 3-axis gyro/accelerometer (also called "6-axis" by some industry conventions).  The Pixhawk will process these data and output attitude and position data to the TX2. 

  The NVIDIA TX2 microcomputer will run a deep reinforcement learning neural network for guidance. This unit will either be onboard or located near the base station and receive telemetry from the drone via dedicated 900mhz radio connection. Flight commands will be communicated to the drone via MAVLink protocol via UART if the TX2 is located onboard or possibly via Spektrum 2.4Ghz base station if the TX2 is not mounted on the drone. Locating the TX2 off the drone introduces some system complexity but eliminates the risk of damage in case of a crash.
  
  The TX2 requires a carrier board in order to integrate with the Pixhawk. Pending price quotes, the carrier board will either be a Sprocket or an Orbitty carrier, both manufactured by Connect Tech. The Sprocket has a much smaller form factor and supports CSI camera protocols. The Orbitty is likely cheaper.

To support the secondary goal, the drone will also utilize a camera for orientation, localization, and path planning. A camera has not been selected yet and will depend on the carrier board selection, since CSI capability would be preferable. 

![Drone Image](https://raw.githubusercontent.com/crashtest84/ME580/master/Docs/Day1_Platform.jpg)
