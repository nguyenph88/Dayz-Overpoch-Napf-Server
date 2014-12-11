/*
	HMMWV Wreck Mission by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_vehicle","_crate"];

//Name of the Mission
_missName = "BRDM Wreck";
diag_log format["[EMS]: Minor SM11 BRDM Wreck Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A BRDM has crashed! Kill any survivors and secure the loot!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] execVM DZMSAddMinMarker;

_vehicle = createVehicle ["BRDMWreck",_coords,[], 0, "CAN_COLLIDE"];
[_vehicle] call DZMSSetupVehicle;

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weap"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) + 20, (_coords select 1) + 15,0],3,2,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30meters
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
 
 

//Let everyone know the mission is over
[nil,nil,rTitleText,"The BRDM crash is under survivor control!", "PLAIN",6] call RE;
diag_log format["[EMS]: Minor SM11 BRDM Crash Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;