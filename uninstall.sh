#!/usr/bin/env bash
set -euo pipefail

STEAM_ROOT="${STEAM_ROOT:-/mnt/Games/SteamLibrary}"
GAME_DIR="${GAME_DIR:-$STEAM_ROOT/steamapps/common/ItTakesTwo}"

TARGET_PAKS="$GAME_DIR/Nuts/Content/Paks"
TARGET_MOVIES="$GAME_DIR/Nuts/Content/Movies"

echo "=========================================="
echo " Удаление GamesVoice RU — It Takes Two"
echo "=========================================="
echo

if [[ ! -d "$GAME_DIR" ]]; then
    echo "ОШИБКА: игра не найдена:"
    echo "  $GAME_DIR"
    exit 1
fi

files=(
    "$TARGET_PAKS/pakchunk0-WindowsNoEditor_9-GV-RU_P.pak"
    "$TARGET_PAKS/pakchunk0-WindowsNoEditor_P-GV-RU.pak"
    "$TARGET_PAKS/pakchunk1-WindowsNoEditor_P-GV-RU.pak"
    "$TARGET_PAKS/pakchunk4-WindowsNoEditor_P-GV-RU.pak"
    "$TARGET_MOVIES/GamesVoice_Logo.mp4"
)

found=0

echo "Будут удалены только следующие файлы:"
echo

for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
        echo "  - $file"
        found=1
    fi
done

if (( found == 0 )); then
    echo "Файлы GamesVoice не найдены."
    exit 0
fi

echo
read -r -p "Удалить перечисленные файлы? [y/N] " answer

case "$answer" in
    y|Y|yes|YES|д|Д|да|ДА)
        ;;
    *)
        echo "Удаление отменено."
        exit 0
        ;;
esac

echo

for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
        rm -f -- "$file"
        echo "  - Удалён: $file"
    fi
done

echo
echo "=========================================="
echo " Удаление завершено."
echo "=========================================="
echo
echo "Оригинальные игровые файлы не затронуты."
