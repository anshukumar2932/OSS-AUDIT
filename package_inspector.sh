#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Anshu
# Course: Open Source Software
# Project: The Open Source Audit - Linux Kernel

# --- Variables ---
# On Ubuntu/Debian, the kernel package is often 'linux-image-generic'
# On Fedora/CentOS/RHEL, use 'kernel'
PACKAGE="linux-image-generic"

echo "Checking system for package: $PACKAGE..."
echo "==========================================="

# --- Check if package is installed (Requirement: if-then-else) ---
# Use dpkg -l for Debian-based systems 
if dpkg -l | grep -q "^ii  $PACKAGE"; then
    echo "[STATUS]: $PACKAGE is installed on this system."
    echo "-------------------------------------------"
    
    # Requirement: Print version and summary [cite: 139]
    # apt-cache provides a clean summary for the audit report
    apt-cache show $PACKAGE | grep -E 'Version|Description|Section'
    
    echo "-------------------------------------------"
else
    echo "[ERROR]: $PACKAGE is NOT installed."
    echo "Please check your distribution's kernel package name."
    exit 1
fi

# --- Philosophy Note (Requirement: Case Statement) ---
# This fulfills the Unit 2 requirement to print a note based on the name [cite: 141]
echo "Kernel Philosophy Note:"
case $PACKAGE in
    "linux-image-generic")
        echo "The Linux Kernel: The monolithic heart of the OS, ensuring hardware and software harmony." 
        ;;
    "httpd" | "apache2")
        echo "Apache: The web server that built the open internet." [cite: 143]
        ;;
    "mysql-server" | "mysql")
        echo "MySQL: Open source data management at the heart of millions of apps." [cite: 144]
        ;;
    *)
        echo "Software Name: $PACKAGE - An essential component of the FOSS ecosystem."
        ;;
esac
echo "==========================================="
