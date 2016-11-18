	waitUntil {!(isNull (findDisplay 46))};
	disableSerialization;
	uiSleep 10;
	
	sb_hideExileIcons = {
	
		_display = uiNamespace getVariable "RscExileHUD";
		
		_statControl = _display displayCtrl 1301;
		_ctrl = _display displayCtrl 1301;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		
		_hungerValueControl = _display displayCtrl 1302;
		_ctrl = _display displayCtrl 1302;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		
		_hungerLabelControl = _display displayCtrl 1303;
		_ctrl = _display displayCtrl 1303;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		
		_thirstValueControl = _display displayCtrl 1304;
		_ctrl = _display displayCtrl 1304;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		
		_thirstLabelControl = _display displayCtrl 1305;
		_ctrl = _display displayCtrl 1305;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		
		_healthValueControl = _display displayCtrl 1306;
		_ctrl = _display displayCtrl 1306;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		_healthLabelControl = _display displayCtrl 1307;
		_ctrl = _display displayCtrl 1307;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		
		_environmentTemperatureValueControl = _display displayCtrl 1308;
		_ctrl = _display displayCtrl 1308;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		_environmentTemperatureLabelControl = _display displayCtrl 1309;
		_ctrl = _display displayCtrl 1309;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		
		_bodyTemperatureValueControl = _display displayCtrl 1310;
		_ctrl = _display displayCtrl 1310;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		_bodyTemperatureLabelControl = _display displayCtrl 1311;
		_ctrl = _display displayCtrl 1311;
		_ctrl ctrlSetPosition [-10,-10,0,0];
		_ctrl ctrlCommit 0;
		
	};
	
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


	sb_fadeIn = {
		_ctrl = _this select 0;
		//disappear
		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 0;
		//fadein
		_ctrl ctrlSetFade 0;
		_ctrl ctrlCommit 1;
	
	};
	
	sb_fadeOut = {
		_ctrl = _this select 0;
		//disappear
		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 1;
	
	};

	sb_checkTemp = {
			
			_display = (uiNamespace getVariable "StatusBar");
			
			_bodyTemperature = [ExileClientPlayerAttributes select 5, 1] call ExileClient_util_math_round;
	
			if ( (_bodyTemperature< 36) && ((player getVariable "sb_isCold") isEqualTo false) ) then {
				player setVariable["sb_isCold",true];
				(_display displayCtrl 13376) ctrlSetText "statusBar\icons\status\cold.paa";
				[(_display displayCtrl 13376)] call sb_fadeIn;
			};
			
			if ((_bodyTemperature >= 36) && ((player getVariable "sb_isCold") isEqualTo true)) then {
				player setVariable["sb_isCold",false];
				[(_display displayCtrl 13376)] call sb_fadeOut;
			};
	
	};
	
	sb_updateIcons = {

		_iconh = 			_this select 0;
		_iconf = 			_this select 1;
		_iconw = 			_this select 2;
		

		_display = (uiNamespace getVariable "StatusBar");
		
		if (_iconh != "-1") then {
			(_display displayCtrl 13373) ctrlSetText format["statusBar\icons\health\%1.paa",_iconh];
			[(_display displayCtrl 13373)] call sb_fadeIn;
		};
		
		if (_iconf != "-1") then {
			(_display displayCtrl 13374) ctrlSetText format["statusBar\icons\hunger\%1.paa",_iconf];
			[(_display displayCtrl 13374)] call sb_fadeIn;
		};
		
		if (_iconw != "-1") then {
			(_display displayCtrl 13375) ctrlSetText format["statusBar\icons\thirst\%1.paa",_iconw];
			[(_display displayCtrl 13375)] call sb_fadeIn;
		};
		
	};
	
	
	sb_init = {
		_health = round ((1 - (damage player)) * 100);
		_hunger = round (ExileClientPlayerAttributes select 2);
		_thirst = round (ExileClientPlayerAttributes select 3);
		
		_hpIcon = [_health] call sb_getIcon;
		_hungerIcon = [_hunger] call sb_getIcon;
		_thirstIcon = [_thirst] call sb_getIcon;

		_lastHp = _health;
		_lastHunger = _hunger;
		_lastThirst = _thirst;
		
		player setVariable ["sb_lastArray", [_lastHp,_lastHunger,_lastThirst]];
		player setVariable ["sb_isCold",false];
		_rscLayer = "StatusBar" call BIS_fnc_rscLayer;
		_rscLayer = cutRsc["StatusBar","PLAIN",1,false];
		[_hpIcon,_hungerIcon,_thirstIcon,true] call sb_updateIcons;
		[] call sb_checkTemp;

		[] call sb_hideExileIcons;
		
	};
	
	
	sb_maintain = {
		_health = round ((1 - (damage player)) * 100);
		_hunger = round (ExileClientPlayerAttributes select 2);
		_thirst = round (ExileClientPlayerAttributes select 3);
		
		_statchanged = false;
		
		_lastArray = player getVariable "sb_lastArray";
		_currentArray = [_health,_hunger,_thirst];
		
		_toUpdate = [0,0,0];
		for "_i" from 0 to 2 do
		{
			_last = [(_lastArray select _i)] call sb_getIcon;
			_cur = [(_currentArray select _i)] call sb_getIcon;
			
			if (_last != _cur) then {
				_toUpdate set [_i,1];
				_statchanged = true;
			};
			
		};
		
		
		
		if (_statchanged) then {
			
			player setVariable ["sb_lastArray", [_health,_hunger,_thirst]];
			
			_currentHp = [_health] call sb_getIcon;
			_currentFood =  [_hunger] call sb_getIcon;
			_currentThirst = [_thirst] call sb_getIcon;
			
			_upHp = "-1";
			_upHunger = "-1";
			_upThirst = "-1";
			
			if ((_toUpdate select 0) == 1) then {
				_upHp = _currentHp;
			};
			if ((_toUpdate select 1) == 1) then {
				_upHunger = _currentFood;
			};
			if ((_toUpdate select 2) == 1) then {
				_upThirst = _currentThirst;
			};
		
			[_upHp,_upHunger,_upThirst] call sb_updateIcons;
			
		};
			[] call sb_checkTemp;
			//[] call sb_hideExileIcons;
	};
	
	
	diag_log "starting statusbar";
	[] call sb_init;
	[0.5, sb_maintain, [], true] call ExileClient_system_thread_addtask;
	uiSleep 5;
	[] call sb_hideExileIcons;


