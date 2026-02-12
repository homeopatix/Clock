------------------------------------------------------------------------------------------
-- create the Alarm window
------------------------------------------------------------------------------------------
local timerAlarm = 0;
local windowVisible = false;
function CreateAlarmWindow(hourAlarm, minAlarm)
	local nowtime = Turbine.Engine.GetLocalTime();
	local gametime = Turbine.Engine.GetGameTime();
	local adjust = (nowtime - (nowtime - gametime + settings["Server"]["TS"]))% 11160;
	if (adjust <= 6140) then 
		sDay = "day";
	else 
		sDay = "night"; 
	end

	AlarmWindow=Turbine.UI.Extensions.SimpleWindow();
	AlarmWindow:SetSize(604,300); 
	AlarmWindow:SetZOrder(1000);
	AlarmWindow:SetBackColor(Turbine.UI.Color( .01, .5, .7, .5));
	AlarmWindow:SetVisible(false);
	AlarmWindow:SetWantsUpdates(true);

	AlarmWindow:SetPosition((Turbine.UI.Display:GetWidth()-AlarmWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-AlarmWindow:GetHeight())/2);

	AlarmWindow.Message1=Turbine.UI.Label(); 
	AlarmWindow.Message1:SetParent(AlarmWindow); 
	AlarmWindow.Message1:SetSize(598,50); 
	AlarmWindow.Message1:SetPosition(AlarmWindow:GetWidth()/2 - 299, AlarmWindow:GetHeight()/2 - 145); 
	AlarmWindow.Message1:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	AlarmWindow.Message1:SetForeColor(Turbine.UI.Color.Red); 
	AlarmWindow.Message1:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	AlarmWindow.Message1:SetText(Strings.OptionsAlarm6); 
	AlarmWindow.Message1:SetZOrder(10000);
	AlarmWindow.Message1:SetMouseVisible(true);
	AlarmWindow.Message1:SetBackColor(Turbine.UI.Color( .6, .5, .7, .5));

	if(settings["TimeZone"]["AMPM"] == false)then
		if (tonumber(hourAlarm) < 10 )then 
			hourAlarm = "0" .. hourAlarm; 
		end
	end
	if (tonumber(minAlarm) < 10 )then 
		minAlarm = "0" .. minAlarm; 
	end

	AlarmWindow.Message2=Turbine.UI.Label(); 
	AlarmWindow.Message2:SetParent(AlarmWindow); 
	AlarmWindow.Message2:SetSize(598,50); 
	AlarmWindow.Message2:SetPosition(AlarmWindow:GetWidth()/2 - 299, AlarmWindow:GetHeight()/2 - 95); 
	AlarmWindow.Message2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	AlarmWindow.Message2:SetForeColor(Turbine.UI.Color.Red); 
	AlarmWindow.Message2:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	if(settings["TimeZone"]["AMPM"]  == false)then
		AlarmWindow.Message2:SetText(tostring(hourAlarm) .. ":" .. tostring(minAlarm)); 
	else
		AlarmWindow.Message2:SetText(tostring(hourAlarm) .. ":" .. tostring(minAlarm) .. " " .. settings["Alarm"]["timePos"]); 
	end
	AlarmWindow.Message2:SetZOrder(10010);
	AlarmWindow.Message2:SetMouseVisible(true);
	AlarmWindow.Message2:SetBackColor(Turbine.UI.Color( .6, .5, .7, .5));


	AlarmWindow.Message3=Turbine.UI.Label(); 
	AlarmWindow.Message3:SetParent(AlarmWindow); 
	AlarmWindow.Message3:SetSize(604,104); 
	AlarmWindow.Message3:SetPosition(AlarmWindow:GetWidth()/2 - 302, AlarmWindow:GetHeight()/2 - 148); 
	AlarmWindow.Message3:SetText(""); 
	AlarmWindow.Message3:SetZOrder(-1);
	AlarmWindow.Message3:SetBackColor(Turbine.UI.Color( 1, 0.3, 0.3, 0.3 ));


	--- draw box
	--[[
	AlarmWindow.boxrightup=Turbine.UI.Label(); 
	AlarmWindow.boxrightup:SetParent(AlarmWindow); 
	AlarmWindow.boxrightup:SetSize(36,36); 
	AlarmWindow.boxrightup:SetPosition(AlarmWindow:GetWidth() - 36, AlarmWindow:GetHeight()/2 - 149); 
	AlarmWindow.boxrightup:SetText(""); 
	AlarmWindow.boxrightup:SetZOrder(10001);
	AlarmWindow.boxrightup:SetBackground(0x41108A89);
	AlarmWindow.boxrightup:SetBlendMode(Turbine.UI.BlendMode.Overlay);

	AlarmWindow.boxleftup=Turbine.UI.Label(); 
	AlarmWindow.boxleftup:SetParent(AlarmWindow); 
	AlarmWindow.boxleftup:SetSize(36,36); 
	AlarmWindow.boxleftup:SetPosition(AlarmWindow:GetWidth()/2 - 304, AlarmWindow:GetHeight()/2 - 149); 
	AlarmWindow.boxleftup:SetText(""); 
	AlarmWindow.boxleftup:SetZOrder(10001)
	AlarmWindow.boxleftup:SetBackground(0x41108A8A);
	AlarmWindow.boxleftup:SetBlendMode(Turbine.UI.BlendMode.Overlay);

	AlarmWindow.boxrightbot=Turbine.UI.Label(); 
	AlarmWindow.boxrightbot:SetParent(AlarmWindow); 
	AlarmWindow.boxrightbot:SetSize(36,36); 
	AlarmWindow.boxrightbot:SetPosition(AlarmWindow:GetWidth() - 36, AlarmWindow:GetHeight() - 228); 
	AlarmWindow.boxrightbot:SetText(""); 
	AlarmWindow.boxrightbot:SetZOrder(10010)
	AlarmWindow.boxrightbot:SetBackground(0x41108A8F);
	AlarmWindow.boxrightbot:SetBlendMode(Turbine.UI.BlendMode.Overlay);

	AlarmWindow.boxleftbot=Turbine.UI.Label(); 
	AlarmWindow.boxleftbot:SetParent(AlarmWindow); 
	AlarmWindow.boxleftbot:SetSize(36,36); 
	AlarmWindow.boxleftbot:SetPosition(AlarmWindow:GetWidth()/2 - 304, AlarmWindow:GetHeight() - 228); 
	AlarmWindow.boxleftbot:SetText(""); 
	AlarmWindow.boxleftbot:SetZOrder(10010)
	AlarmWindow.boxleftbot:SetBackground(0x41108A8D);
	AlarmWindow.boxleftbot:SetBlendMode(Turbine.UI.BlendMode.Overlay);

	AlarmWindow.borderleft=Turbine.UI.Label(); 
	AlarmWindow.borderleft:SetParent(AlarmWindow); 
	AlarmWindow.borderleft:SetSize(10, 45); 
	AlarmWindow.borderleft:SetPosition(AlarmWindow:GetWidth()-AlarmWindow:GetWidth() - 5, AlarmWindow:GetHeight()-AlarmWindow:GetHeight() +30 ); 
	AlarmWindow.borderleft:SetText(""); 
	AlarmWindow.borderleft:SetZOrder(10011)
	AlarmWindow.borderleft:SetBackground(0x410E87AB);
	AlarmWindow.borderleft:SetBlendMode(Turbine.UI.BlendMode.Overlay);

	AlarmWindow.borderright=Turbine.UI.Label(); 
	AlarmWindow.borderright:SetParent(AlarmWindow); 
	AlarmWindow.borderright:SetSize(10, 40); 
	AlarmWindow.borderright:SetPosition(AlarmWindow:GetWidth() - 9, AlarmWindow:GetHeight()-AlarmWindow:GetHeight() +36 ); 
	AlarmWindow.borderright:SetText(""); 
	AlarmWindow.borderright:SetZOrder(10009)
	AlarmWindow.borderright:SetBackground(0x410E87AB);
	AlarmWindow.borderright:SetBlendMode(Turbine.UI.BlendMode.Screen);
	--AlarmWindow.borderright:SetBackColor(Turbine.UI.Color.Red);

	AlarmWindow.bottom=Turbine.UI.Label(); 
	AlarmWindow.bottom:SetParent(AlarmWindow); 
	AlarmWindow.bottom:SetSize(AlarmWindow:GetWidth() - 70, 10); 
	AlarmWindow.bottom:SetPosition(AlarmWindow:GetWidth()/2 - (AlarmWindow:GetWidth()/2) + 34, AlarmWindow:GetHeight() - 199 ); 
	AlarmWindow.bottom:SetText(""); 
	AlarmWindow.bottom:SetZOrder(10011)
	AlarmWindow.bottom:SetBackground(0x410E87A6);
	AlarmWindow.bottom:SetBlendMode(Turbine.UI.BlendMode.Screen);

	AlarmWindow.top=Turbine.UI.Label(); 
	AlarmWindow.top:SetParent(AlarmWindow); 
	AlarmWindow.top:SetSize(AlarmWindow:GetWidth() - 70, 10); 
	AlarmWindow.top:SetPosition(AlarmWindow:GetWidth()/2 - (AlarmWindow:GetWidth()/2) + 34, AlarmWindow:GetHeight() - AlarmWindow:GetHeight() - 3); 
	AlarmWindow.top:SetText(""); 
	AlarmWindow.top:SetZOrder(10011)
	AlarmWindow.top:SetBackground(0x410E87A9);
	AlarmWindow.top:SetBlendMode(Turbine.UI.BlendMode.Overlay);
	--AlarmWindow.bottom:SetBackColor(Turbine.UI.Color.Red);


	-- right up = 0x41108A89
	-- left up = 0x41108A8A
	-- bot right = 0x41108A8F
	-- bot left = 0x41108A8D
	-- horizontal line = 0x410E87A6 -- 0x410E87A9
	-- vetical line = 0x410E87AB

	]]--

	AlarmWindow.Message1.MouseClick = function()
		AlarmWindow:SetVisible(false);
		settings["isAlarmDefined"]["isAlarmDefined"] = false;
		settings["Alarm"]["hour"] = "0";
		settings["Alarm"]["min"] = "0";
		CreateMainWindow(sDay);
		ClockWindow:SetVisible(true);
	end

	AlarmWindow.Message2.MouseClick = function()
		AlarmWindow:SetVisible(false);
		settings["isAlarmDefined"]["isAlarmDefined"] = false;
		settings["Alarm"]["hour"] = "0";
		settings["Alarm"]["min"] = "0";
		CreateMainWindow(sDay);
		ClockWindow:SetVisible(true);
	end
end