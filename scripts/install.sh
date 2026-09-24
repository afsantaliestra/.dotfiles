#!/bin/bash
# Usage: ./scripts/install.sh <source_file_path> <target_dir> <target_file_name>

SOURCE_FILE=$1
TARGET_DIR=$2
TARGET_FILE_NAME=$3
TARGET_FILE="$TARGET_DIR/$TARGET_FILE_NAME"
TARGET_FILE_BACKUP="$TARGET_FILE.backup"

if [ -z "$SOURCE_FILE" ] || [ -z "$TARGET_DIR" ] || [ -z "$TARGET_FILE_NAME" ]; then
    echo "Error: Missing arguments."
    echo "Usage: $0 <source_file_path> <target_dir> <target_file_name>"
    exit 2
fi

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' does not exist."
    exit 3
fi

if [ -f "$TARGET_FILE_BACKUP" ]; then
    echo "Error: Backup already present at '$TARGET_FILE_BACKUP'. Delete it in order to continue."
    exit 4
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory '$TARGET_DIR' does not exist, creating..."
    mkdir -p "$TARGET_DIR"
fi

if [ -f "$TARGET_FILE" ]; then
    echo "Backing up existing $TARGET_FILE to $TARGET_FILE_BACKUP"
    mv "$TARGET_FILE" "$TARGET_FILE_BACKUP"
fi

cp "$SOURCE_FILE" "$TARGET_FILE"
echo "Successfully updated $TARGET_FILE"
