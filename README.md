# 📚💬🈸i18n Localization library for AutoHotkey

An easy way to translate your apps to multiple languages.

### Demo

### Sample Usage

```autohotkey
i18n := new i18n("", "es_ES", ["en_US"])
i18n.LoadFile("translations/es_ES.json")
i18n.LoadFile("translations/en_US.json")

translatedText := i18n.t("hello_world") ; Hola mundo

i18n.SetLocale("en_US")
translatedText := i18n.t("hello_world") ; Hello world

yourName := "Victor"
i18n.t("hello_w_param", {name: yourName}) ; Hello Victor

i18n.t("two_lines")
; ⭐ Line 1
; 😎 Line2
```

### Sample Files

#### English

```json
{
    "language_name": "English",
    "language_code": "en_US",
    "translations": {
        "hello_world": "Hello world",
        "hello_w_param": "Hello {name}",
        "two_lines": "⭐ Line 1\n😎 Line2"
    }
}
```

#### Spanish

```json
{
    "language_name": "Español",
    "language_code": "es_ES",
    "translations": {
        "hello_world": "Hola mundo",
        "hello_w_param": "Hola {name}",
        "two_lines": "⭐ Línea 1\n😎 Línea2"
    }
}
```
