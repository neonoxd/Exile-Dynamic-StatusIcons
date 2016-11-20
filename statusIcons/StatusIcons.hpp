class RscControlsGroup {
    type = 15;
    idc = -1;
    style = 0;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
 
    class VScrollbar {
        color[] = {1,1,1,1};
        width = 0.021000;
        autoScrollSpeed = -1;
        autoScrollDelay = 5;
        autoScrollRewind = 0;
    };
 
    class HScrollbar {
        color[] = {1, 1, 1, 1};
        height = 0.028;
    };
 
    class ScrollBar { //for ARMA 2
        color[] = {1,1,1,0.600000};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.300000};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
    };
 
    class Controls {};
};
class RscText{
	colorText[]=
						{"1",	"1","1",0.6};
						text="";
						font="EtelkaNarrowMediumPro";
						shadow=0;
						fixedWidth=0;
						type = 0;
						linespacing=0;
						style = 2096;
						sizeEx="11 * pixelH";
						colorBackground[] = {0,0,0,0};
	
};

class StatusIcons {
	
		idd = 13379;
		fadein = 1;
		fadeout = 1;
		duration = 99999;
		onLoad = "uiNamespace setVariable ['StatusIcons', _this select 0]";
		onUnload = "uiNamespace setVariable ['StatusIcons', objNull]";
		onDestroy = "uiNamespace setVariable ['StatusIcons', objNull]";
		
		class controls
		{
			class Stats: RscControlsGroup
			{
				idc=13370;
				x = safeZoneX;
				y = 1 / 2 - 0.15;
				w = 0.1721618 * safezoneW;
				h = 0.560125 * safezoneH;
				colorBackground[] = {0,0,0,0};
				
				class controls
				{
					class HealthIcon: RscText
					{
						idc=13373;
						x="0";
						y="0";
						w = 0.15;
						h = 0.15 * 3 / 4;
					};
					class HungerIcon: HealthIcon {
						idc=13374;
						y = 0.15;
						text="";
					};
					class ThirstIcon: HealthIcon {
						idc=13375;
						y = 0.30;
						text="";
					};
					class ColdIcon: HealthIcon {
						idc=13376;
						y = 0.45;
						text="";
					};
					
				};
			};
		};	
};