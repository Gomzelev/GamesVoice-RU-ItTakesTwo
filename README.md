# GamesVoice RU — It Takes Two / Linux - CashyOS

Русская озвучка для **It Takes Two**, установленная из официального установщика GamesVoice.

English version is included below.

Протестировано на:
OS: CachyOS x86_64
Kernel: Linux 7.2.4-1-cachyos
Shell: fish 4.9.3

---

# 🇷🇺 РУССКАЯ ВЕРСИЯ

## Описание

Этот пакет содержит файлы русской озвучки GamesVoice для **It Takes Two**.

Пакет предназначен для ручной установки/удаления локализации без необходимости повторно запускать `ITT_GV_Rus.exe`, устанавливать Wine или .NET Framework.

Установка выполняется добавлением дополнительных Unreal Engine PAK-файлов. Оригинальные игровые PAK-файлы не заменяются.

## Совместимость

Пакет создан на основе установленной версии **It Takes Two** от 13.09.2026.

Steam AppID:

```text
1426210

## Структура

```text
GamesVoice_RU_ItTakesTwo/
├── README.md
├── SHA256SUMS.txt
├── install.sh
├── uninstall.sh
└── Nuts/
    └── Content/
        ├── Paks/
        │   ├── pakchunk0-WindowsNoEditor_9-GV-RU_P.pak
        │   ├── pakchunk0-WindowsNoEditor_P-GV-RU.pak
        │   ├── pakchunk1-WindowsNoEditor_P-GV-RU.pak
        │   └── pakchunk4-WindowsNoEditor_P-GV-RU.pak
        └── Movies/
            └── GamesVoice_Logo.mp4
