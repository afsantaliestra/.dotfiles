# Get the directory where this script resides
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source siblings and sub-directory scripts
source "$SCRIPT_DIR/aliases.sh"
source "$SCRIPT_DIR/functions.sh"
source "$SCRIPT_DIR/docker/aliases.sh"
source "$SCRIPT_DIR/docker/functions.sh"

# Existing settings
bindkey '^H' backward-kill-word      # Ctrl+Backspace
