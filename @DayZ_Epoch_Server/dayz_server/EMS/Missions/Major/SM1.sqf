/*																					//
	Weapons Cache Mission by lazyink (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
*/																					//

private ["_missName","_coords","_crate","_vehicle","_vehicle1","_vehicle2"];

//Name of the Mission
_missName = "Bandit Weapons Cache";
diag_log format["[EMS]: Major SM1 Bandit Weapon Cache Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Bandits have discovered a weapons cache! Check your map for the location!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] execVM DZMSAddMajMarker;

//We create the vehicles like normal
_vehicle = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 10, (_coords select 1) - 20,0],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 20, (_coords select 1) - 10,0],[], 0, "CAN_COLLIDE"];
//_vehicle2 = createVehicle ["SUV_TK_CIV_EP1",[(_coords select 0) + 30, (_coords select 1) + 10,10],[], 0, "CAN_COLLIDE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;
[_vehicle1] call DZMSSetupVehicle;
//[_vehicle2] call DZMSSetupVehicle;

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"weapons"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"DZMSUnitsMajor"] call DZMSAISpawn;

sleep 5;


//Wait until the player is within 30meters

[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
 

//Let everyone know the mission is over
[nil,nil,rTitleText,"The weapons cache is under survivor control!", "PLAIN",6] call RE;
diag_log format["[EMS]: Major SM1 Weapon Cache Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;