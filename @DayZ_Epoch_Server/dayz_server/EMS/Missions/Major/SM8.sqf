/*																					//
	Weapons Cache Mission by lazyink (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
	Edited by Fuchs for EMS
*/	

private ["_missName","_coords","_vehicle","_crate","_crate2"];

//Name of the Mission
_missName = "C-130 Crash";
diag_log format["[EMS]: Major SM8 C-130 Crash Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] execVM DZMSAddMajMarker;

[nil,nil,rTitleText,"A C-130 has crash landed! Secure it's cargo for yourself!", "PLAIN",10] call RE;

_vehicle = createVehicle ["C130J_wreck_EP1",[(_coords select 0) + 35, (_coords select 1) - 5,0],[], 0, "NONE"];
_crate = createVehicle ["USVehicleBox",[(_coords select 0) + 15, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_crate2 = createVehicle ["MedBox0",[(_coords select 0) + 20, _coords select 1,0],[], 0, "CAN_COLLIDE"];

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"weapons"] execVM DZMSBoxSetup;
[_crate2,"meds"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;
[_crate2] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;


//Wait until the player is within 30meters
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;



//Let everyone know the mission is over
[nil,nil,rTitleText,"The crashed C-13 has been found and secured by the survivors!", "PLAIN",6] call RE;
diag_log format["[EMS]: Major SM8 C130 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;