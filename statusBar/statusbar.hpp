class StatusBar
{    
		idd = 13372;
		fadein = 1;
		fadeout = 1;
		duration = 10e10;
		onLoad = "uiNamespace setVariable ['StatusBar', _this select 0]";
		onUnload = "uiNamespace setVariable ['StatusBar', objNull]";
		onDestroy = "uiNamespace setVariable ['StatusBar', objNull]";
		
		class controls
		{
			class HealthControl
			{    
				idc = 13373;
				type = 0;
				//style = 0 * 16;
				style = 2096;
				
				//x = safeZoneX + safeZoneW - 0.15; //right side
				x = safeZoneX;								// left side
				//y = 0;
				y = 1 / 2 - 0.15;
				w = 0.15;
				h = 0.15 * 3 / 4;
				font = "EtelkaNarrowMediumPro";
				sizeEx = 0.1;
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,0.6};
				text = "";
			};  
			class FoodControl : HealthControl
			{    
				idc = 13374;
				//y = 0.15;
				y = 1 / 2;
				text = "";
			}; 
			class WaterControl : HealthControl
			{    
				idc = 13375;
				//y = 0.30;
				y = 1 / 2 + 0.15;
				text = "";
			}; 
			class TemperatureControl : HealthControl
			{    
				idc = 13376;
				//y = 0.30;
				y = 1 / 2 + 0.30;
				text = "";
			}; 
		};	
};