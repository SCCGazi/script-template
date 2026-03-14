# ----------------------------------------------------------------------
# lib/tools.sh
#
# Bill Newman & Gemini, Updated 03/12/2026
#
# DESCRIPTION:
#   A library of utility functions for input validation and debugging.
#   Designed for use in North Seattle College IT/Programming labs.
#
# USAGE:
#   source "$REPO_ROOT/lib/tools.sh"
#
# ----------------------------------------------------------------------

# --- Debug Mode Configuration ---
# Set DEBUG=1 before running a script to enable log() and pause()
DEBUG=${DEBUG:-0}

#######################################
# Prints a debug message to stderr if DEBUG mode is enabled.
# Arguments:
#   $* - The message strings to output.
# Outputs:
#   Writes "DEBUG: [message]" to stderr in yellow text.
#######################################
log() {
    [ "$DEBUG" -eq 1 ] && echo -e "\e[33mDEBUG:\e[m $*" >&2
}

#######################################
# Pauses script execution if DEBUG mode is enabled.
# Arguments:
#   None.
# Outputs:
#   Writes a pause message to stderr and waits for user input.
#######################################
pause() {
    if [ "$DEBUG" -eq 1 ]; then
        read -p "DEBUG pause — press Enter to continue..." -u 0 _ >&2
    fi
}

#######################################
# Validates and returns an integer from user input.
# Arguments:
#   $1 - The prompt text to display to the user.
# Outputs:
#   Writes the validated integer to stdout.
#   Writes prompts and error messages to stderr.
# Returns:
#   0 if successful.
#######################################
getInteger() {
    local prompt_text="$1"
    local user_input=""

    while true; do
        echo -n "$prompt_text " >&2
        read user_input
        if [[ "$user_input" =~ ^-?[0-9]+$ ]]; then
            echo "$user_input"
            return 0
        else
            echo -e "\e[31mERROR:\e[m '$user_input' is not a valid integer." >&2
        fi
    done
}

#######################################
# Validates and returns a number (int or float) from user input.
# Arguments:
#   $1 - The prompt text to display to the user.
# Outputs:
#   Writes the validated number to stdout.
#   Writes prompts and error messages to stderr.
# Returns:
#   0 if successful.
#######################################
getNumber() {
    local prompt_text="$1"
    local user_input=""

    while true; do
        echo -n "$prompt_text " >&2
        read user_input
        if [[ "$user_input" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
            echo "$user_input"
            return 0
        else
            echo -e "\e[31mERROR:\e[m '$user_input' is not a valid number." >&2
        fi
    done
}
