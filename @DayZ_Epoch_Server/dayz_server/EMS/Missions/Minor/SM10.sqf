/*
	Helicopter Crash by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_vehicle","_crate","_crate1","_crate2"];

//Name of the Mission
_missName = "Heli Crash";
diag_log format["[EMS]: Minor SM10 Mi8 Heli Crash Mission has started."];

[nil,nil,rTitleText,"A Mi8 helicopter has crashed! Check your map for the location!", "PLAIN",10] call RE;

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[_coords,_missName] execVM DZMSAddMinMarker;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weap"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;


_vehicle = createVehicle ["Mi8Wreck",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
[_vehicle] call DZMSProtectObj;

[[(_coords select 0) + 20, (_coords select 1) + 15,0],5,2,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30meters
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
 
 

//Let everyone know the mission is over
[nil,nil,rTitleText,"Good work, Survivors secured the crash site!!", "PLAIN",6] call RE;
diag_log format["[EMS]: Minor SM10 Heli Crash Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;