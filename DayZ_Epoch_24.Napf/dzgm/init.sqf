waitUntil {uiSleep 0.25;(!isNil "PVDZE_plr_LoginRecord")};
if (count units group player > 1) then {[player] join grpNull;};
//#include "\ca\editor\Data\Scripts\dikCodes.h"
//keyboard_keys set [DIK_LWIN,{if (tagname) then {tagname = false;titleText ["\n\nName tags OFF","PLAIN DOWN"];titleFadeOut 4;} else {tagname = true;titleText ["\n\nName tags ON","PLAIN DOWN"];titleFadeOut 4;};_handled = true;}];
//keyboard_keys set [(actionKeys "TacticalView") select 0,{_handled = true;}];
//keyboard_keys set [DIK_RWIN,{if (dialog) then {closeDialog 0;groupManagementActive = false;} else {execVM "dzgm\loadGroupManagement.sqf";};_handled = true;}];

acceptGroupInvite = compile preprocessFileLineNumbers "dzgm\acceptGroupInvite.sqf";
declineGroupInvite = compile preprocessFileLineNumbers "dzgm\declineGroupInvite.sqf";
disbandGroup = compile preprocessFileLineNumbers "dzgm\disbandGroup.sqf";
inviteToGroup = compile preprocessFileLineNumbers "dzgm\inviteToGroup.sqf";
kickFromGroup = compile preprocessFileLineNumbers "dzgm\kickFromGroup.sqf";
leaveGroup = compile preprocessFileLineNumbers "dzgm\leaveGroup.sqf";
mapLoop = compile preprocessFileLineNumbers "dzgm\mapLoop.sqf";
playerSelectChange = compile preprocessFileLineNumbers "dzgm\playerSelectChange.sqf";
updatePlayerList = compile preprocessFileLineNumbers "dzgm\updatePlayerList.sqf";
tagName = true;
	
if (isNil "dzgmInit") then {call compile preprocessFileLineNumbers "dzgm\icons.sqf";};
uiSleep 1;
[] spawn dzgmInit;
[] spawn mapLoop;
systemChat "Right click on radio to open group management";