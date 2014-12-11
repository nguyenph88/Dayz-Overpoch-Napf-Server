/*
	Constructors Mission by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
	Edited by Fuchs for EMS
*/

private ["_missName","_coords","_crate","_crash","_vehicle","_base1","_base2"];

//Name of the Mission
_missName = "Crashed IKEA Heli";
diag_log format["[EMS]: Major SM13 Crashed IKEA Heli Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"An IKEA helicopter has crashed and bandits have surrounded it! Secure the location and loot!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] execVM DZMSAddMajMarker;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"supply"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crash = createVehicle ["UH60Wreck_DZ", _coords,[], 0, "CAN_COLLIDE"];
_vehicle = createVehicle ["HMMWV_DZ",[(_coords select 0) + 10, (_coords select 1) - 10,0],[], 0, "CAN_COLLIDE"];


[_crash] call DZMSSetupVehicle;
[_vehicle] call DZMSSetupVehicle;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;


//Wait until the player is within 30meters
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;



//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.


//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors have secured the crashed IKEA helicopter!", "PLAIN",6] call RE;
diag_log format["[EMS]: Major SM13 Constructors Mission Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;