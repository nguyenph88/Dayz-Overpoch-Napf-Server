/*
	DayZ Mission System Config by Vampire
	DZMS: https://github.com/SMVampire/DZMS-DayZMissionSystem
*/


/*
	Loot rate edit by Defent
	How to use:
	The rate is a random value between 0 and the value you set here.
	Higher value equals higher loot and chance of loot. Try keeping it balanced.
	Recommended values would be around 5-15, depending on what you want to be more frequent than others.
*/

// WEAPON LOOT RATE
/* Set the loot rate of rifles */
DEFRifleRate = 2;
/* Set the loot rate of Small Machine gun */
DEFSMGRate = 4;
/* Set the loot rate of pistols */
DEFMPistolRate = 2;
/* Set the loot rate of machine guns */
DEFMGRate = 4;
/* Set the loot rate of sniper rifles */
DEFMSniperRate = 2;
/* Set the loot rate of primary - check files for more regarding this*/
DEFMPrimaryRate = 3;
/* Set the loot rate of grenades */
DEFGranadeRate = 1;
/* EMS WEAPON RATE - THIS ONE IS IMPORTANT */
EMSWeaponryRate = 6;

// AMMO LOOT RATE
/* Set the loot rate of rifle ammo */
DEFRifleAmmoRate = 3;
/* Set the loot rate of rifle ammo */
DEFSMGAmmoRate = 3;
/* Set the loot rate of pistol ammo */
DEFMPistolAmmoRate = 3;
/* Set the loot rate of machine gun ammo */
DEFMGAmmoRate = 3;
/* Set the loot rate of sniper rifle ammo*/
DEFMSniperAmmoRate = 3;
/* Set the loot rate of primary weapon ammo */
DEFMPrimaryAmmoRate = 3;
/* EMS WEAPON RATE - THIS ONE IS IMPORTANT */
EMSWeaponryAmmoRate = 3;

// MISC LOOT RATE
/* Set the loot rate of Gold from missions */
DEFGoldRate = 5;
/* These two should preferably have the same value */
DEFMedicalRate1 = 6;
DEFMedicalRate2 = 6;
/* Set the loot rate of building supplies */
DEFBuildSupplyRate = 12;
/* Set the loot rate of construction tools */
DEFToolsRate = 2;
/* Set the loot rate of Backpacks */
DEFBackPackRate = 1;

/* You can manually edit the loot rate in DZMSBox.sqf! */

/* Remove ammo from mission vehicles. */
/* Default is false. */
DEFRemVehAmmo = false;

///////////////////////////////////////////////////////////////////////
// Do you want your players to gain humanity from killing mission AI?
DZMSMissHumanity = true;

// How Much Humanity?
DZMSCntHumanity = 100;

// Do You Want AI to use NVGs?
//(They are deleted on death)
DZMSUseNVG = true;

// Do you want AI to use RPG7V's?
//(Only one unit per group spawn will have one)
DZMSUseRPG = false;

// Do you want AI kills to count as bandit kills?
DZMSCntBanditKls = false;

// Do you want AI to disappear instantly when killed?
DZMSCleanDeath = false;

// Do you want AI that players run over to not have gear?
// (If DZMSCleanDeath is true, this doesn't matter)
DZMSRunGear = false;

// How long before bodies disappear? (in seconds) (default = 2400)
DZMSBodyTime = 2400;

// Percentage of AI that must be dead before mission completes (default = 0)
//( 0 is 0% of AI / 0.50 is 50% / 1 is 100% )
DZMSRequiredKillPercent = 0;

// How long in seconds before mission scenery disappears (default = 1800 / 0 = disabled)
DZMSSceneryDespawnTimer = 1800;

// Should crates despawn with scenery? (default = false)
DZMSSceneryDespawnLoot = false;

//////////////////////////////////////////////////////////////////////////////////////////
// You can adjust the weapons that spawn in weapon crates inside DZMSWeaponCrateList.sqf
// You can adjust the AI's gear inside DZMSAIConfig.sqf in the ExtConfig folder also.
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
// Do you want to use static coords for missions?
// Leave this false unless you know what you are doing.
DZMSStaticPlc = false;

// Array of static locations. X,Y,Z
DZMSStatLocs = [
[0,0,0],
[0,0,0]
];

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Do you want vehicles from missions to save to the Database? (this means they will stay after a restart)
// If False, vehicles will disappear on restart. It will warn a player who gets inside of a vehicle.
// This is experimental, and off by default in this version.
DZMSSaveVehicles = false;

/////////////////////////////////////////////////////////////////////////////////////////////
// These are arrays of vehicle classnames for the missions.
// Adjust to your liking.

//Armed Choppers (Huey)
DZMSChoppers = ["UH1H_DZ","Mi17_DZ"];

//Small Vehicles (Humvees)
DZMSSmallVic = ["hilux1_civil_3_open_EP1","SUV_TK_CIV_EP1","HMMWV_DZ","UAZ_Unarmed_UN_EP1"];

//Large Vehicles (Urals)
DZMSLargeVic = ["Ural_TK_CIV_EP1","Ural_INS"];

/*///////////////////////////////////////////////////////////////////////////////////////////
There are two types of missions that run simultaneously on a the server.
The two types are Major and Minor missions.

Major missions have a higher AI count, but also have more crates to loot.
Minor missions have less AI than Major missions, but have crates that reflect that.

Below is the array of mission file names and the minimum and maximum times they run.
Do not edit the Arrays unless you know what you are doing.
*/
DZMSMajorArray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8","SM9","SM10","SM11","SM12","SM13"];
DZMSMinorArray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8","SM9","SM10","SM11","SM12","SM13"];

/////////////////////////////////////////////////////////////////////////////////////////////
// The Minumum time in seconds before a major mission will run.
// At least this much time will pass between major missions. Default = 650 (10.8 Minutes)
DZMSMajorMin = 650;

// Maximum time in seconds before a major mission will run.
// A major mission will always run before this much time has passed. Default = 2000 (33.33 Minutes)
DZMSMajorMax = 1000;

// Time in seconds before a minor mission will run.
// At least this much time will pass between minor missions. Default = 600 (10 Minutes)
DZMSMinorMin = 600;

// Maximum time in seconds before a minor mission will run.
// A minor mission will always run before this much time has passed. Default = 990 (16.5 Minutes)
DZMSMinorMax = 650;

// Blacklist Zone Array -- missions will not spawn in these areas
// format: [[x,y,z],radius]
// Ex: [[06325,07807,0],300] //Starry Sobor
DZMSBlacklistZones = [
	[[0,0,0],500]
];

/*=============================================================================================*/
// Do Not Edit Below This Line
/*=============================================================================================*/
DZMSVersion = "1.1FIN";
