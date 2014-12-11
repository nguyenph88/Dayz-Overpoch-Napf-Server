/*
	CH47 Mission by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
	Edited by Fuchs for EMS
*/

private ["_missName","_coords","_vehicle"];

//Name of the Mission
_missName = "Bandit UH1H";
diag_log format["[EMS]: Major SM10 UH1H Mission has started."];

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A bandit UH1H has landed! Secure its fire power for yourself!", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds markers
[_coords,_missname] execVM DZMSAddMajMarker;
//Create the vehicles

_vehicle = createVehicle ["UH1H_DZE",[(_coords select 0) + 10, (_coords select 1) - 10,0],[], 0, "CAN_COLLIDE"];
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
[nil,nil,rTitleText,"Survivors have secured the UH1H helicopter!", "PLAIN",6] call RE;
diag_log format["[EMS]: Major SM10 UH1H Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;