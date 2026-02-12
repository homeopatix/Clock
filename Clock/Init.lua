-- Plugin's name --
pluginName = "Clock";

-- File names --
settingsFileName = "Clock_Settings";

-- Default settings --
settings = {
    windowPosition = { 
        xPos = 0, 
        yPos = 0 
    },
    IconPosition = { 
        xPosIcon = 100, 
        yPosIcon = 100 
    },
    Alarm = { 
        hour = 0, 
        min = 0,
        timePos = "";
    },
    Server = { 
        TS = 0
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
    isOptionsWindowVisible = { 
        isOptionsWindowVisible = true 
    },
    isAlarmDefined = { 
        isAlarmDefined = false 
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

-- Resources settings --
ResourcePath = "Homeopatix/Clock/Resources/";

Images = {
	MinimizedIcon = ResourcePath .. "Clock.tga",
};

-- RGB color codes --
rgb = {
    start = "<rgb=#DAA520>",
    gold = "<rgb=#FFD700>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};

-- Load settings --
LoadSettings();