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
 	local isNight = (sDay == "night");
 	local panelColor = isNight and Turbine.UI.Color(0.06, 0.10, 0.15, 0.92) or Turbine.UI.Color(0.14, 0.11, 0.08, 0.92);
 	local accentColor = isNight and Turbine.UI.Color(0.35, 0.75, 1.00) or Turbine.UI.Color(1.00, 0.78, 0.35);
 	local glowColor = isNight and Turbine.UI.Color(0.18, 0.42, 0.76, 0.75) or Turbine.UI.Color(0.86, 0.58, 0.16, 0.75);
 
 	if(sDay == "day")then
 		ClockWindow=Turbine.UI.Lotro.GoldWindow();
 	else
 		ClockWindow=Turbine.UI.Lotro.Window();
 	end
 	ClockWindow:SetSize(230, 260); 
 	ClockWindow:SetText(Strings.PluginName);
 	ClockWindow:SetBackColor(panelColor);
 	ClockWindow:SetOpacity(1);
 	ClockWindow:SetWantsKeyEvents(true);
 	ClockWindow:SetWantsUpdates(true);
 	ClockWindow:SetVisible(false);
 	ClockWindow:SetPosition(settings["windowPosition"]["xPos"], settings["windowPosition"]["yPos"]);
 
 	ClockWindow.Header = Turbine.UI.Label();
 	ClockWindow.Header:SetParent(ClockWindow);
 	ClockWindow.Header:SetSize(180, 26);
 	ClockWindow.Header:SetPosition(25, 12);
 	ClockWindow.Header:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
 	ClockWindow.Header:SetFont(Turbine.UI.Lotro.Font.TrajanProBold18);
 	ClockWindow.Header:SetForeColor(accentColor);
 	ClockWindow.Header:SetText(Strings.PluginName);
 	ClockWindow.Header:SetZOrder(200);
 
 	ClockWindow.Message=Turbine.UI.Label(); 
 	ClockWindow.Message:SetParent(ClockWindow); 
 	ClockWindow.Message:SetSize(180, 20); 
 	ClockWindow.Message:SetPosition(25, 240); 
 	ClockWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
 	ClockWindow.Message:SetForeColor(accentColor);
 	ClockWindow.Message:SetText(Strings.PluginText);
 
 	ClockWindow.Message1=Turbine.UI.Label(); 
 	ClockWindow.Message1:SetParent(ClockWindow); 
 	ClockWindow.Message1:SetSize(180, 52); 
 	ClockWindow.Message1:SetPosition(25, 55); 
 	ClockWindow.Message1:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
 	ClockWindow.Message1:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
 	ClockWindow.Message1:SetForeColor(accentColor);
 	ClockWindow.Message1:SetBlendMode(Turbine.UI.BlendMode.Overlay);
 	ClockWindow.Message1:SetText("");
 	ClockWindow.Message1:SetZOrder(100);
 
 	ClockWindow.Message1b=Turbine.UI.Label(); 
 	ClockWindow.Message1b:SetParent(ClockWindow); 
 	ClockWindow.Message1b:SetSize(40, 20); 
 	ClockWindow.Message1b:SetPosition(175, 70); 
 	ClockWindow.Message1b:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
 	ClockWindow.Message1b:SetFont(Turbine.UI.Lotro.Font.Verdana14);
 	ClockWindow.Message1b:SetForeColor(accentColor);
 	ClockWindow.Message1b:SetText("");
 	ClockWindow.Message1b:SetZOrder(110);
 
 	if(settings["isAlarmDefined"]["isAlarmDefined"] == true)then
 		AlarmIcon=Turbine.UI.Label(); 
 		AlarmIcon:SetParent(ClockWindow); 
 		AlarmIcon:SetSize(22,22); 
 		AlarmIcon:SetPosition(192, 16); 
 		AlarmIcon:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
 		AlarmIcon:SetFont(Turbine.UI.Lotro.Font.TrajanProBold16);
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
 		ButtonPlusVoc:SetPosition(ClockWindow:GetWidth() - 12, 24);
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
 	ClockWindow.Message2:SetSize(180,20); 
 	ClockWindow.Message2:SetPosition(25, 110); 
 	ClockWindow.Message2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
 	ClockWindow.Message2:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
 	ClockWindow.Message2:SetForeColor(accentColor);
 	ClockWindow.Message2:SetText("");
 	ClockWindow.Message2:SetZOrder(100);

 	ClockWindow.Message3a=Turbine.UI.Label(); 
 	ClockWindow.Message3a:SetParent(ClockWindow); 
 	ClockWindow.Message3a:SetSize(180, 100); 
 	ClockWindow.Message3a:SetPosition(25, 135); 
 	ClockWindow.Message3a:SetBackColor(glowColor);
 	ClockWindow.Message3a:SetOpacity(0.45);

 	ClockWindow.Message3=Turbine.UI.Label(); 
 	ClockWindow.Message3:SetParent(ClockWindow); 
 	ClockWindow.Message3:SetSize(180,100); 
 	ClockWindow.Message3:SetPosition(25, 135); 
 	ClockWindow.Message3:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
 	ClockWindow.Message3:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold24);
 	ClockWindow.Message3:SetForeColor(accentColor);
 	ClockWindow.Message3:SetBlendMode(Turbine.UI.BlendMode.Screen);
 	ClockWindow.Message3:SetText("");

 	ClockWindow.Message4=Turbine.UI.Label(); 
 	ClockWindow.Message4:SetParent(ClockWindow); 
 	ClockWindow.Message4:SetSize(180,20); 
 	ClockWindow.Message4:SetPosition(25, 205); 
 	ClockWindow.Message4:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
 	ClockWindow.Message4:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
 	ClockWindow.Message4:SetForeColor(accentColor);
 	ClockWindow.Message4:SetText("");
 	ClockWindow.Message4:SetZOrder(100);

 	SetTheTime(valCheck);

 	ClockWindow.PositionChanged = function( sender, args )
 		local x,y = ClockWindow:GetPosition();
 		settings["windowPosition"]["xPos"] = x;
 		settings["windowPosition"]["yPos"] = y;
 		SaveSettings();
 	end

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
 	end

 	totalseconds = math.floor( tempIGduration - timesincedawn );

 	if(sDay == "day")then
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

 	if(settings["TimeZone"]["AMPM"] == false)then
 		local timeText = chour .. ":" .. cminute;
 		if(settings["display"]["showSeconds"] == true)then
 			timeText = timeText .. ":" .. csecond;
 		end
 		ClockWindow.Message1:SetText(timeText); 
 	else
 		local timeText = chour .. ":" .. cminute;
 		if(settings["display"]["showSeconds"] == true)then
 			timeText = timeText .. ":" .. csecond;
 		end
 		ClockWindow.Message1:SetText(timeText); 
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

 	if(settings["display"]["showDate"] == true)then
 		ClockWindow.Message4:SetText(tostring(cdate.Day .. "/" .. cdate.Month .. "/" .. cdate.Year .. " • " .. timertest));
 	else
 		if(sDay == "night")then
 			ClockWindow.Message4:SetText(tostring(ntimertest)); 
 		else
 			ClockWindow.Message4:SetText(tostring(timertest)); 
 		end
 	end
end
