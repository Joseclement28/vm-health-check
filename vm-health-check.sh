#!/bin/bash

# VM Health Check Script
echo "===================================="
echo "          VM Health Check           "
echo "===================================="
echo "Current Date and Time (UTC): $(date -u)"

# CPU Check
echo "------------------------------------"
echo "CPU Usage:"
# 'top' command displays CPU usage, with '-b' for batch mode and '-n1' for one iteration
echo "Top command output for CPU usage:"
top -b -n1 | grep "Cpu(s)"

# Memory Check
echo "------------------------------------"
echo "Memory Usage:"
# 'free -h' shows memory usage in human-readable format
echo "Free command output for memory usage:"
free -h

# Disk Usage
echo "------------------------------------"
echo "Disk Usage:"
# 'df -h' shows disk space usage in human-readable format
echo "DF command output for disk usage:"
df -h

# Network Check
echo "------------------------------------"
echo "Network Status:"
# 'ifconfig' or 'ip addr' displays network interfaces status
echo "Ifconfig command output for network status:"
ifconfig

# Running Processes
echo "------------------------------------"
echo "Running Processes:"
# 'ps aux' lists all running processes
echo "PS command output for running processes:"
ps aux
echo "===================================="
echo "          End of Report             "
echo "===================================="