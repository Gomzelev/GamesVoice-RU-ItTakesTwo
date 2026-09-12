#!/usr/bin/env bash
set -euo pipefail

MOD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STEAM_ROOT="${STEAM_ROOT:-/mnt/Games/SteamLibrary}"
GAME_DIR="${GAME_DIR:-$STEAM_ROOT/steamapps/common/ItTakesTwo}"

PAKS_DIR="$MOD_DIR/Nuts/Content/Paks"
MOVIES_DIR="$MOD_DIR/Nuts/Content/Movies"

TARGET_PAKS="$GAME_DIR/Nuts/Content/Paks"
TARGET_MOVIES="$GAME_DIR/Nuts/Content/Movies"

echo "=========================================="
echo " GamesVoice RU — It Takes Two"
echo "=========================================="
echo

if [[ ! -d "$GAME_DIR" ]]; then
    echo "ОШИБКА: игра не найдена:"
    echo "  $GAME_DIR"
    echo
    echo "Для другой библиотеки Steam:"
    echo '  STEAM_ROOT="/путь/к/SteamLibrary" ./install.sh'
    exit 1
fi

required_files=(
    "pakchunk0-WindowsNoEditor_9-GV-RU_P.pak"
    "pakchunk0-WindowsNoEditor_P-GV-RU.pak"
    "pakchunk1-WindowsNoEditor_P-GV-RU.pak"
    "pakchunk4-WindowsNoEditor_P-GV-RU.pak"
)

echo "Проверка файлов локализации..."

for file in "${required_files[@]}"; do
    if [[ ! -f "$PAKS_DIR/$file" ]]; then
        echo "ОШИБКА: отсутствует:"
        echo "  $PAKS_DIR/$file"
        exit 1
    fi
done

if [[ ! -f "$MOVIES_DIR/GamesVoice_Logo.mp4" ]]; then
    echo
    echo "Предупреждение: GamesVoice_Logo.mp4 отсутствует."
    echo "Продолжаем без него."
fi

echo
echo "Игра найдена:"
echo "  $GAME_DIR"
echo

existing=()

for file in "${required_files[@]}"; do
    if [[ -f "$TARGET_PAKS/$file" ]]; then
        existing+=("$file")
    fi
done

if [[ -f "$TARGET_MOVIES/GamesVoice_Logo.mp4" ]]; then
    existing+=("GamesVoice_Logo.mp4")
fi

if (( ${#existing[@]} > 0 )); then
    echo "В игре уже присутствуют файлы GamesVoice:"
    for file in "${existing[@]}"; do
        echo "  - $file"
    done

    echo
    read -r -p "Заменить их файлами из этого пакета? [y/N] " answer

    case "$answer" in
        y|Y|yes|YES|д|Д|да|ДА)
            echo "Продолжаем..."
            ;;
        *)
            echo "Установка отменена."
            exit 0
            ;;
    esac
fi

mkdir -p "$TARGET_PAKS" "$TARGET_MOVIES"

echo
echo "Установка PAK-файлов..."

for file in "${required_files[@]}"; do
    cp -f "$PAKS_DIR/$file" "$TARGET_PAKS/$file"
    echo "  + $file"
done

if [[ -f "$MOVIES_DIR/GamesVoice_Logo.mp4" ]]; then
    cp -f "$MOVIES_DIR/GamesVoice_Logo.mp4" \
        "$TARGET_MOVIES/GamesVoice_Logo.mp4"
    echo "  + GamesVoice_Logo.mp4"
fi

echo
echo "=========================================="
echo " Установка завершена успешно."
echo "=========================================="
echo
echo "Оригинальные игровые PAK-файлы не заменялись."
