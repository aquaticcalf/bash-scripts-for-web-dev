#!/bin/bash

# Script to find and delete node_modules, venv, and .venv directories

# Check if script is run with sudo
if [ "$(id -u)" -ne 0 ]; then
   echo "This script must be run with sudo privileges"
   echo "Please try again with: sudo $0"
   exit 1
fi

echo "====================================="
echo "  Directory Cleanup Tool"
echo "====================================="
echo "This script will search for and delete:"
echo "  - node_modules"
echo "  - venv"
echo "  - .venv"
echo
echo "Starting directory: $(pwd)"
echo

# Ask for confirmation
read -p "Are you sure you want to continue? (y/n): " confirm
if [[ $confirm != [yY] ]]; then
    echo "Operation cancelled."
    exit 0
fi

echo "Searching for directories to remove..."

# Find and delete node_modules
echo -e "\nFinding node_modules directories..."
find "$(pwd)" -type d -name "node_modules" -print -exec rm -rf {} \; 2>/dev/null || true

# Find and delete venv
echo -e "\nFinding venv directories..."
find "$(pwd)" -type d -name "venv" -print -exec rm -rf {} \; 2>/dev/null || true

# Find and delete .venv
echo -e "\nFinding .venv directories..."
find "$(pwd)" -type d -name ".venv" -print -exec rm -rf {} \; 2>/dev/null || true

echo -e "\nOperation completed."
echo "Please note: If you see 'find: ... No such file or directory' errors, this is normal"
echo "It happens when find tries to access the directory it just deleted."
