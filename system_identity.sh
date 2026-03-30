#!/bin/bash
# Script 1: System Identity Report
# Author: Anshu
# Course: Open Source Software
# Project: The Open Source Audit - Linux Kernel

# --- Variables ---
# Use command substitution $() to capture system data [cite: 99, 110]
NAME="$(whoami)"
SOFTWARE_CHOICE="Linux Kernel"
KERNEL_VERSION=$(uname -r)           # Displays the kernel release [cite: 110]
DISTRO_NAME=$(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'"' -f2)
USER_NAME=$(whoami)                  # Current logged-in user [cite: 110]
HOME_DIR=$HOME                       # User's home directory [cite: 96]
UPTIME_VAL=$(uptime -p)              # Pretty format for system uptime [cite: 111]
CURRENT_DATE=$(date +"%A, %d %B %Y")  # Formatted current date [cite: 97]

# --- Display Output ---
# Formatting with echo for a professional look [cite: 113, 114]
echo "==========================================="
echo "        OPEN SOURCE AUDIT REPORT           "
echo "==========================================="
echo "Student Name    : $STUDENT_NAME"
echo "Software Choice : $SOFTWARE_CHOICE"
echo "Date            : $CURRENT_DATE"
echo "-------------------------------------------"
echo "System Host Info:"
echo "Distro          : $DISTRO_NAME"
echo "Kernel Version  : $KERNEL_VERSION"
echo "Current User    : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "System Uptime   : $UPTIME_VAL"
echo "-------------------------------------------"

# Requirement: A message stating the OS license [cite: 98]
echo "License Note: This operating system is powered by the Linux Kernel,"
echo "which is distributed under the GNU General Public License v2 (GPLv2)."
echo "==========================================="
