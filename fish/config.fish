# No fish greeting
set -g fish_greeting

# VI key bindings
# set -g fish_key_bindings fish_vi_key_bindings
set -g fish_key_bindings fish_default_key_bindings

# Multicd utility command from fish documentation
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

# Make directory and cd combined command (should be built-in imo)
function md
    mkdir $argv[1] && cd $argv[1]
end

# macOS
if test (uname) = Darwin
    # rm just moves to trash
    function rm
        for i in $argv
            # mv -f still gives an error when moving a directory with a name that is already in trash
            /bin/rm -rf -- "~/.Trash/$i" 2>/dev/null # silence errors
            mv -f -- "$i" ~/.Trash
        end
    end 

    # Start jack audio server with no input channels for mocp
    abbr --add jack "jackd -d coreaudio -i 0 &"

    # Toggle system-wide dark mode
    function dark
        osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
    end
    
    # Toggle keyboard backlight (requires brew install mac-brightnessctl)
    abbr --add keyon "mac-brightnessctl 0.01"
    abbr --add keyoff "mac-brightnessctl 0"
    
    # Toggle ability to sleep
    abbr --add dosleep "sudo pmset -a disablesleep 0"
    abbr --add nosleep "sudo pmset -a disablesleep 1"
    
    # Remove quarantine flag from a file
    abbr --add unsafe "xattr -d com.apple.quarantine"
    
    # Add homebrew to PATH
    if test -f /opt/homebrew/bin/brew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end
end

# Zoxide init
zoxide init fish | source
