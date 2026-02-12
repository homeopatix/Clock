
ClockCommand = Turbine.ShellCommand();

------------------------------------------------------------------------------------------
-- commands
------------------------------------------------------------------------------------------
function ClockCommand:Execute( command, arguments )

-- Turn arguments to lower case characters --
	arguments = string.lower(arguments);

	-- Help command--
	if ( arguments == "help" ) then
		Turbine.Shell.WriteLine(Strings.PluginHelp);
	------------------------------------------------------------------------------------------
	--  show
	------------------------------------------------------------------------------------------
	elseif ( arguments == "show" ) then
		--Turbine.Shell.WriteLine("Show the Clock Window");
		ClockWindow:SetVisible(true);
		settings["isWindowVisible"]["isWindowVisible"] = true;
		SaveSettings();
	------------------------------------------------------------------------------------------
	--  hide
	------------------------------------------------------------------------------------------
	elseif ( arguments == "hide" ) then
		--Turbine.Shell.WriteLine("Hide the Clock Window");
		ClockWindow:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
		SaveSettings();
------------------------------------------------------------------------------------------
-- toggle command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "toggle" ) then
		if(settings["isWindowVisible"]["isWindowVisible"] == true)then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowHide);
			ClockWindow:SetVisible(false);
			settings["isWindowVisible"]["isWindowVisible"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowShow);
			ClockWindow:SetVisible(true);
			settings["isWindowVisible"]["isWindowVisible"] = true;
		end
		SaveSettings();
	------------------------------------------------------------------------------------------
	--  active or deactive the escape key
	------------------------------------------------------------------------------------------
	elseif ( arguments == "esc" ) then
		if(settings["escEnable"]["escEnable"] == true) then
			Turbine.Shell.WriteLine(Strings.PluginName .. " - " .. Strings.PluginEscDesable);
			settings["escEnable"]["escEnable"] = false;
		else
			Turbine.Shell.WriteLine(Strings.PluginName .. " - " .. Strings.PluginEscEnable);
			settings["escEnable"]["escEnable"] = true;
		end
		SaveSettings();
	------------------------------------------------------------------------------------------
	-- alt command--
	------------------------------------------------------------------------------------------
	elseif ( arguments == "alt" ) then
		if(settings["altEnable"]["altEnable"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltDesable);
			settings["altEnable"]["altEnable"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltEnable);
			settings["altEnable"]["altEnable"] = true;
		end
		SaveSettings();
	------------------------------------------------------------------------------------------
	--  options
	------------------------------------------------------------------------------------------
	elseif ( arguments == "options" ) then
		Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginOptionShowWindow);
		OptionsWindow:SetVisible(true);
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = true;
		SaveSettings();
	end
end

Turbine.Shell.AddCommand( "Cl;Clock", ClockCommand );