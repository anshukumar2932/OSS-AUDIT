#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Anshu
# Course: Open Source Software
# Project: The Open Source Audit - Linux Kernel

echo "==========================================="
echo "   OPEN SOURCE MANIFESTO GENERATOR         "
echo "==========================================="
echo "Answer three questions to generate your manifesto."
echo

# Requirement: Use 'read' for user input [cite: 188, 193]
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# Requirement: Use command substitution for date and variables [cite: 188, 197]
DATE_STAMP=$(date +'%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# Requirement: Compose a paragraph and write to file using > and >> [cite: 188, 200]
# '>' overwrites/creates the file, '>>' appends to it
echo "--- MY OPEN SOURCE MANIFESTO ---" > "$OUTPUT"
echo "Created on: $DATE_STAMP" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe that software like $TOOL thrives because of community collaboration." >> "$OUTPUT"
echo "To me, the heart of open source is $FREEDOM—the right to study, change, and distribute code." >> "$OUTPUT"
echo "In this spirit, I commit to building $BUILD and sharing it freely with the world." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed, $(whoami)" >> "$OUTPUT"

# Requirement: Display the saved file using cat [cite: 202]
echo "-------------------------------------------"
echo "Success! Your manifesto has been saved to $OUTPUT"
echo "-------------------------------------------"
cat "$OUTPUT"
echo "==========================================="

# Note: Demonstrated alias concept via comment 
# To run this quickly, add this to your .bashrc: 
# alias mymanifesto='./manifesto_generator.sh'
