#!/bin/bash

echo "Terminal monitor active. Leave the terminal idle for 10 seconds to start..."

while true; do
    # Wait 10 seconds for any keypress
    read -t 10 -n 1
    
    # If the read command times out (exit status > 128), the terminal is idle
    if [ $? -gt 128 ]; then
        echo -e "\n--- Terminal Idle ---"
        
        while true; do
            echo "❤️ I love you Maa ❤️"
            
            # Wait 10 seconds before printing again, or stop if a key is pressed
            read -t 10 -n 1 wake_up
            if [ $? -eq 0 ]; then
                echo -e "\n--- Welcome Back! ---"
                break # Breaks out of the banner loop
            fi
        done
    fi
done
