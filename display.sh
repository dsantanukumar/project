#!/bin/bash
# ------------------------------------------------------------------
# Description: A sample script to greet a user and check system health
# ------------------------------------------------------------------

# 1. Variables and User Input
echo "Please enter your name:"
read user_name

echo -e "\nHello, $user_name! Let's check your system status.\n"

# 2. System Information Display
echo "------------------------------"
echo "Hostname:      $(hostname)"
echo "Kernel Info:   $(uname -r)"
echo "Current User:  $(whoami)"
echo "------------------------------"

# 3. Conditional (If-Else) Statement
# Check if the disk space usage on the root filesystem is over 80%
disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$disk_usage" -gt 80 ]; then
    echo "⚠️ WARNING: Disk usage is high at ${disk_usage}%!"
else
    echo "✅ Disk space is healthy. Current usage is ${disk_usage}%."
fi

echo -e "\nSystem check complete!"