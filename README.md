# Exile-Dynamic-StatusIcons

I present you my first ever release.
A Dynamic Status Icons script for EXILE Mod.

Displaying basic stats for players, functioning as a replacement for Exile's default Status HUD.

### Installation:

    Copy the statusIcons & overrides folders to mission root.
    Open description.ext, look for class RscTitles
    Add:    #include "statusIcons\StatusIcons.hpp"
    If there is no RscTitles class add:
    class RscTitles {
	    #include "statusIcons\StatusIcons.hpp"
    };
    open initPlayerLocal.sqf
    Add: [] execVM "statusIcons\statusIcons.sqf";
	
	Open config.cpp.
	Look for CfgExileCustomCode class.
	Add: ExileClient_gui_hud_event_onKeyDown = "overrides\ExileClient_gui_hud_event_onKeyDown.sqf";
	
    RePBO your mission file



