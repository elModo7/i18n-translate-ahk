#NoEnv
#SingleInstance Force
SetBatchLines -1

#Include <cJSON>
#Include <i18n>
FileEncoding, UTF-8 ; Make sure we are reading UTF-8 (codepage 65001)
authorName := "elModo7"
i18n := new i18n("", "es_ES", ["en_US"])

Loop, Files, data/*.json
{
	i18n.LoadFile(A_LoopFileFullPath)
}

finalText := i18n.t("author", {author: authorName}) "`n`n`n"

finalText .= i18n.locale " -> " i18n.t("start_with_windows") "`n`n"

i18n.SetLocale("en_US")
finalText .= i18n.locale " -> " i18n.t("start_with_windows") "`n`n"

i18n.SetLocale("zh_CN")
finalText .= i18n.locale " -> " i18n.t("start_with_windows") "`n`n"

i18n.SetLocale("ar_EG")
finalText .= i18n.locale " -> " i18n.t("start_with_windows") "`n`n"

i18n.SetLocale("ja_JP")
finalText .= i18n.locale " -> " i18n.t("start_with_windows")

MsgBox % finalText