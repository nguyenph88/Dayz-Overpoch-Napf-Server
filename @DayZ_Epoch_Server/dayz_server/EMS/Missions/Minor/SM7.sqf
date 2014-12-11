/*																					//
	Weapons Cache Mission by lazyink (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
	Edited by Fuchs for EMS
*/	

private ["_missName","_coords","_crate","_crash","_vehicle","_base1"];

//Name of the Mission
_missName = "Abandoned Platoon";
diag_log format["[EMS]: Minor SM7 Abandoned Platoon Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A general has fled and abandon his platoon and their resources, wipe them out quickly!", "PLAIN",10] call RE;

//DZMSAddminMarker is a simple script that adds a marker to the location
[_coords,_missName] execVM DZMSAddMinMarker;


_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_base1 = createVehicle ["land_fortified_nest_big",[(_coords select 0) + 17, (_coords select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];

//Add the scenery
_crash = createVehicle ["uralwreck", _coords,[], 0, "CAN_COLLIDE"];
[_crash] call DZMSProtectObj;

_vehicle = createVehicle ["HMMWV_DZ",[(_coords select 0) + 25, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
[_vehicle] call DZMSSetupVehicle;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"weap"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;
[_base1] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) + 20, (_coords select 1) + 15,0],6,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30meters
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors have obliterated the abandoned platoon, what a grim fate.", "PLAIN",6] call RE;
diag_log format["[EMS]: Minor SM7 Weapon Cache Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;