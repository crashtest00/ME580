
"use strict";

let BatteryStatus = require('./BatteryStatus.js');
let HilSensor = require('./HilSensor.js');
let GlobalPositionTarget = require('./GlobalPositionTarget.js');
let RCOut = require('./RCOut.js');
let ExtendedState = require('./ExtendedState.js');
let Vibration = require('./Vibration.js');
let PositionTarget = require('./PositionTarget.js');
let ActuatorControl = require('./ActuatorControl.js');
let ParamValue = require('./ParamValue.js');
let HilActuatorControls = require('./HilActuatorControls.js');
let AttitudeTarget = require('./AttitudeTarget.js');
let RCIn = require('./RCIn.js');
let WaypointList = require('./WaypointList.js');
let OverrideRCIn = require('./OverrideRCIn.js');
let Waypoint = require('./Waypoint.js');
let Altitude = require('./Altitude.js');
let FileEntry = require('./FileEntry.js');
let Mavlink = require('./Mavlink.js');
let Thrust = require('./Thrust.js');
let CamIMUStamp = require('./CamIMUStamp.js');
let OpticalFlowRad = require('./OpticalFlowRad.js');
let VFR_HUD = require('./VFR_HUD.js');
let HilStateQuaternion = require('./HilStateQuaternion.js');
let ADSBVehicle = require('./ADSBVehicle.js');
let RadioStatus = require('./RadioStatus.js');
let HilGPS = require('./HilGPS.js');
let CommandCode = require('./CommandCode.js');
let HomePosition = require('./HomePosition.js');
let HilControls = require('./HilControls.js');
let State = require('./State.js');
let ManualControl = require('./ManualControl.js');

module.exports = {
  BatteryStatus: BatteryStatus,
  HilSensor: HilSensor,
  GlobalPositionTarget: GlobalPositionTarget,
  RCOut: RCOut,
  ExtendedState: ExtendedState,
  Vibration: Vibration,
  PositionTarget: PositionTarget,
  ActuatorControl: ActuatorControl,
  ParamValue: ParamValue,
  HilActuatorControls: HilActuatorControls,
  AttitudeTarget: AttitudeTarget,
  RCIn: RCIn,
  WaypointList: WaypointList,
  OverrideRCIn: OverrideRCIn,
  Waypoint: Waypoint,
  Altitude: Altitude,
  FileEntry: FileEntry,
  Mavlink: Mavlink,
  Thrust: Thrust,
  CamIMUStamp: CamIMUStamp,
  OpticalFlowRad: OpticalFlowRad,
  VFR_HUD: VFR_HUD,
  HilStateQuaternion: HilStateQuaternion,
  ADSBVehicle: ADSBVehicle,
  RadioStatus: RadioStatus,
  HilGPS: HilGPS,
  CommandCode: CommandCode,
  HomePosition: HomePosition,
  HilControls: HilControls,
  State: State,
  ManualControl: ManualControl,
};
