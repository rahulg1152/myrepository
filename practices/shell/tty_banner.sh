#!/bin/bash

# Get the current terminal device file
TTY_DEV=$(tty)

while true; do
    CURRENT_TIME=$(date +%s)
    # Get the last access time of the terminal file
    LAST_ACTIVITY=$(stat -c %X "$TTY_DEV")
    IDLE_TIME=$((CURRENT_TIME - LAST_ACTIVITY))

    # If idle for 10 seconds or more
    if [ "$IDLE_TIME" -ge 10 ]; then
        echo "❤️ I love you Maa ❤️"
        # Wait 10 seconds before the next check/print
        sleep 10
    else
        # Check every 1 second while the user is active
        sleep 1
    fi
done
