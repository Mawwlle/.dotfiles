#!/bin/bash
# Script to focus iTerm2 tab running Claude Code

osascript <<EOF
tell application "iTerm2"
    activate

    -- Find the window and tab with "claude" in the session name
    repeat with aWindow in windows
        repeat with aTab in tabs of aWindow
            repeat with aSession in sessions of aTab
                set sessionName to name of aSession
                if sessionName contains "claude" then
                    select aWindow
                    select aTab
                    return
                end if
            end repeat
        end repeat
    end repeat

    -- If no claude session found, just activate iTerm2
end tell
EOF
