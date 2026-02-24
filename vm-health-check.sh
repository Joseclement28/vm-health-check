#!/bin/bash

# vm-health-check.sh
# A script to check the health of the virtual machine including CPU, disk space, memory usage.

# Function to display CPU information
check_cpu() {
    echo "CPU Info:"
    lscpu | grep 'Model name'
    echo
}

# Function to display disk space usage
check_disk() {
    echo "Disk Space Usage:"
    df -h
    echo
}

# Function to display memory usage
check_memory() {
    echo "Memory Usage:"
    free -h
    echo
}

# Display script explanation
show_explanation() {
    echo "This script checks the following VM health metrics:" 
    echo "- CPU Information"
    echo "- Disk Space Usage"
    echo "- Memory Usage"
}

# Check for command line arguments
if [ "$#" -eq 1 ]; then
    if [ "$1" == "explain" ]; then
        show_explanation
    else
        echo "Invalid argument. Use 'explain' to understand script usage."
    fi
else
    check_cpu
    check_disk
    check_memory
fi
