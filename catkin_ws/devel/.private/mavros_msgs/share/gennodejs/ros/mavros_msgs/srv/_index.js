
"use strict";

let FileWrite = require('./FileWrite.js')
let FileClose = require('./FileClose.js')
let SetMode = require('./SetMode.js')
let StreamRate = require('./StreamRate.js')
let CommandTriggerControl = require('./CommandTriggerControl.js')
let CommandTOL = require('./CommandTOL.js')
let CommandLong = require('./CommandLong.js')
let ParamPull = require('./ParamPull.js')
let ParamSet = require('./ParamSet.js')
let CommandBool = require('./CommandBool.js')
let FileRename = require('./FileRename.js')
let WaypointClear = require('./WaypointClear.js')
let ParamGet = require('./ParamGet.js')
let ParamPush = require('./ParamPush.js')
let FileList = require('./FileList.js')
let FileRemove = require('./FileRemove.js')
let FileTruncate = require('./FileTruncate.js')
let FileOpen = require('./FileOpen.js')
let CommandInt = require('./CommandInt.js')
let FileChecksum = require('./FileChecksum.js')
let FileRead = require('./FileRead.js')
let WaypointSetCurrent = require('./WaypointSetCurrent.js')
let FileMakeDir = require('./FileMakeDir.js')
let CommandHome = require('./CommandHome.js')
let WaypointPull = require('./WaypointPull.js')
let FileRemoveDir = require('./FileRemoveDir.js')
let WaypointPush = require('./WaypointPush.js')

module.exports = {
  FileWrite: FileWrite,
  FileClose: FileClose,
  SetMode: SetMode,
  StreamRate: StreamRate,
  CommandTriggerControl: CommandTriggerControl,
  CommandTOL: CommandTOL,
  CommandLong: CommandLong,
  ParamPull: ParamPull,
  ParamSet: ParamSet,
  CommandBool: CommandBool,
  FileRename: FileRename,
  WaypointClear: WaypointClear,
  ParamGet: ParamGet,
  ParamPush: ParamPush,
  FileList: FileList,
  FileRemove: FileRemove,
  FileTruncate: FileTruncate,
  FileOpen: FileOpen,
  CommandInt: CommandInt,
  FileChecksum: FileChecksum,
  FileRead: FileRead,
  WaypointSetCurrent: WaypointSetCurrent,
  FileMakeDir: FileMakeDir,
  CommandHome: CommandHome,
  WaypointPull: WaypointPull,
  FileRemoveDir: FileRemoveDir,
  WaypointPush: WaypointPush,
};
