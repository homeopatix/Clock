------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------

local doOnlyOnce = false;
local testTimerOldValue = 0;
local min = 0;
local oldDapos = 0;
local alarmDone = false;

local windowWidth = 0;
local windowHeight = 0;

windowWidth = 400;
windowHeight = 550;

------------------------------------------------------------------------------------------
-- create the options window
------------------------------------------------------------------------------------------
function GenerateOptionsWindow()
		OptionsWindow=Turbine.UI.Lotro.GoldWindow(); 
		OptionsWindow:SetSize(windowWidth, windowHeight); 
		OptionsWindow:SetText(Strings.PluginOptionsText); 

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(150,10); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 75, windowHeight - 17 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetText(Strings.PluginText); 

		OptionsWindow:SetZOrder(0);
		OptionsWindow:SetWantsKeyEvents(true);

		OptionsWindow:SetPosition((Turbine.UI.Display:GetWidth()-OptionsWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-OptionsWindow:GetHeight())/2);

		OptionsWindow:SetVisible(false);
		------------------------------------------------------------------------------------------
		-- option panel --
		------------------------------------------------------------------------------------------

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(200, 20); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 100, 50 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana18);
		OptionsWindow.Message:SetText(Strings.OptionsAlarm); 

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(100, 20); 
		OptionsWindow.Message:SetPosition(100, 70 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana12);
		OptionsWindow.Message:SetText(Strings.OptionsAlarm1); 
  
		textBoxLinesSlotHour = Turbine.UI.Lotro.TextBox();
		textBoxLinesSlotHour:SetParent( OptionsWindow );
		textBoxLinesSlotHour:SetSize(100, 30); 
		textBoxLinesSlotHour:SetText(tonumber(settings["Alarm"]["hour"])); 
		textBoxLinesSlotHour:SetPosition(100, 90);
		textBoxLinesSlotHour:SetVisible(true);
		textBoxLinesSlotHour:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		textBoxLinesSlotHour:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
		textBoxLinesSlotHour:SetBackColor( Turbine.UI.Color( .9, .5, .7, .5));

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(100, 20); 
		OptionsWindow.Message:SetPosition(200, 70 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana12);
		OptionsWindow.Message:SetText(Strings.OptionsAlarm2); 
  
		textBoxLinesSlotMin = Turbine.UI.Lotro.TextBox();
		textBoxLinesSlotMin:SetParent( OptionsWindow );
		textBoxLinesSlotMin:SetSize(100, 30); 
		textBoxLinesSlotMin:SetText(tonumber(settings["Alarm"]["min"])); 
		textBoxLinesSlotMin:SetPosition(200, 90);
		textBoxLinesSlotMin:SetVisible(true);
		textBoxLinesSlotMin:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		textBoxLinesSlotMin:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
		textBoxLinesSlotMin:SetBackColor( Turbine.UI.Color( .9, .5, .7, .5));

		if(settings["TimeZone"]["AMPM"] == true)then
			checkBoxTimeZoneAM = Turbine.UI.Lotro.CheckBox();
			checkBoxTimeZoneAM:SetParent( OptionsWindow );
			checkBoxTimeZoneAM:SetSize(200, 20); 
			checkBoxTimeZoneAM:SetFont(Turbine.UI.Lotro.Font.Verdana16);
			checkBoxTimeZoneAM:SetText(" AM");
			checkBoxTimeZoneAM:SetPosition(310, 85);
			checkBoxTimeZoneAM:SetVisible(true);
			if(settings["Alarm"]["timePos"] == "AM")then
				checkBoxTimeZoneAM:SetChecked(true);
			else
				checkBoxTimeZoneAM:SetChecked(false);
			end
			checkBoxTimeZoneAM:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

			checkBoxTimeZonePM = Turbine.UI.Lotro.CheckBox();
			checkBoxTimeZonePM:SetParent( OptionsWindow );
			checkBoxTimeZonePM:SetSize(200, 20); 
			checkBoxTimeZonePM:SetFont(Turbine.UI.Lotro.Font.Verdana16);
			checkBoxTimeZonePM:SetText(" PM");
			checkBoxTimeZonePM:SetPosition(310, 105);
			checkBoxTimeZonePM:SetVisible(true);
			if(settings["Alarm"]["timePos"] == "PM")then
				checkBoxTimeZonePM:SetChecked(true);
			else
				checkBoxTimeZonePM:SetChecked(false);
			end
			checkBoxTimeZonePM:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
		end

		checkBoxAlarm = Turbine.UI.Lotro.CheckBox();
		checkBoxAlarm:SetParent( OptionsWindow );
		checkBoxAlarm:SetSize(200, 20); 
		checkBoxAlarm:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxAlarm:SetText(Strings.OptionsAlarm3);
		checkBoxAlarm:SetPosition(150, 130);
		checkBoxAlarm:SetVisible(true);
		if(settings["isAlarmDefined"]["isAlarmDefined"] == true)then
			checkBoxAlarm:SetChecked(true);
		else
			checkBoxAlarm:SetChecked(false);
		end

		checkBoxAlarm:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(200, 20); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 100, 190 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana18);
		OptionsWindow.Message:SetText(Strings.Options1); 

		local ServerNames = {"Grond [EU]",
                    "Sting",
                    "Peregrin [RP]",
                    "Meriadoc [EU-RP]",
                    "Glamdring",
                    "Orcrist [EU]",
                    "Angmar",
                    "Mordor [EU]"
				};

		for i=1, 5 do
			if(ServerNames[i] == settings["ServerName"]["ServerName"])then
				currentServer = i;
			end
		end

		local serverDropDown = DropDown.Create(ServerNames, ServerNames[currentServer]);
		serverDropDown:SetParent(OptionsWindow);
		serverDropDown:SetPosition(windowWidth/2 - 79, 220);
	
		serverDropDown.ItemChanged = function()
			local name = serverDropDown:GetText();
			if(name == "Sting")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 901;
			elseif(name == "Grond [EU]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10335;
			elseif(name == "Orcrist [EU]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10335;
			elseif(name == "Mordor [EU]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10335;
			elseif(name == "Meriadoc [EU-RP]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10335;
			elseif(name == "Peregrin [RP]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			elseif(name == "Angmar")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			elseif(name == "Glamdring")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			end
		end

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(200, 20); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 100, 280 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana18);
		OptionsWindow.Message:SetText(Strings.Options2); 

		checkBoxTimeZone = Turbine.UI.Lotro.CheckBox();
		checkBoxTimeZone:SetParent( OptionsWindow );
		checkBoxTimeZone:SetSize(200, 20); 
		checkBoxTimeZone:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxTimeZone:SetText(" AM - PM");
		checkBoxTimeZone:SetPosition(windowWidth/2 - 50, 320);
		checkBoxTimeZone:SetVisible(true);
		if(settings["TimeZone"]["AMPM"] == true)then
			checkBoxTimeZone:SetChecked(true);
		else
			checkBoxTimeZone:SetChecked(false);
		end
		checkBoxTimeZone:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(200, 20); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 100, 360 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana18);
		OptionsWindow.Message:SetText(Strings.Options3); 

		checkBoxIsVisible = Turbine.UI.Lotro.CheckBox();
		checkBoxIsVisible:SetParent( OptionsWindow );
		checkBoxIsVisible:SetSize(200, 20); 
		checkBoxIsVisible:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxIsVisible:SetText(Strings.Options4);
		checkBoxIsVisible:SetPosition(windowWidth/2 - 50, 400);
		checkBoxIsVisible:SetVisible(true);
		if(settings["isWindowVisibleAlways"]["isWindowVisibleAlways"] == true)then
			checkBoxIsVisible:SetChecked(true);
		else
			checkBoxIsVisible:SetChecked(false);
		end
		checkBoxIsVisible:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

		buttonValider = Turbine.UI.Lotro.GoldButton();
		buttonValider:SetParent( OptionsWindow );
		buttonValider:SetPosition(windowWidth/2 - 125,  windowHeight - 50);
		buttonValider:SetSize( 300, 20 );
		buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		buttonValider:SetText( Strings.PluginOption10 );
		buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		buttonValider:SetVisible(true);
		buttonValider:SetMouseVisible(true);

		ValidateChangesOptions();
		ClosingTheOptionsWindow();

		function checkBoxTimeZone:CheckedChanged()
			if(checkBoxTimeZone:IsChecked())then
				checkBoxTimeZone:SetChecked(true);
				settings["TimeZone"]["AMPM"] = true;
			else
				checkBoxTimeZone:SetChecked(false);
				settings["TimeZone"]["AMPM"] = false;
			end
			OptionsWindow:SetVisible(false);
			GenerateOptionsWindow();
			OptionsWindow:SetVisible(true);
		end
		function checkBoxIsVisible:CheckedChanged()
			if(checkBoxIsVisible:IsChecked())then
				checkBoxIsVisible:SetChecked(true);
				settings["isWindowVisibleAlways"]["isWindowVisibleAlways"] = true;
			else
				checkBoxIsVisible:SetChecked(false);
				settings["isWindowVisibleAlways"]["isWindowVisibleAlways"] = false;
			end
			OptionsWindow:SetVisible(false);
			GenerateOptionsWindow();
			OptionsWindow:SetVisible(true);
		end
		if(settings["TimeZone"]["AMPM"] == true)then
			UpdateChecker();
		end
end

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

function UpdateChecker()
	function checkBoxTimeZoneAM:CheckedChanged()
		if(checkBoxTimeZoneAM:IsChecked())then
			checkBoxTimeZonePM:SetChecked(false);
		end
	end
	function checkBoxTimeZonePM:CheckedChanged()
		if(checkBoxTimeZonePM:IsChecked())then
			checkBoxTimeZoneAM:SetChecked(false);
		end
	end
end
------------------------------------------------------------------------------------------
-- boutton valider
------------------------------------------------------------------------------------------
function ValidateChangesOptions()
	buttonValider.MouseClick = function(sender, args)

		if(checkBoxAlarm:IsChecked())then
			settings["Alarm"]["hour"] = textBoxLinesSlotHour:GetText();
			settings["Alarm"]["min"] = textBoxLinesSlotMin:GetText();

			hourAlarm = settings["Alarm"]["hour"];
			minAlarm = settings["Alarm"]["min"];

			if(checkBoxTimeZone:IsChecked())then
				settings["TimeZone"]["AMPM"] = true;
			else
				settings["TimeZone"]["AMPM"] = false;
				if(tonumber(hourAlarm) < 10)then
					hourAlarm = "0" .. hourAlarm;
				end
			end

			if(checkBoxIsVisible:IsChecked())then
				settings["isWindowVisibleAlways"]["isWindowVisibleAlways"] = true;
			else
				settings["isWindowVisibleAlways"]["isWindowVisibleAlways"] = false;
			end

			if(tonumber(minAlarm) < 10)then
				minAlarm = "0" .. minAlarm;
			end

			if(settings["TimeZone"]["AMPM"] == false)then
				Turbine.Shell.WriteLine(Strings.OptionsAlarm4 .. hourAlarm .. ":" .. minAlarm);
			else
				if(tonumber(hourAlarm) >= 13)then
					hourAlarm = hourAlarm - 12;
				end
				if(checkBoxTimeZoneAM:IsChecked())then
					settings["Alarm"]["timePos"] = "AM";
				elseif(checkBoxTimeZonePM:IsChecked())then
					settings["Alarm"]["timePos"] = "PM";
				end
				Turbine.Shell.WriteLine(Strings.OptionsAlarm4 .. hourAlarm .. ":" .. minAlarm .. " " .. settings["Alarm"]["timePos"]);
			end

			settings["isAlarmDefined"]["isAlarmDefined"] = true;
		else
			settings["isAlarmDefined"]["isAlarmDefined"] = false;
			settings["Alarm"]["hour"] = "0";
			settings["Alarm"]["min"] = "0";
		end
		
		OptionsWindow:SetVisible(false);
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
		settings["isWindowVisible"]["isWindowVisible"] = true;
		ClockWindow:SetVisible(true);
		SaveSettings();

		local nowtime = Turbine.Engine.GetLocalTime();
		local gametime = Turbine.Engine.GetGameTime();
		local adjust = (nowtime - (nowtime - gametime + settings["Server"]["TS"]))% 11160;
		if (adjust <= 6140) then 
			sDay = "day";
		else 
			sDay = "night"; 
		end

		CreateMainWindow(sDay);
		ClockWindow:SetVisible(true);
	end
end
