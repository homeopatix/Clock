------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------

local doOnlyOnce = false;
local testTimerOldValue = 0;
local min = 0;
local oldDapos = 0;
local alarmDone = false;

function CreateMainWindow(sDay)
	local valCheck = 60;

	if(sDay == "day")then
		ClockWindow=Turbine.UI.Lotro.GoldWindow();
	else
		ClockWindow=Turbine.UI.Lotro.Window();
	end
	ClockWindow:SetSize(210,250); 
	ClockWindow:SetText(Strings.PluginName); 
	ClockWindow.Message=Turbine.UI.Label(); 
	ClockWindow.Message:SetParent(ClockWindow); 
	ClockWindow.Message:SetSize(150,10); 
	ClockWindow.Message:SetPosition(ClockWindow:GetWidth()/2 - 75, ClockWindow:GetHeight() - 20); 
	ClockWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	ClockWindow:SetZOrder(0);
	ClockWindow:SetWantsKeyEvents(true);
	ClockWindow:SetWantsUpdates(true);
	ClockWindow:SetVisible(false);

	ClockWindow:SetPosition(settings["windowPosition"]["xPos"], settings["windowPosition"]["yPos"]);

	------------------------------------------------------------------------------------------
	-- yel helper center window
	------------------------------------------------------------------------------------------
	ClockWindow.Message1=Turbine.UI.Label(); 
	ClockWindow.Message1:SetParent(ClockWindow); 
	ClockWindow.Message1:SetSize(200,40); 
	ClockWindow.Message1:SetPosition(ClockWindow:GetWidth()/2 - 100, ClockWindow:GetHeight()/2 - 90); 
	ClockWindow.Message1:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	ClockWindow.Message1:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	ClockWindow.Message1:SetBlendMode(Turbine.UI.BlendMode.Overlay);
	ClockWindow.Message1:SetText("");
	ClockWindow.Message1:SetZOrder(100);


	ClockWindow.Message1b=Turbine.UI.Label(); 
	ClockWindow.Message1b:SetParent(ClockWindow); 
	ClockWindow.Message1b:SetSize(30,30); 
	ClockWindow.Message1b:SetPosition(160, ClockWindow:GetHeight()/2 - 80); 
	ClockWindow.Message1b:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	ClockWindow.Message1b:SetFont(Turbine.UI.Lotro.Font.TrajanProBold16);
	ClockWindow.Message1b:SetBlendMode(Turbine.UI.BlendMode.Overlay);
	ClockWindow.Message1b:SetText("");
	ClockWindow.Message1b:SetZOrder(1000);

	if(settings["isAlarmDefined"]["isAlarmDefined"] == true)then
		AlarmIcon=Turbine.UI.Label(); 
		AlarmIcon:SetParent(ClockWindow); 
		AlarmIcon:SetSize(32,32); 
		AlarmIcon:SetPosition(ClockWindow:GetWidth() - 31, 13); 
		AlarmIcon:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		AlarmIcon:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
		AlarmIcon:SetBlendMode(Turbine.UI.BlendMode.Overlay);
		AlarmIcon:SetText("");
		if(sDay == "day")then
			AlarmIcon:SetBackground(0x410DE319);
		else
			AlarmIcon:SetBackground(0x410DE321);
		end
		AlarmIcon:SetZOrder(110);
		AlarmIcon:SetMouseVisible(true);

		ButtonPlusVoc = Turbine.UI.Extensions.SimpleWindow();
		ButtonPlusVoc:SetParent( ClockWindow );
		ButtonPlusVoc:SetPosition(ClockWindow:GetWidth() - 5, 25);
		ButtonPlusVoc:SetSize( 180, 30 );
		ButtonPlusVoc:SetVisible(false);
		ButtonPlusVoc:SetZOrder(20);
		ButtonPlusVoc:SetBackground(ResourcePath .. "/Cadre_180_30.tga");

		hourAlarm = settings["Alarm"]["hour"];
		minAlarm = settings["Alarm"]["min"];

		centerLabelBVoc = Turbine.UI.Label();
		centerLabelBVoc:SetParent(ButtonPlusVoc);
		centerLabelBVoc:SetPosition( 2, 2 );
		centerLabelBVoc:SetSize( 176, 26  );
		if(settings["TimeZone"]["AMPM"] == false)then
			if (tonumber(hourAlarm) < 10 )then 
				hourAlarm = "0" .. hourAlarm; 
			end
		end
		if (tonumber(minAlarm) < 10 )then 
			minAlarm = "0" .. minAlarm; 
		end

		centerLabelBVoc:SetFont(Turbine.UI.Lotro.Font.Verdana18);
		if(settings["TimeZone"]["AMPM"] == false)then
			centerLabelBVoc:SetText( Strings.OptionsAlarm5 .. hourAlarm .. ":" .. minAlarm);
		else
			centerLabelBVoc:SetText( Strings.OptionsAlarm5 .. hourAlarm .. ":" .. minAlarm .. " " .. settings["Alarm"]["timePos"]);
		end
		centerLabelBVoc:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		centerLabelBVoc:SetZOrder(21);
		centerLabelBVoc:SetBackColor( Turbine.UI.Color( .8, .1, .4, .9) );

		AlarmIcon.MouseEnter = function()
			ButtonPlusVoc:SetVisible(true);
		end

		AlarmIcon.MouseLeave = function()
			ButtonPlusVoc:SetVisible(false);
		end
	end

	ClockWindow.Message2=Turbine.UI.Label(); 
	ClockWindow.Message2:SetParent(ClockWindow); 
	ClockWindow.Message2:SetSize(200,20); 
	ClockWindow.Message2:SetPosition(ClockWindow:GetWidth()/2 - 100, ClockWindow:GetHeight() - 35); 
	ClockWindow.Message2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	ClockWindow.Message2:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
	ClockWindow.Message2:SetForeColor(Turbine.UI.Color.Gold);
	ClockWindow.Message2:SetText("");
	ClockWindow.Message2:SetZOrder(100);

	ClockWindow.Message3a=Turbine.UI.Label(); 
	ClockWindow.Message3a:SetParent(ClockWindow); 
	ClockWindow.Message3a:SetSize(200,210); 
	ClockWindow.Message3a:SetPosition(ClockWindow:GetWidth()/2 - 100, ClockWindow:GetHeight() - 218); 
	ClockWindow.Message3a:SetBackColor(Turbine.UI.Color.Black);
	ClockWindow.Message3a:SetOpacity(1);

	ClockWindow.Message3=Turbine.UI.Label(); 
	ClockWindow.Message3:SetParent(ClockWindow); 
	ClockWindow.Message3:SetSize(200,210); 
	ClockWindow.Message3:SetPosition(ClockWindow:GetWidth()/2 - 100, ClockWindow:GetHeight() - 218); 
	ClockWindow.Message3:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	ClockWindow.Message3:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold24);
	ClockWindow.Message3:SetForeColor(Turbine.UI.Color.Gold);
	ClockWindow.Message3:SetBlendMode(Turbine.UI.BlendMode.Screen);
	ClockWindow.Message3:SetText("");

	ClockWindow.Message4=Turbine.UI.Label(); 
	ClockWindow.Message4:SetParent(ClockWindow); 
	ClockWindow.Message4:SetSize(200,20); 
	ClockWindow.Message4:SetPosition(ClockWindow:GetWidth()/2 - 100, ClockWindow:GetHeight() - 55); 
	ClockWindow.Message4:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	ClockWindow.Message4:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	ClockWindow.Message4:SetText("");
	ClockWindow.Message4:SetZOrder(100);

	SetTheTime(valCheck);

	------------------------------------------------------------------------------------------
	-- if the position changes, save the new window location
	------------------------------------------------------------------------------------------
	ClockWindow.PositionChanged = function( sender, args )
		local x,y = ClockWindow:GetPosition();
		settings["windowPosition"]["xPos"] = x;
		settings["windowPosition"]["yPos"] = y;
		SaveSettings();
	end

	------------------------------------------------------------------------------------------
	-- event handling
	------------------------------------------------------------------------------------------
	ClockWindow.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			if(settings["escEnable"]["escEnable"] == true) then
				if(settings["isWindowVisibleAlways"]["isWindowVisibleAlways"] == true)then 
					settings["isWindowVisible"]["isWindowVisible"] = true;
				else
					settings["isWindowVisible"]["isWindowVisible"] = false;
					ClockWindow:SetVisible(false);
				end
				
				SaveSettings();
			end
		end
	
		-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
		if ( args.Action == 268435635 ) then
			hudVisible=not hudVisible;
			if hudVisible then
				ClockWindow:SetVisible(false);
				MainMinimizedIcon:SetVisible(false);
			else
				ClockWindow:SetVisible(settings["isWindowVisible"]["isWindowVisible"]);
				MainMinimizedIcon:SetVisible(true);
			end
		end
	end
end


function SetTheTime(valCheck)	
	
	ClockWindow.Update = function()
		if(valCheck <= 0)then
			valCheck = 60;
			UpdateTime();
		else
			valCheck = valCheck - 1;
		end
	end
end

function UpdateTime()
	-------
		local cdate = Turbine.Engine.GetDate();
		local nowtime = Turbine.Engine.GetLocalTime();
		local chour = cdate.Hour;
		local cminute = cdate.Minute;
		local csecond = cdate.Second;

		if(settings["TimeZone"]["AMPM"] == false)then
			if (chour < 10 )then 
				chour = "0" .. chour; 
			end
		end
		if (cminute < 10 )then 
			cminute = "0" .. cminute; 
		end
		if (csecond < 10 )then 
			csecond = "0" .. csecond; 
		end

		local nowtime = Turbine.Engine.GetLocalTime();
		local gametime = Turbine.Engine.GetGameTime();
		local InitDawn =  nowtime - gametime + settings["Server"]["TS"];
		local adjust = (nowtime - (nowtime - gametime + settings["Server"]["TS"]))% 11160;
		local darray = {572, 1722, 1067, 1678, 1101, 570, 1679, 539, 1141, 1091};
		local dtarray = {
				val1 = Strings.TimeOfDay1, 
				val2 = Strings.TimeOfDay2, 
				val3 = Strings.TimeOfDay3, 
				val4 = Strings.TimeOfDay4, 
				val5 = Strings.TimeOfDay5, 
				val6 = Strings.TimeOfDay6, 
				val7 = Strings.TimeOfDay7, 
				val8 = Strings.TimeOfDay8, 
				val9 = Strings.TimeOfDay9, 
				val10 = Strings.TimeOfDay10,
				val11 = Strings.TimeOfDay1 
				}; 

		if (adjust <= 6140) then 
			sDay = "day";
		else 
			sDay = "night"; 
		end

		local dapos = 1;
		if (adjust <= 572) then dapos = 1;
		elseif (adjust <= 2294) then dapos = 2; 
		elseif (adjust <= 3361) then dapos = 3; 
		elseif (adjust <= 5039) then dapos = 4; 
		elseif (adjust <= 6140) then dapos = 5; 
		elseif (adjust <= 6710) then dapos = 6; 
		elseif (adjust <= 8389) then dapos = 7; 
		elseif (adjust <= 8928) then dapos = 8; 
		elseif (adjust <= 10069) then dapos = 9; 
		elseif (adjust <= 11160) then dapos = 10; 
		end

		local testTimer = math.floor(adjust);

		if(oldDapos ~= dapos)then
			doOnlyOnce = false;
			oldDapos = dapos;
		end

		if(dapos == 1 and doOnlyOnce == false)then
			testSec = 572;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 2 and doOnlyOnce == false)then
			testSec = 2294;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 3 and doOnlyOnce == false)then
			testSec = 3361;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 4 and doOnlyOnce == false)then
			testSec = 5039;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 5 and doOnlyOnce == false)then
			testSec = 6140;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 6 and doOnlyOnce == false)then
			testSec = 6710;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 7 and doOnlyOnce == false)then
			testSec = 8389;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 8 and doOnlyOnce == false)then
			testSec = 8928;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 9 and doOnlyOnce == false)then
			testSec = 10069;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		elseif(dapos == 10 and doOnlyOnce == false)then
			testSec = 11160;
			testSec = testSec - testTimer;
			doOnlyOnce = true;
		end

		if(tonumber(testTimerOldValue) < tonumber(testTimer))then
			testTimerOldValue = testTimer;
			testSec = testSec - 1;
		end

		if(tonumber(testTimer) == 0)then
			testTimerOldValue = 0;
			CreateMainWindow(sDay);
		end
		if(tonumber(testTimer) == 6140)then
			CreateMainWindow(sDay);
		end

		-- display time left in minuttes
		min = string.format("%i", testSec / 60);
		sec = testSec - (min * 60);


		if(tonumber(min) >= 1)then
			if(tonumber(sec) == 0)then
				ClockWindow.Message2:SetText(tostring(min .. " min ")); 
			else
				ClockWindow.Message2:SetText(tostring(min .. " min " .. sec .. " sec")); 
			end
		else
			ClockWindow.Message2:SetText(tostring(sec .. " sec")); 
		end

		timertest = dtarray["val" .. dapos];
		ntimertest = dtarray["val" .. dapos+1];

		local timesincedawn = (nowtime - InitDawn) % 11160;
		local tempIGduration = 0;

		for m = 1, dapos do
			tempIGduration = tempIGduration + darray[m]; 
			-- duration from dawn through next IG time
		end

		totalseconds = math.floor( tempIGduration - timesincedawn );  
		-- duration left for current IG time is equal to (time from dawn to next 
		-- IG time) minus (time from now since last dawn)

		if(sDay == "day")then  
			--ClockWindow.Message1:SetForeColor(Turbine.UI.Color.Gold);
			ClockWindow.Message1:SetForeColor(Turbine.UI.Color( 1, 190/255, 148/255, 0 ));
			ClockWindow.Message1b:SetForeColor(Turbine.UI.Color.Gold);
			ClockWindow.Message2:SetForeColor(Turbine.UI.Color.Gold);
			ClockWindow.Message4:SetForeColor(Turbine.UI.Color.Gold);
		else
			ClockWindow.Message1:SetForeColor(Turbine.UI.Color( 0, 0.66, 0.75));
			ClockWindow.Message1b:SetForeColor(Turbine.UI.Color( 0, 0.66, 0.75));
			ClockWindow.Message2:SetForeColor(Turbine.UI.Color( 0, 0.66, 0.75));
			ClockWindow.Message4:SetForeColor(Turbine.UI.Color( 0, 0.66, 0.75));
		end

		hourAlarm = settings["Alarm"]["hour"];
		minAlarm = settings["Alarm"]["min"];

		if(settings["TimeZone"]["AMPM"] == false)then
			if(tonumber(hourAlarm) < 10)then
				hourAlarm = "0" .. hourAlarm;
			end
		end

		if(tonumber(minAlarm) < 10)then
			minAlarm = "0" .. minAlarm;
		end

		--- alarm settings
		if(settings["TimeZone"]["AMPM"] == false)then
			if(tostring(chour) == hourAlarm and tostring(cminute) == minAlarm and tostring(csecond) == "00" and alarmDone == false 
			and settings["isAlarmDefined"]["isAlarmDefined"] == true)then
				Turbine.Shell.WriteLine(Strings.OptionsAlarm6);
				alarmDone = true;
				ClockWindow:SetVisible(true);
				CreateAlarmWindow(hourAlarm, minAlarm);
				AlarmWindow:SetVisible(true);
				settings["isWindowVisible"]["isWindowVisible"] = true;
			end
		else
			local tmpTexte = "";
			if(tonumber(chour) >= 13)then
				tmpTexte = "PM";
				chour = chour - 12;
			else
				tmpTexte = "AM";
			end
			if(tostring(chour) == hourAlarm and tostring(cminute) == minAlarm and tostring(csecond) == "00" and settings["Alarm"]["timePos"] == tmpTexte 
			and alarmDone == false and settings["isAlarmDefined"]["isAlarmDefined"] == true)then
				Turbine.Shell.WriteLine(Strings.OptionsAlarm6);
				alarmDone = true;
				ClockWindow:SetVisible(true);
				CreateAlarmWindow(hourAlarm, minAlarm);
				AlarmWindow:SetVisible(true);
				settings["isWindowVisible"]["isWindowVisible"] = true;
			end
		end

		if(settings["TimeZone"]["AMPM"] == false)then
			ClockWindow.Message1:SetText(chour .. ":" .. cminute .. ":" .. csecond); 
		else
			ClockWindow.Message1:SetText(chour .. ":" .. cminute .. ":" .. csecond); 
			ClockWindow.Message1b:SetText(settings["Alarm"]["timePos"]); 
		end

		if(settings["isAlarmDefined"]["isAlarmDefined"] == false)then
			alarmDone = false;
		end

		if(dapos == 1)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_1.tga"); 
		elseif(dapos == 2)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_2.tga"); 
		elseif(dapos == 3)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_3.tga"); 
		elseif(dapos == 4)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_4.tga"); 
		elseif(dapos == 5)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_5.tga"); 
		elseif(dapos == 6)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_10.tga"); 
		elseif(dapos == 7)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_7.tga"); 
		elseif(dapos == 8)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_8.tga"); 
		elseif(dapos == 9)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_9.tga"); 
		elseif(dapos == 10)then
			ClockWindow.Message3:SetBackground(ResourcePath .. "DayAndNight_6.tga"); 
		end

		if(sday == "night")then
			ClockWindow.Message4:SetText(tostring(ntimertest)); 
		else
			ClockWindow.Message4:SetText(tostring(timertest)); 
		end
	-----
end