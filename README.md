# Exile-Dynamic-StatusIcons

My first ever released script that's written for the GUI, so feel free to criticize :D 

### Installation:

    Copy the statusBar folder to mission root.
    Open description.ext, look for class RscTitles
    Add:    #include "statusBar\statusbar.hpp"
    If there is no RscTitles class add:
    class RscTitles {
	    #include "statusBar\statusbar.hpp"
    }
    open initPlayerLocal.sqf
    Add: [] execVM "statusBar\statusBar.sqf";
    RePBO your mission file



