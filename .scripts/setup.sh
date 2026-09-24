#!/bin/bash
# Usage: ./scripts/install.sh <source_file_path> <target_dir> <target_file_name> [append|replace]

SOURCE_FILE=$1
TARGET_DIR=$2
TARGET_FILE_NAME=$3
MODE=${4:-replace}
TARGET_FILE="$TARGET_DIR/$TARGET_FILE_NAME"
TARGET_FILE_BACKUP="$TARGET_FILE.backup"

if [ -z "$SOURCE_FILE" ] || [ -z "$TARGET_DIR" ] || [ -z "$TARGET_FILE_NAME" ]; then
    echo "Error: Missing arguments."
    echo "Usage: $0 <source_file_path> <target_dir> <target_file_name> [append|replace]"
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

if [ "$MODE" != "append" ] && [ "$MODE" != "replace" ]; then
    echo "Error: Invalid mode '$MODE'. Use 'append' or 'replace'."
    exit 5
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory '$TARGET_DIR' does not exist, creating..."
    mkdir -p "$TARGET_DIR"
fi

if [ -f "$TARGET_FILE" ]; then
    echo "Backing up existing $TARGET_FILE to $TARGET_FILE_BACKUP"
    cp "$TARGET_FILE" "$TARGET_FILE_BACKUP"
fi

if [ "$MODE" = "append" ]; then
    if [ -f "$TARGET_FILE" ]; then
        echo "Appending $SOURCE_FILE to $TARGET_FILE"
        cat "$SOURCE_FILE" >> "$TARGET_FILE"
    else
        echo "Target file '$TARGET_FILE' does not exist, creating it by copying $SOURCE_FILE"
        cp "$SOURCE_FILE" "$TARGET_FILE"
    fi
    echo "Successfully appended to $TARGET_FILE"
else
    cp "$SOURCE_FILE" "$TARGET_FILE"
    echo "Successfully replaced $TARGET_FILE"
fi
