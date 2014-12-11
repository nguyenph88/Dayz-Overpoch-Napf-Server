/*
	Adds a marker for Minor Missions. Only runs once.
	DZMSMarkerLoop.sqf keeps this marker updated.
	Usage: [coordinates,missionname]
*/
private["_nul","_nil"];
DZMSMinCoords = _this select 0;
DZMSMinName = _this select 1;

_nul = createMarker ["DZMSMinMarker", DZMSMinCoords];
"DZMSMinMarker" setMarkerColor "ColorGreen";
"DZMSMinMarker" setMarkerShape "ELLIPSE";
"DZMSMinMarker" setMarkerBrush "Solid";
"DZMSMinMarker" setMarkerSize [125,125];
_nil = createMarker ["DZMSMinDot", DZMSMinCoords];
"DZMSMinDot" setMarkerColor "ColorBlack";
"DZMSMinDot" setMarkerType "mil_dot";
"DZMSMinDot" setMarkerText DZMSMinName;