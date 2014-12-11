/*
	Medical C-130 Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Modified to new format by Vampire
*/

private ["_missName","_coords","_c130wreck","_crate","_crate2","_crate3","_vehicle","_vehicle1","_vehicle2"];

//Name of the Mission
_missName = "Medical C-130 Crash";
diag_log format["[EMS]: Major SM2 Medical C-130 Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A C-130 carrying medical supplies has crashed and bandits are securing the site! Check your map for the location!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] execVM DZMSAddMajMarker;

//We create the mission scenery
_c130wreck = createVehicle ["C130J_wreck_EP1",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "NONE"];
[_c130wreck] call DZMSProtectObj;

//We create the mission vehicles
_vehicle = createVehicle ["HMMWV_DZ",[(_coords select 0) - 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) - 30, (_coords select 1) - 10,0],[], 0, "CAN_COLLIDE"];
//_vehicle2 = createVehicle ["SUV_TK_CIV_EP1",[(_coords select 0) + 10, (_coords select 1) + 5,0],[], 0, "CAN_COLLIDE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;
[_vehicle1] call DZMSSetupVehicle;
//[_vehicle2] call DZMSSetupVehicle;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 2, _coords select 1,0],[], 0, "CAN_COLLIDE"];

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"weapons"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crate2 = createVehicle ["MedBox0",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];

[_crate2,"medical"] execVM DZMSBoxSetup;
[_crate2] call DZMSProtectObj;

_crate3 = createVehicle ["MedBox0",[(_coords select 0) - 5, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate3,"medical"] execVM DZMSBoxSetup;
[_crate3] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) + 20, _coords select 1,0],6,1] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30meters
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;



//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.

//Let everyone know the mission is over
[nil,nil,rTitleText,"The crash site has been secured by survivors!", "PLAIN",6] call RE;
diag_log format["[EMS]: Major SM2 Crash Site Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;