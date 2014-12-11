/*
	Hillbilly Mission by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_base","_base2","_base3","_crate"];

//Name of the Mission
_missName = "Renegade Squad";
diag_log format["[EMS]: Minor SM9 Renegade Squad Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//DZMSAddminMarker is a simple script that adds a marker to the location
[_coords,_missName] execVM DZMSAddMinMarker;


[nil,nil,rTitleText,"A renegade squad has set up a remote house, force them out of the area!", "PLAIN",10] call RE;

_base = createVehicle ["land_housev_1i4",[(_coords select 0) +2, (_coords select 1)+5,-0.3],[], 0, "CAN_COLLIDE"];
_base2 = createVehicle ["land_kbud",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base3 = createVehicle ["land_kbud",[(_coords select 0) - 7, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weap"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) + 20, (_coords select 1) + 15,0],6,0,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;


//Wait until the player is within 30meters
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors removed the renegades, huge success!", "PLAIN",6] call RE;
diag_log format["[EMS]: Minor SM9 renegades Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;