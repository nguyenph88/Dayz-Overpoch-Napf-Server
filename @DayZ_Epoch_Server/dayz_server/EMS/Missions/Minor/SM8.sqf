/*
	Bandit Party by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_crash","_tent","_crate"];

//Name of the Mission
_missName = "Bandit Party";
diag_log format["[EMS]: Minor SM8 Abandoned Platoon Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A bandit party has taken up a vantage point, check your map for the location!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] execVM DZMSAddMinMarker;

//Add scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_crash] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) + 20, (_coords select 1) + 15,0],5,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weap"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors have annihilated the bandit party and secured the vantage point!", "PLAIN",6] call RE;
diag_log format["[EMS]: Minor SM8 Bandit Party Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;