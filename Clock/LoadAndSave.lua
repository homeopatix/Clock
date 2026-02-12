------------------------------------------------------------------------------------------
-- create or load the settings
------------------------------------------------------------------------------------------
function LoadSettings()
	local _settings = PatchDataLoad(Turbine.DataScope.Server, settingsFileName, settings);
    if (_settings ~= nil) then 
		settings = _settings; 
	end

------------------------------------------------------------------------------------------
	--- adding new vars in the settings file ---
------------------------------------------------------------------------------------------
	if( not settings.Alarm or
    not settings.isOptionsWindowVisible or
    not settings.Server or
    not settings.isAlarmDefined or
    not settings.ServerName or
    not settings.TimeZone or
    not settings.altEnable or
    not settings.isWindowVisibleAlways)then
    settings = {
        windowPosition = { 
            xPos = settings["windowPosition"]["xPos"], 
            yPos = settings["windowPosition"]["yPos"] 
        },
        IconPosition = { 
            xPosIcon = settings["IconPosition"]["xPosIcon"], 
            yPosIcon = settings["IconPosition"]["yPosIcon"] 
        },
        Alarm = { 
            hour = 0, 
            min = 0,
            timePos = "";
        },
        Server = { 
           TS = 10409
        },
        TimeZone = { 
            AMPM = false
        },
        ServerName = { 
            ServerName = "" 
        },
        isMinimizeEnabled = { 
            isMinimizeEnabled = true 
        },
        isWindowVisible = { 
            isWindowVisible = true 
        },
        isAlarmDefined = { 
            isAlarmDefined = false 
        },
        isOptionsWindowVisible = { 
            isOptionsWindowVisible = true 
        },
        escEnable = { 
            escEnable = true 
        },
        isWindowVisibleAlways = { 
            isWindowVisibleAlways = true
        },
        altEnable = { 
            altEnable = true 
        }
    };
    end
end
------------------------------------------------------------------------------------------
-- create the save settings
------------------------------------------------------------------------------------------
function SaveSettings()
	settings["windowPosition"]["xPos"] = tostring(ClockWindow:GetLeft());
    settings["windowPosition"]["yPos"] = tostring(ClockWindow:GetTop());
    settings["IconPosition"]["xPosIcon"] = tostring(MainMinimizedIcon:GetLeft());
   	settings["IconPosition"]["yPosIcon"] = tostring(MainMinimizedIcon:GetTop());
	settings["isMinimizeEnabled"]["isMinimizeEnabled"] = settings["isMinimizeEnabled"]["isMinimizeEnabled"];
	settings["isWindowVisible"]["isWindowVisible"] = settings["isWindowVisible"]["isWindowVisible"];
    settings["isWindowVisibleAlways"]["isWindowVisibleAlways"] = settings["isWindowVisibleAlways"]["isWindowVisibleAlways"];
	settings["escEnable"]["escEnable"] = settings["escEnable"]["escEnable"];
    settings["altEnable"]["altEnable"] = settings["altEnable"]["altEnable"];
    settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = settings["isOptionsWindowVisible"]["isOptionsWindowVisible"];

    settings["Server"]["TS"] = settings["Server"]["TS"];
    settings["Alarm"]["hour"] = settings["Alarm"]["hour"];
    settings["Alarm"]["min"] = settings["Alarm"]["min"];
    settings["isAlarmDefined"]["isAlarmDefined"] = settings["isAlarmDefined"]["isAlarmDefined"];
    settings["ServerName"]["ServerName"] = settings["ServerName"]["ServerName"];
    settings["TimeZone"]["AMPM"] = settings["TimeZone"]["AMPM"];
    settings["Alarm"]["timePos"] = settings["Alarm"]["timePos"];
   
   -- save the settings
	PatchDataSave( Turbine.DataScope.Server, settingsFileName, settings);
end