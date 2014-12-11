(vehicle player);
        (vehicle player) setdir _forwardCurrentDirection;
        _vehicle setVelocity [0,0,-4];
    };
};

toggle_hover =
{
    if (isnil "hovering") then
    {
        hovering = true;
        titleText ["Hovering ON","PLAIN DOWN"]; titleFadeOut 4;
        hoverPos = getPosATL (vehicle player);
    }
    else
    {
        hovering = nil;
        titleText ["Hovering OFF","PLAIN DOWN"]; titleFadeOut 4;
        hoverPos = nil;
    };
};

if (flying2) then 
{
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has ENABLED flying",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};

    keyForward = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 17) then {call move_forward;}"];     //W - Forward
    keyLeft = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 30) then {call move_left;}"];         //A - Left
    keyBackward = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 31) then {call move_backward;}"];     //S - Backward
    keyRight = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 32) then {call move_right;}"];         //D - Right
    keyUp = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 16) then {call move_up;}"];         //Q - Up
    keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 44) then {call move_down;}"];         //Z - Down
    keyHover = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 57) then {call toggle_hover;}"];     //SpaceBar - Toggle Hover
} else {
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has DISABLED flying",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};

    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyForward];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyLeft];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyBackward];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyRight];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyUp];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyDown];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyHover];
};

while {flying2} do
{
    if (!isNil "hovering") then
    {
		(vehicle player) setvelocity [0,0,0.2];
    };
	Sleep 0.01;
};
hovering = nil;
hoverPos = nil;