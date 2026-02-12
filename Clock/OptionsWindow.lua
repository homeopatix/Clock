------------------------------------------------------------------------------------------
-- OptionWindow file
-- Written by Homeopatix
-- 26 january 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- define size of the window
------------------------------------------------------------------------------------------
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

		local ServerNames = {"Sirannon [FR]",
                    "Grond [EU]",
                    "Peregrin [RP]",
                    "Meriadoc [EU-RP]",
                    "Glamdring",
                    "Orcrist [EU]",
                    "Angmar",
                    "Mordor [EU]",
                    "Belegaer [EU-DE-RP]",
                    "Gladden [US]",
                    "Landroval [US-RE]",
                    "Gwaihir [EU-DE]",
                    "Arkenstone [US]",
                    "Evernight [EU]",
                    "CrickHollow [US]",
                    "Laurelin [EU-EN-RP]",
                    "Treebeard",
                    "Brandywine [US]"
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
			if(name == "Arkenstone [US]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 901;
			elseif(name == "CrickHollow [US]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10350;
			elseif(name == "Sirannon [FR]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10335;
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
			elseif(name == "Brandywine [US]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10375;
			elseif(name == "Gladden [US]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 3226;
			elseif(name == "Landroval [US-RE]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			elseif(name == "Peregrin [RP]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			elseif(name == "Laurelin [EU-EN-RP]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			elseif(name == "Belegaer [EU-DE-RP]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			elseif(name == "Gwaihir [EU-DE]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			elseif(name == "Evernight [EU]")then
				settings["ServerName"]["ServerName"] = name;
				settings["Server"]["TS"] = 10409;
			elseif(name == "Treebeard")then
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