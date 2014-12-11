/*
	Ural Wreck by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_crash","_crate"];

//Name of the Mission
_missName = "Ural Wreck";
diag_log format["[EMS]: Minor SM12 Ural Wreck Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A truck has crashed! Kill any survivors and secure the loot!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] execVM DZMSAddMinMarker;

//We create and fill the crates
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weap"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//Add the scenery
_crash = createVehicle ["uralwreck", _coords,[], 0, "CAN_COLLIDE"];
[_crash] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) + 20, (_coords select 1) + 15,0],6,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30meters
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
//Let everyone know the mission is over
[nil,nil,rTitleText,"The crash site has been secured by survivors!", "PLAIN",6] call RE;
diag_log format["[EMS]: Minor SM12 Ural Crash Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;
