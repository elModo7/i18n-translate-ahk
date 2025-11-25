<p align="center">
    <img align="center" width="200" height="200" alt="Google-Translate-icon" src="https://github.com/user-attachments/assets/70d05545-1981-47f3-b912-480d57dd5b69" />
</p>

# 📚💬🈸i18n Localization library for AutoHotkey

An easy way to translate your apps to multiple languages.

### Demo
![demo](https://github.com/user-attachments/assets/10bcab5b-ab16-442a-9505-8d8fc128363e)


### Sample Usage

```autohotkey
#Include <i18n>
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

### Dependencies
- [cJSON](https://github.com/G33kDude/cJson.ahk): AutoHotkey JSON library using embedded C for high performance
