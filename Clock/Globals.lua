
function CreateLocalizationInfo()
	Strings = {};
	

	if Turbine.Engine.GetLanguage() == Turbine.Language.German then
		Strings.PluginName = "Clock";
		Strings.PluginText = "Von Homeopatix";
		Strings.PluginEscEnable = "Escape-Taste aktiviert";
		Strings.PluginEscDesable = "Escape-Taste deaktiviert";
		Strings.PluginAltEnable = "Alt-Taste aktiviert";
		Strings.PluginAltDesable = "Alt-Taste deaktiviert";
		Strings.PluginOptionsText = "Clock Optionen";
		Strings.PluginWindowShow = "Fenster wird angezeigt";
		Strings.PluginWindowHide = "Fenster wird ausgeblendet";
		Strings.PluginOption10 = "Speichern";
		Strings.PluginHelp = " *** Clock Hilfe ***\n\n/cl show - Zeigt das Fenster an.\n " ..
		"/cl hide - Blendet das Fenster aus.\n" ..
		"/cl clear - L\195\182scht alle Verkn\195\188pfungen.\n" ..
		"/cl esc - Aktiviert/Deaktiviert die Escape-Taste, um das Fenster zu schlie\195\159en.\n" ..
		"/cl alt - Alt-Taste gedr\195\188ckt halten, um das Symbol zu verschieben.\n" ..
		"/cl options - Zeigt die Optionen an.\n" ..
		"/cl toggle - Fenster anzeigen/ausblenden.\n\n" ..
		"Sie k\195\182nnen Ihre Verbrauchsmaterialien per Drag & Drop auf die Linie ziehen und mit dem Mausrad l\195\182schen";
		Strings.TimeOfDay1 = "Morgend\195\164mmerung";
		Strings.TimeOfDay2 = "Vormittag";
		Strings.TimeOfDay3 = "Mittag";
		Strings.TimeOfDay4 = "Nachmittag";
		Strings.TimeOfDay5 = "Abendr\195\182te";
		Strings.TimeOfDay6 = "Abendd\195\164mmerung";
		Strings.TimeOfDay7 = "Abend";
		Strings.TimeOfDay8 = "Mitternacht";
		Strings.TimeOfDay9 = "Nachtwache";
		Strings.TimeOfDay10 = "Morgenr\195\182te";
		Strings.OptionsAlarm = "Stelle die Alarmzeit ein:";
		Strings.OptionsAlarm1 = "Stunde";
		Strings.OptionsAlarm2 = "Minute";
		Strings.OptionsAlarm3 = " Alarm aktivieren";
		Strings.OptionsAlarm4 = "Alarm eingestellt auf: ";
		Strings.OptionsAlarm5 = "Alarm: ";
		Strings.OptionsAlarm6 = "!!! ALARM !!!";
		Strings.Options1 = "W\195\164hle deinen Server aus";
		Strings.Options2 = "12 Stunden Modus";
		Strings.Options3 = "Windows immer sichtbar";
		Strings.Options4 = " Immer sichtbar";
		Strings.PluginOptionShowWindow = "Zeigt das Optionsfenster an";

	elseif Turbine.Engine.GetLanguage() == Turbine.Language.French then
		Strings.PluginName = "Clock";
		Strings.PluginText = "Par Homeopatix";
		Strings.PluginEscEnable = "Touche Escape activ\195\169";
		Strings.PluginEscDesable = "Touche Escape desactiv\195\169";
		Strings.PluginAltEnable = "Touche Alt activ\195\169";
		Strings.PluginAltDesable = "Touche Alt desactiv\195\169";
		Strings.PluginOptionsText = "Clock Options";
		Strings.PluginWindowShow = "Affiche la fen\195\168tre.";
		Strings.PluginWindowHide = "Cache la fen\195\168tre.";
		Strings.PluginOption10 = "Valider les changements";
		Strings.PluginHelp = " *** Clock Aide ***\n\n/show affiche La fenetre\n" ..
		"/hide cache la fenetre\n" ..
		"/clear Efface tous les raccourcis\n" ..
		"/esc active ou d\195\169sactive la fermeture de fenetre avec la touche escape\n" ..
		"/alt - Active ou d\195\169sactive la touche alt pour le d\195\169placement de l'icon.\n" ..
		"/options - Affiche la fen\195\170tre d'options\n" ..
		"/toggle - Affiche ou cache la fenetre.\n\n" ..
		"Vous pouvez faire glisser et d\195\169poser vos consomable sur la ligne et les effacer avec la mollette de la souris";
		Strings.TimeOfDay1 = "Aube";
		Strings.TimeOfDay2 = "Matin";
		Strings.TimeOfDay3 = "Midi";
		Strings.TimeOfDay4 = "Apr\195\168s-midi";
		Strings.TimeOfDay5 = "Entre chien et loup";
		Strings.TimeOfDay6 = "Cr\195\169puscule";
		Strings.TimeOfDay7 = "Soir";
		Strings.TimeOfDay8 = "Minuit";
		Strings.TimeOfDay9 = "Nuit noire";
		Strings.TimeOfDay10 = "Au bout de la nuit";
		Strings.OptionsAlarm = "D\195\169finir alarme";
		Strings.OptionsAlarm1 = "Heures";
		Strings.OptionsAlarm2 = "Minuttes";
		Strings.OptionsAlarm3 = " D\195\169finir Alarme";
		Strings.OptionsAlarm4 = "Alarme d\195\169finie sur : ";
		Strings.OptionsAlarm5 = "Alarme : ";
		Strings.OptionsAlarm6 = "!!!! ALARME !!!!";
		Strings.Options1 = "D\195\169finir le serveur";
		Strings.Options2 = "12 Heures or 24 Heures";
		Strings.Options3 = "en\195\168tre toujours affich\195\169e";
		Strings.Options4 = " Always visible";
		Strings.PluginOptionShowWindow = "Affiche la fen\195\168tre d'options";

	elseif Turbine.Engine.GetLanguage() == Turbine.Language.English then
		Strings.PluginName = "Clock";
		Strings.PluginText = "By Homeopatix";
		Strings.PluginEscEnable = "Escape key Activated";
		Strings.PluginEscDesable = "Escape key Desactivated";
		Strings.PluginAltEnable = "Alt key Activated";
		Strings.PluginAltDesable = "Alt key Desactivated";
		Strings.PluginOptionsText = "Clock Options";
		Strings.PluginWindowShow = "Show the window.";
		Strings.PluginWindowHide = "Hide the window.";
		Strings.PluginOption10 = "Validate Changes";
		Strings.PluginHelp = " *** Clock Help ***\n\n/show displays the window\n" ..
		"/hide hide the window\n" ..
		"/clear delete all the shortcuts\n" ..
		"/esc activates or deactivates window closing with the escape key\n" ..
		"/alt - Activate or deactivate the alt key to move the icon.\n" ..
		"/options - Display the option window\n" ..
		"/toggle - Display or hide the window.\n\n" ..
		"You can drag and drop your consumables on the line and delete them with the mouse wheel";
		Strings.TimeOfDay1 = "Dawn";
		Strings.TimeOfDay2 = "Morning";
		Strings.TimeOfDay3 = "Noon";
		Strings.TimeOfDay4 = "Afternoon";
		Strings.TimeOfDay5 = "Dusk";
		Strings.TimeOfDay6 = "Gloaming";
		Strings.TimeOfDay7 = "Evening";
		Strings.TimeOfDay8 = "Midnight";
		Strings.TimeOfDay9 = "Late Watches";
		Strings.TimeOfDay10 = "Foredawn";
		Strings.OptionsAlarm = "Deffine the Alarm";
		Strings.OptionsAlarm1 = "Hours";
		Strings.OptionsAlarm2 = "Minuts";
		Strings.OptionsAlarm3 = " Set Alarm";
		Strings.OptionsAlarm4 = "Alarm set to : ";
		Strings.OptionsAlarm5 = "Alarm : ";
		Strings.OptionsAlarm6 = "!!!! ALARM !!!!";
		Strings.Options1 = "Set the server";
		Strings.Options2 = "12 Hours or 24 Hours";
		Strings.Options3 = "Windows always visible";
		Strings.Options4 = " Always visible";
		Strings.PluginOptionShowWindow = "Display the options Window";

	end
end