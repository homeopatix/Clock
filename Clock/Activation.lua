-- Activate Plugin --
Plugins[pluginName].Load = function()
	notification("version " .. Plugins[pluginName]:GetVersion() .. " by Homeopatix");
end

-- Unload Plugin --
Plugins[pluginName].Unload = function()
	SaveSettings();
	notification("Unactivated");
end