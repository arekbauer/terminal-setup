#!/bin/bash

# DIR, file, line 
DIR_NAME="$HOME/.poshthemes"
FILE_TO_COPY="custom_theme.omp.json"
LINE='eval "$(oh-my-posh init bash --config ~/.poshthemes/custom_theme.omp.json)"'

# Create the directory
if mkdir -p "$DIR_NAME"; then
    echo "Directory '$DIR_NAME' created successfully."
else
    echo "Failed to create directory '$DIR_NAME'."
    exit 1
fi

# Copy file into the directory
if cp "$FILE_TO_COPY" "$DIR_NAME"; then
    echo "File '$FILE_TO_COPY' copied to '$DIR_NAME'."
else
    echo "Failed to copy file '$FILE_TO_COPY' to '$DIR_NAME'."
    exit 1
fi

# Add the line to the end of .profile if not already present
if ! grep -Fxq "$LINE" "$HOME/.profile"; then
    printf "\n%s\n" "$LINE" >> "$HOME/.profile"
    echo "Added line to .profile: $LINE"
else
    echo "Line already exists in .profile"
fi

# Add the line to the end of .bashrc if not already present
if ! grep -Fxq "$LINE" "$HOME/.bashrc"; then
    printf "\n%s\n" "$LINE" >> "$HOME/.bashrc"
    echo "Added line to .bashrc: $LINE"
else
    echo "Line already exists in .bashrc"
fi

echo "Script finished successfully!"