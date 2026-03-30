#!/bin/bash
# Script 4: Log File Analyzer
# Author: Anshu
# Course: Open Source Software
# Project: The Open Source Audit - Linux Kernel
# Usage: ./kernel_log_analyzer.sh /var/log/dmesg

# --- Variables ---
# Argument 1 is the log file path, Argument 2 is the optional keyword [cite: 170, 171]
LOGFILE=$1
KEYWORD=${2:-"error"}  # Defaults to 'error' if no second argument is provided [cite: 171, 173]
COUNT=0

echo "==========================================="
echo "      KERNEL LOG ANALYSIS REPORT           "
echo "==========================================="

# --- File Validation (Requirement: if-then) ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found." [cite: 176]
    echo "Tip: Try /var/log/syslog or run 'dmesg > klog.txt' and analyze that."
    exit 1
fi

# --- Line-by-Line Processing (Requirement: while-read loop) ---
# IFS= prevents leading/trailing whitespace from being trimmed [cite: 177]
while IFS= read -r LINE; do
    # Requirement: if-then inside the loop to check for keywords 
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1)) [cite: 181]
        # Store the last matching line to show in the summary
        LAST_MATCH="$LINE"
    fi
done < "$LOGFILE" [cite: 182]

# --- Summary Output ---
echo "Analysis Complete for: $LOGFILE"
echo "Search Keyword     : '$KEYWORD'"
echo "Total Occurrences  : $COUNT" [cite: 183]
echo "-------------------------------------------"

if [ $COUNT -gt 0 ]; then
    echo "Last detected instance:"
    echo ">> $LAST_MATCH"
else
    echo "No $KEYWORD messages found in the log."
fi
echo "==========================================="
