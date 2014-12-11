// blood transfusion
player_selectSlot = compile preprocessFileLineNumbers "custom\ui_selectSlot.sqf";
player_useMeds =  compile preprocessFileLineNumbers "custom\player_useMeds.sqf";


// snap building pro
//if (!isDedicated) then {
	player_build = compile preprocessFileLineNumbers "custom\snap_pro\player_build.sqf";
	snap_build = compile preprocessFileLineNumbers "custom\snap_pro\snap_build.sqf";
	dayz_spaceInterrupt = compile preprocessFileLineNumbers "custom\snap_pro\dayz_spaceInterrupt.sqf"; // group + snap
//	player_switchModel = compile preprocessFileLineNumbers "custom\player_switchModel.sqf"; //group ===>>> it is used in ZSC foolder
//};

// fn_selfaction is in ZSC

// lift-tow logistic
call compile preprocessFileLineNumbers "logistic\init.sqf";

// new HUD
player_updateGui  = compile preprocessFileLineNumbers "dayz_code\compile\player_updateGui.sqf";