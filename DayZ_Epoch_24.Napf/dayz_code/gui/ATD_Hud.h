#define CT_STATIC 0
#define ST_LEFT           0x00
#define ST_PICTURE        48

class RscStructuredText {
	access = ReadAndWrite;
	type = 13;
	idc = -1;
	style = 2; 
	font = "Zeppelin33";
	size = "0.025 * safezoneH";
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	text = "";
	shadow = 1;
	class Attributes {
		align = "center";
		valign = "middle";	
	};
};
