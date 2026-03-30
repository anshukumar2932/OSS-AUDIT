#!/bin/bash
# Script: Kernel Log Analyzer (Improved)
# Purpose: Analyze system logs for errors and warnings with summary

LOG_FILE="$1"

# Check if argument is provided
if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Invalid file: $LOG_FILE"
    exit 1
fi

echo "Analyzing log file: $LOG_FILE"
echo "-------------------------------------"

# Count errors and warnings separately
ERROR_COUNT=$(grep -i "error" "$LOG_FILE" | wc -l)
WARNING_COUNT=$(grep -i "warning" "$LOG_FILE" | wc -l)
TOTAL_COUNT=$((ERROR_COUNT + WARNING_COUNT))

echo "Total Issues Found : $TOTAL_COUNT"
echo "Errors            : $ERROR_COUNT"
echo "Warnings          : $WARNING_COUNT"

echo ""
echo "Top 5 Most Frequent Issues:"
echo "-------------------------------------"

# Show top 5 repeated error/warning lines
grep -iE "error|warning" "$LOG_FILE" \
    | sort \
    | uniq -c \
    | sort -nr \
    | head -5

echo ""
echo "Recent 5 Issues:"
echo "-------------------------------------"

# Show last 5 matching lines
grep -iE "error|warning" "$LOG_FILE" | tail -5
