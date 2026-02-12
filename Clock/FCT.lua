------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingTheWindow()
	function ClockWindow:Closing(sender, args)
		settings["isWindowVisible"]["isWindowVisible"] = false;
		SaveSettings();
	end
end
function ClosingTheOptionsWindow()
	function OptionsWindow:Closing(sender, args)
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
		SaveSettings();
	end
end