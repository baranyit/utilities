#!/bin/bash

# Get the directory containing this script
DIR="$(pwd)"

# Determine the user's shell rc file
SHELL_RC=""
if [[ "$SHELL" == */bash ]]; then
    SHELL_RC="$HOME/.bashrc"
elif [[ "$SHELL" == */zsh ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ "$SHELL" == */ksh ]]; then
    SHELL_RC="$HOME/.kshrc"
elif [[ "$SHELL" == */csh ]]; then
    SHELL_RC="$HOME/.cshrc"
elif [[ "$SHELL" == */tcsh ]]; then
    SHELL_RC="$HOME/.tcshrc"
else
    echo "Unsupported shell: $SHELL"
    exit 1
fi

echo "Detected shell rc file: $SHELL_RC"

# Add the directory to the shell rc file if it's not already there
if ! grep -q "export PATH=\"$DIR:\$PATH\"" "$SHELL_RC"; then
    echo "" >> "$SHELL_RC"
    echo "##################################################" >> "$SHELL_RC"
    echo "# Added by https://github.com/baranyit/utilities #" >> "$SHELL_RC"
    echo "##################################################" >> "$SHELL_RC"
    echo "export PATH=\"$DIR:\$PATH\"" >> "$SHELL_RC"
    echo "" >> "$SHELL_RC"
    echo "Directory $DIR added to $SHELL_RC."
else
    echo "Directory $DIR is already in $SHELL_RC."
fi