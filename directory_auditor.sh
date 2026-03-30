#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Anshu
# Course: Open Source Software
# Project: The Open Source Audit - Linux Kernel

# --- Variables ---
# We focus on directories where the Linux Kernel lives [cite: 67, 162]
DIRS=("/boot" "/lib/modules" "/etc/default/grub" "/usr/src")

echo "==========================================="
echo "      LINUX KERNEL DIRECTORY AUDIT         "
echo "==========================================="
echo "Directory | Permissions | Owner | Size"
echo "-------------------------------------------"

# --- Audit Loop (Requirement: for loop) ---
for DIR in "${DIRS[@]}"; do
    # Check if the directory or file exists [cite: 155]
    if [ -e "$DIR" ]; then
        # Requirement: Extract permissions and owner using ls and awk 
        # $1 is permissions, $3 is owner, $4 is group
        STATS=$(ls -ld "$DIR" | awk '{print $1 " | " $3 ":" $4}')
        
        # Requirement: Report space usage using du 
        # -s for summary, -h for human-readable
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "$DIR => $STATS | $SIZE"
    else
        # Handle missing directories [cite: 161]
        echo "$DIR => [NOT FOUND on this system]"
    fi
done

echo "-------------------------------------------"
echo "Audit Complete: Most kernel directories require root/sudo for modification."
echo "==========================================="
