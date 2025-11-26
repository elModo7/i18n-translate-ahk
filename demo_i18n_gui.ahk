#NoEnv
#SingleInstance Force
#Persistent
SetBatchLines -1
#Include <cJSON>
#Include <i18n>
FileEncoding, UTF-8

appName := "i18n demo"
i18n := new i18n("data/gui", "en_US", ["es_ES"]) ; Load English or use default Spanish
i18n.LoadDir("data/gui") ; Load all translations in dir
getLanguages()
showSettingsGui()
updateSettingsGui()
return

showSettingsGui() {
    global
    Gui settings:+hWndhMainWnd
    Gui settings:Add, CheckBox, x16 y16 w140 h30 vstartWithWindows, % i18n.t("start_with_windows")
	GuiControl, settings:, startWithWindows
    Gui settings:Add, CheckBox, x16 y48 w140 h30 vprogressiveChanges, % i18n.t("progressive_changes")
	GuiControl, settings:, progressiveChanges
    Gui settings:Add, CheckBox, x16 y80 w140 h30 +Disabled vexperimentalReadFilter, % i18n.t("experimental_read_filter")
	GuiControl, settings:, experimentalReadFilter
    Gui settings:Add, CheckBox, x16 y112 w140 h30 vlookForUpdates, % i18n.t("look_for_updates_on_boot")
	GuiControl, settings:, lookForUpdates
    Gui settings:Add, CheckBox, x16 y144 w140 h30 +Disabled vscheduler, % i18n.t("enable_scheduler")
	GuiControl, settings:, scheduler
	Gui settings:Add, GroupBox, x16 y176 w272 h52, % i18n.t("scheduler")
	Gui settings:Add, Text, x32 y192 w59 h23 +0x200 vfrom, % i18n.t("from") ":"
	Gui settings:Add, DateTime, x96 y192 w58 h24 +Disabled +0x9 vschedulerFrom, hh:mm
	GuiControl, settings:, schedulerFrom
	Gui settings:Add, Text, x160 y192 w51 h23 +0x200 vuntil, % i18n.t("until") ":"
	Gui settings:Add, DateTime, x216 y192 w58 h24 +Disabled +0x9 vschedulerUntil, hh:mm
	GuiControl, settings:, schedulerUntil
	Gui settings:Add, Text, x16 y240 w70 h23 +0x200 vlangTxt, % i18n.t("language")
	Gui settings:Add, ComboBox, x88 y240 w200 Choose4 vlanguage gchangeTempLanguage, % getLanguagesForDropDown()
	Gui settings:Font, Bold
    Gui settings:Add, Button, hWndhBtnSaveConfig2 x192 y16 w96 h30 +Default vsaveConfig, % i18n.t("save_config")
    Gui settings:Font
    Gui settings:Add, Button, hWndhBtnClearAllConfig x192 y48 w96 h30 vclearAllConfig, % i18n.t("clear_all_config")
    Gui settings:Add, Button, x192 y80 w96 h30 vcancel gsettingsGuiClose, % i18n.t("cancel")
	
	Gui settings:Show, w297 h279, % appName " " i18n.t("settings")
}

changeTempLanguage() {
	global
	GuiControlGet, language, settings:, language
	i18n.SetLocale(getLanguageFromDropDown(language).langCode)
	updateSettingsGui()
}

updateSettingsGui() {
	global i18n, appName
	GuiControl, settings:, startWithWindows, % i18n.t("start_with_windows")
	GuiControl, settings:, progressiveChanges, % i18n.t("progressive_changes")
	GuiControl, settings:, experimentalReadFilter, % i18n.t("experimental_read_filter")
	GuiControl, settings:, lookForUpdates, % i18n.t("look_for_updates_on_boot")
	GuiControl, settings:, scheduler, % i18n.t("enable_scheduler")
	GuiControl, settings:, from, % i18n.t("from") ":"
	GuiControl, settings:, until, % i18n.t("until") ":"
	GuiControl, settings:, langTxt, % i18n.t("language")
	GuiControl, settings:, saveConfig, % i18n.t("save_config")
	GuiControl, settings:, clearAllConfig, % i18n.t("clear_all_config")
	GuiControl, settings:, cancel, % i18n.t("cancel")
	Gui settings:Show, w297 h279, % appName " " i18n.t("settings")
}

getLanguageFromDropDown(langName) {
	global
	selectedLang := {}
	for langK, lang in languages
	{
		if (lang.langName == langName) {
			selectedLang := lang
		}
	}
	if (selectedLang.langCode == "") {
		selectedLang.langCode := "en_US"
		selectedLang.langName := "English"
	}
	return selectedLang
}

getLanguages() {
	global JSON, languages
	languages := []
	Loop, Files, data\gui\*.json
	{
		newLang := {}
		FileRead, langJson, % A_LoopFileFullPath
		lang := JSON.Load(langJson)
		newLang.langName := lang.language_name
		newLang.langCode := lang.language_code
		languages.push(newLang)
	}
}

getLanguagesForDropDown() {
	global languages
	langOutput := ""
	for langK, langV in languages
	{
		langOutput .= langV.langName (langK < languages.length() ? "|" : "")
	}
	return langOutput
}

settingsGuiEscape:
settingsGuiClose:
ExitApp
