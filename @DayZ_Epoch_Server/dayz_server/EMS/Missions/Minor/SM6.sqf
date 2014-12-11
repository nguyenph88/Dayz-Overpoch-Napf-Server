/*
	Weapon Truck Crash by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_crash","_crate","_crate1","_crate2"];

//Name of the Mission
_missName = "Bandit Weapons Truck";
diag_log format["[EMS]: Minor SM6 Ural Weapons Truck Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A bandit weapons truck has crashed! Check your map for the location!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] execVM DZMSAddMinMarker;

//Add scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_crash] call DZMSProtectObj;

//Add and fill the boxes
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weap"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate1,"weap"] execVM DZMSBoxSetup;
[_crate1] call DZMSProtectObj;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) + 20, (_coords select 1) + 15,0],5,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;


//Wait until the player is within 30meters
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The crash site has been secured by survivors!", "PLAIN",6] call RE;
diag_log format["[EMS]: Minor SM6 Ural Crash Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;