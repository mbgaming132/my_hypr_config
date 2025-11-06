#!/bin/bash

# Step 1: Set up Fastfetch with custom ASCII art
echo "Setting up Fastfetch with custom ASCII art..."

# Create custom ASCII art text file
cat <<EOL > ~/my_ascii_art.txt
/$$   /$$  /$$$$$$  /$$$$$$$$ /$$      /$$ /$$$$$$$$
| $$$ | $$ /$$__  $$|__  $$__/| $$$    /$$$| $$_____/
| $$$$| $$| $$  \ $$   | $$   | $$$$  /$$$$| $$      
| $$ $$ $$| $$  | $$   | $$   | $$ $$/$$ $$| $$$$$   
| $$  $$$$| $$  | $$   | $$   | $$  $$$| $$| $$__/   
| $$\  $$$| $$  | $$   | $$   | $$\  $ | $$| $$      
| $$ \  $$|  $$$$$$/   | $$   | $$ \/  | $$| $$$$$$$$
|__/  \__/ \______/    |__/   |__/     |__/|________/
EOL

# Add the ASCII art to Fastfetch config
mkdir -p ~/.config/fastfetch
echo 'ascii_file="~/my_ascii_art.txt"' >> ~/.config/fastfetch/config.conf

# Step 2: Set up Fish to display ASCII art on startup
echo "Setting up Fish shell to display custom ASCII art..."

# Append the ASCII art to Fish config file
cat <<EOL >> ~/.config/fish/config.fish
echo "/$$   /$$  /$$$$$$  /$$$$$$$$ /$$      /$$ /$$$$$$$$"
echo "| $$$ | $$ /$$__  $$|__  $$__/| $$$    /$$$| $$_____/ "
echo "| $$$$| $$| $$  \ $$   | $$   | $$$$  /$$$$| $$      "
echo "| $$ $$ $$| $$  | $$   | $$   | $$ $$/$$ $$| $$$$$   "
echo "| $$  $$$$| $$  | $$   | $$   | $$  $$$| $$| $$__/   "
echo "| $$\  $$$| $$  | $$   | $$   | $$\  $ | $$| $$      "
echo "| $$ \  $$|  $$$$$$/   | $$   | $$ \/  | $$| $$$$$$$$"
echo "|__/  \__/ \______/    |__/   |__/     |__/|________/"
EOL

echo "Setup complete! You can now run 'fastfetch' and open a new Fish shell to see the changes."
