/*
	Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_vehicle","_crate","_crash"];

//Name of the Mission
_missName = "Bandit Hunting Party";
diag_log format["[EMS]: Minor SM11 Bandit Hunting Party Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A bandit hunting party has been spotted! Check your map for the location!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] execVM DZMSAddMinMarker;

//Add the scenery
_crash = createVehicle ["uralwreck", _coords,[], 0, "CAN_COLLIDE"];
[_crash] call DZMSProtectObj;

//Add and fill the boxes
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weap"] execVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//Create the vehicle as normal
_vehicle = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;

[[(_coords select 0) + 20, (_coords select 1) + 15,0],5,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;


[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
 

//Let everyone know the mission is over
[nil,nil,rTitleText,"The hunting party has been wiped out!", "PLAIN",6] call RE;
diag_log format["[EMS]: Minor SM1 Hunting Party Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;