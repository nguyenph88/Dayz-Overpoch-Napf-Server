/*
	Usage: [_crate,"type"] execVM "dir\DZMSBox.sqf";
		_crate is the crate to fill
		"type" is the type of crate
		"type" can be weapons or medical
*/
_crate = _this select 0;
_type = _this select 1;

// Clear the current cargo
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// Define lists. Some lists are defined in DZMSWeaponCrateList.sqf in the ExtConfig.
_bpackList = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];
_gshellList = ["HandGrenade_west","FlareGreen_M203","FlareWhite_M203"];
_medical = ["ItemBandage","ItemBloodbag","ItemMorphine","ItemEpinephrine","ItemPainkiller","ItemWaterbottle","FoodMRE","ItemAntibiotic","ItemBloodbag"];


//////////////////////////////////////////////////////////////////
// Medical Crates
if (_type == "medical") then {
	// load medical
	_scount = count _medical;
	for "_x" from 0 to DEFMedicalRate1 do {
		_sSelect = floor(random _sCount);
		_item = _medical select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random DEFMedicalRate1))];
	};
};

/* EMS - GOLD MISSION - DEFENT */
if (_type == "gold") then {
	// load tools
	_scount = count EMSGold;
	for "_x" from 0 to DEFGoldRate do {
		_sSelect = floor(random _sCount);
		_item = EMSGold select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random DEFGoldRate))];
	};
};
/* EMS GOLD MISSION - DEFENT */

/* EMS - EXTRA MEDICAL VARIBLE - DEFENT */
if (_type == "meds") then {
	// load medical
	_scount = count EMSMedicals;
	for "_x" from 0 to DEFMedicalRate2 do {
		_sSelect = floor(random _sCount);
		_item = EMSMedicals select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random DEFMedicalRate2))];
	};
};
/* EMS - EXTRA MEDICAL SUPPLIES - DEFENT */
///////////////////////////////////////////////////////////////////
// Weapon Crates
if (_type == "weapons") then {
	// load grenades
	_scount = count _gshellList;
	for "_x" from 0 to DEFGranadeRate do {
		_sSelect = floor(random _sCount);
		_item = _gshellList select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random DEFGranadeRate))];
	};
   
	// load packs
	_scount = count _bpackList;
	for "_x" from 0 to DEFBackPackRate do {
		_sSelect = floor(random _sCount);
		_item = _bpackList select _sSelect;
		_crate addBackpackCargoGlobal [_item,DEFBackPackRate];
	};
	 
	// load pistols
	_scount = count DZMSpistolList;
	for "_x" from 0 to DEFMPistolRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSpistolList select _sSelect;
		_crate addWeaponCargoGlobal [_item,DEFMPistolRate];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random DEFMPistolAmmoRate))];
		};
	};

	//load sniper
	_scount = count DZMSsniperList;
	for "_x" from 0 to DEFMSniperRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSsniperList select _sSelect;
		_crate addWeaponCargoGlobal [_item,DEFMSniperRate];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random DEFMSniperAmmoRate))];
		};
	};

	//load mg
	_scount = count DZMSmgList;
	for "_x" from 0 to DEFSMGRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSmgList select _sSelect;
		_crate addWeaponCargoGlobal [_item,DEFSMGRate];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random DEFSMGAmmoRate))];
		};
	};

	//load primary
	_scount = count DZMSprimaryList;
	for "_x" from 0 to DEFMPrimaryRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSprimaryList select _sSelect;
		_crate addWeaponCargoGlobal [_item,DEFMPrimaryRate];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random DEFMPrimaryAmmoRate))];
		};
	};
};

///////////////////////////////////////////////////////////////////
// Epoch Supply Crates
if (_type == "supply") then {
	// load tools
	_scount = count DZMSConTools;
	for "_x" from 0 to DEFToolsRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSConTools select _sSelect;
		_crate addWeaponCargoGlobal [_item, DEFToolsRate];
	};
	
	// load construction
	_scount = count DZMSConSupply;
	for "_x" from 0 to DEFBuildSupplyRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSConSupply select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random DEFBuildSupplyRate))];
	};
};

///////////////////////////////////////////////////////////////////
// EMS Boxes/Crates
if (_type == "weap") then {
	//load primary
	_scount = count  EMSWeaponry;
	for "_x" from 0 to EMSWeaponryRate do {
		_sSelect = floor(random _sCount);
		_item =  EMSWeaponry select _sSelect;
		_crate addWeaponCargoGlobal [_item,EMSWeaponryRate];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random EMSWeaponryAmmoRate))];
		};
	};
		_scount = count DZMSpistolList;
	for "_x" from 0 to DEFMPistolRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSpistolList select _sSelect;
		_crate addWeaponCargoGlobal [_item,DEFMPistolRate];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random DEFMPistolAmmoRate))];
		};
	};

	//load sniper
	_scount = count DZMSsniperList;
	for "_x" from 0 to DEFMSniperRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSsniperList select _sSelect;
		_crate addWeaponCargoGlobal [_item,DEFMSniperRate];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random DEFMSniperAmmoRate))];
		};
	};

	//load mg
	_scount = count DZMSmgList;
	for "_x" from 0 to DEFSMGRate do {
		_sSelect = floor(random _sCount);
		_item = DZMSmgList select _sSelect;
		_crate addWeaponCargoGlobal [_item,DEFSMGRate];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random DEFSMGAmmoRate))];
		};
	};
};
