------------------------------------------------------------------------------------------
-- import librarys
------------------------------------------------------------------------------------------
import "Homeopatix.Clock.Librarys";

CreateLocalizationInfo();
------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
if(settings["isWindowVisibleAlways"]["isWindowVisibleAlways"] == true)then 
	settings["isWindowVisible"]["isWindowVisible"] = true ;
else
	settings["isWindowVisible"]["isWindowVisible"] = false ;
end
settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
local nowtime = Turbine.Engine.GetLocalTime();
local gametime = Turbine.Engine.GetGameTime();
local adjust = (nowtime - (nowtime - gametime + settings["Server"]["TS"]))% 11160;
if (adjust <= 6140) then 
	sDay = "day";
else 
	sDay = "night"; 
end

CreateMainWindow(sDay);
GenerateOptionsWindow();

------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
ClosingTheWindow();

--Turbine.Shell.WriteLine(Turbine.Engine:GetServerName());
------------------------------------------------------------------------------------------
-- handle minimizeIcon
------------------------------------------------------------------------------------------
if(settings["isWindowVisible"]["isWindowVisible"] == true)then
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, ClockWindow:SetVisible(true));
else
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, ClockWindow:SetVisible(false));
end

MainMinimizedIcon:SetPosition(settings["IconPosition"]["xPosIcon"], settings["IconPosition"]["yPosIcon"]);
MainMinimizedIcon:SetZOrder(0);
MainMinimizedIcon.PositionChanged = function()
	settings["IconPosition"]["xPosIcon"] = MainMinimizedIcon:GetLeft();
	settings["IconPosition"]["yPosIcon"] = MainMinimizedIcon:GetTop();
	SaveSettings();
end
