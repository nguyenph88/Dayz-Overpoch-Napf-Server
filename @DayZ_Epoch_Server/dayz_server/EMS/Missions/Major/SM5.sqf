/*
	Medical Ural Attack by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Format by Vampire
*/

private ["_missName","_coords","_crash","_vehicle","_vehicle1","_crate","_crate2"];

//Name of the Mission
_missName = "Crashed Bank Ural";
diag_log format["[EMS]: Major SM5 Bandit Gold Ural Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Bandits have destroyed a Ural carrying gold for the Chernarus bank! Check the map for the location!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] execVM DZMSAddMajMarker;

//We create the scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];
[_crash] call DZMSProtectObj;

//We create the vehicles like normal
_vehicle1 = createVehicle ["HMMWV_DZ",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle1] call DZMSSetupVehicle;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"gold"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) + 22, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] execVM DZMSBoxSetup;

[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],4,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
 
 

[nil,nil,rTitleText,"The gold supply truck has been secured by Survivors!", "PLAIN",6] call RE;
diag_log format["[EMS]: Major SM5 Gold Transport Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;