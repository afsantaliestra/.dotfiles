#!/bin/bash
# Usage: ./update_settings.sh [VSCodium|Code]

TYPE=$1

if [ -z "$TYPE" ]; then
    echo "Error: No TYPE provided. Usage: $0 [VSCodium|Code]"
    exit 1
fi

echo "Update user settings for ${TYPE}"

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SOURCE_FILE="$SCRIPT_DIR/user.json"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file foes not exists..."
    exit 1
fi

OS="$(uname -s)"

case "$OS" in
    Linux*)
        TARGET_DIR="$HOME/.config/${TYPE}/User"
        ;;
    Darwin*)
        TARGET_DIR="$HOME/Library/Application Support/${TYPE}/User"
        ;;
    *)
        if [ -n "$APPDATA" ]; then
            TARGET_DIR="$APPDATA/${TYPE}/User"
        else
            TARGET_DIR="$HOME/.config/${TYPE}/User"
        fi
        ;;
esac

TARGET_FILE="$TARGET_DIR/settings.json"
TARGET_FILE_BACKUP="$TARGET_FILE.backup"

if [ ! -d "${TARGET_DIR}" ]; then
    echo "Target '${TARGET_DIR}' do not exists, creating..."
    mkdir -p "$TARGET_DIR"
fi

if [ -f "$TARGET_FILE_BACKUP" ]; then
    echo "Backup already present at '${TARGET_FILE_BACKUP}'. Delete it in order to continue."
    exit 3
fi

if [ -f "$TARGET_FILE" ]; then
    echo "Backing up existing $TARGET_FILE to $TARGET_FILE_BACKUP"
    mv "$TARGET_FILE" "$TARGET_FILE_BACKUP"
fi

if [ -f "$SOURCE_FILE" ]; then
    cp "$SOURCE_FILE" "$TARGET_FILE"
    echo "Successfully updated $TARGET_FILE"
else
    echo "Error: Source file $SOURCE_FILE not found."
    exit 4
fi
