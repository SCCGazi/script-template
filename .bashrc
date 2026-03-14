# ----------------------------------------------------------------------
# 1. Pathing & Environment
# ----------------------------------------------------------------------

# Get the absolute path of this repo root
export REPO_ROOT=$(dirname "$(readlink -f "$BASH_SOURCE")")

# Add the repo's bin directory to PATH safely
if [[ ":$PATH:" != *":$REPO_ROOT/bin:"* ]]; then
    export PATH="$PATH:$REPO_ROOT/bin"
fi

# ----------------------------------------------------------------------
# 2. Colors & Aliases
# ----------------------------------------------------------------------

# Enable color support for ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Helpful shortcuts
alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'
alias cls='clear'

# Shortcut to return to repo root
alias repo='cd ~/repo'

# ----------------------------------------------------------------------
# 3. Intelligent Prompt (PS1)
# ----------------------------------------------------------------------

# This function checks if we are inside the repo and colors the path accordingly
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Blue for the user/host, Green for the path, Cyan for the Git branch
export PS1='\[\e[34m\]\u@\h\[\e[m\]:\[\e[32m\]\w\[\e[36m\]$(parse_git_branch)\[\e[m\]\$ '

# ----------------------------------------------------------------------
# 4. Auto-Navigation
# ----------------------------------------------------------------------

# If we just opened a login shell, jump to the repo immediately
if [[ $- == *i* ]]; then
    repo
fi

echo "✅ Lab environment loaded. Type 'repo' to return to your workspace root."