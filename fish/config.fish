set -x fish_greeting ""
if status is-interactive
    echo ' /$$   /$$  /$$$$$$  /$$$$$$$$ /$$      /$$ /$$$$$$$$'
    echo '| $$$ | $$ /$$__  $$|__  $$__/| $$$    /$$$| $$_____/'
    echo '| $$$$| $$| $$  \ $$   | $$   | $$$$  /$$$$| $$      '
    echo '| $$ $$ $$| $$  | $$   | $$   | $$ $$/$$ $$| $$$$$   '
    echo '| $$  $$$$| $$  | $$   | $$   | $$  $$$| $$| $$__/   '
    echo '| $$\  $$$| $$  | $$   | $$   | $$\  $ | $$| $$'
    echo '| $$ \  $$|  $$$$$$/   | $$   | $$ \/  | $$| $$$$$$$$'
    echo '|__/  \__/ \______/    |__/   |__/     |__/|________/'
    fastfetch --logo none --logo-padding-left 0 --logo-padding-top 0
    # Commands to run in interactive sessions can go here
end
