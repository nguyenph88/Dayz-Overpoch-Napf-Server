/*
	Medical Supply Camp by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
*/

private ["_missName","_coords","_crate","_crate2","_vehicle","_base1","_base2"];

//Name of the Mission
_missName = "Bandit Medical Camp";
diag_log format["[EMS]: Major SM3 Bandit Medical Camp Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Bandits have set up a medical re-supply camp! Check your map for the location!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] execVM DZMSAddMajMarker;

//Create the scenery
_base1 = createVehicle ["land_fortified_nest_big",[(_coords select 0) - 20, (_coords select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
_base2 = createVehicle ["Land_Fort_Watchtower",[(_coords select 0) - 10, (_coords select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
[_base1] call DZMSProtectObj;
[_base2] call DZMSProtectObj;

//Create the vehicles
_vehicle = createVehicle ["HMMWV_DZ",[(_coords select 0) + 25, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
[_vehicle] call DZMSSetupVehicle;

//Create the loot
_crate = createVehicle ["MedBox0",[(_coords select 0) + 2, (_coords select 1),0],[], 0, "CAN_COLLIDE"];
[_crate,"medical"] execVM DZMSBoxSetup;

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) + 1, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] execVM DZMSBoxSetup;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;


//Wait until the player is within 30meters
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;



//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
 

//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors have taken control of the camp and medical supplies.", "PLAIN",6] call RE;
diag_log format["[EMS]: Major SM3 Medical Camp Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;