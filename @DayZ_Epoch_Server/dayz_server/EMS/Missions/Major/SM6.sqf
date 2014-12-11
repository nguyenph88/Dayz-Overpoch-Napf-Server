/*
	Medical Ural Attack by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Format by Vampire
*/

private ["_missName","_coords","_crash","_vehicle","_vehicle1","_crate","_crate2"];

//Name of the Mission
_missName = "IKEA Truck";
diag_log format["[EMS]: Major SM6 IKEA Truck Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"An IKEA construction truck has crashed, locate the crash and loot the truck!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] execVM DZMSAddMajMarker;

//We create the scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];
[_crash] call DZMSProtectObj;

//We create the vehicles like normal
_vehicle = createVehicle ["UAZ_MG_TK_EP1",[(_coords select 0) + 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;

_crate = createVehicle ["MedBox0",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"medical"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crate2 = createVehicle ["USVehicleBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2,"supply"] execVM DZMSBoxSetup;
[_crate2] call DZMSProtectObj;


[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;



//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
 
 

[nil,nil,rTitleText,"Survivors have secured the IKEA truck, Ingvar Kamprad is mighty pleased!", "PLAIN",6] call RE;
diag_log format["[EMS]: Major SM6 IKEA Truck Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;