	waitUntil {!(isNull (findDisplay 46))};
	disableSerialization;
	uiSleep 2;

	
	sb_getIcon = {
		_value = _this select 0;
		_icon = "100";
		
		if (_value >= 100 ) then 							{ _icon ="100";	};
		if (_value >=90 && _value < 100 ) then 	{ _icon ="90";		};
		if (_value >=80 && _value < 90 ) then 		{ _icon ="80";		};
		if (_value >=70 && _value < 80 ) then 		{ _icon ="70";		};
		if (_value >=60 && _value < 70 ) then 		{ _icon ="60";		};
		if (_value >=50 && _value < 60 ) then 		{ _icon ="50";		};
		if (_value >=40 && _value < 50 ) then 		{ _icon ="40";		};
		if (_value >=30 && _value < 40 ) then 		{ _icon ="30";		};
		if (_value >=20 && _value < 30 ) then 		{ _icon ="20";		};
		if (_value >=10 && _value < 20 ) then 		{ _icon ="10";		};
		if (_value >=1 && _value < 10 ) then 		{ _icon ="1";		};
		if (_value < 1 ) then 								{ _icon ="0";		};
		
		_icon
	};



	sb_updateIcons = {

		_iconh = _this select 0;
		_iconf = _this select 1;
		_iconw = _this select 2;
		
		_rscLayer = "StatusBar" call BIS_fnc_rscLayer;
		_rscLayer cutRsc["StatusBar","PLAIN",1,false];
		((uiNamespace getVariable "StatusBar")displayCtrl 13373)ctrlSetText format["statusBar\icons\health\%1.paa",_iconh];
		((uiNamespace getVariable "StatusBar")displayCtrl 13374)ctrlSetText format["statusBar\icons\hunger\%1.paa",_iconf];
		((uiNamespace getVariable "StatusBar")displayCtrl 13375)ctrlSetText format["statusBar\icons\thirst\%1.paa",_iconw];
		
	};
	
	
	sb_init = {
		_health = round ((1 - (damage player)) * 100);
		_hunger = round (ExileClientPlayerAttributes select 2);
		_thirst = round (ExileClientPlayerAttributes select 3);

		_hpIcon = [_health] call sb_getIcon;
		_hungerIcon = [_hunger] call sb_getIcon;
		_thirstIcon = [_thirst] call sb_getIcon;

		_rscLayer = "StatusBar" call BIS_fnc_rscLayer;
		_rscLayer = cutRsc["StatusBar","PLAIN",1,false];
		[_hpIcon,_hungerIcon,_thirstIcon] call sb_updateIcons;


		_lastHp = _health;
		_lastHunger = _hunger;
		_lastThirst = _thirst;
		
		player setVariable ["sb_lastArray", [_lastHp,_lastHunger,_lastThirst]];
	};
	
	
	sb_maintain = {
		_health = round ((1 - (damage player)) * 100);
		_hunger = round (ExileClientPlayerAttributes select 2);;
		_thirst = round (ExileClientPlayerAttributes select 3);
		//_bodyTemperature = [ExileClientPlayerAttributes select 5, 1] call ExileClient_util_math_round;
		
		_statchanged = false;
		_lastArray = player getVariable "sb_lastArray";
		_currentArray = [_health,_hunger,_thirst];
		
		for "_i" from 0 to 2 do
		{
			_last = [(_lastArray select _i)] call sb_getIcon;
			_cur = [(_currentArray select _i)] call sb_getIcon;
			
			if (_last != _cur) then {
				_statchanged = true;
			};
			
		};
		
		if (_statchanged) then {

			player setVariable ["sb_lastArray", [_health,_hunger,_thirst]];
		
			_currentHp = [_health] call sb_getIcon;
			_currentFood =  [_hunger] call sb_getIcon;
			_currentThirst = [_thirst] call sb_getIcon;
			
			[_currentHp,_currentFood,_currentThirst] call sb_updateIcons;
			
		};
	};
	
	[] call sb_init;
	[0.5, sb_maintain, [], true] call ExileClient_system_thread_addtask;


