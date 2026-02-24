#!/bin/bash

# Function to check VM health
check_health() {
    local cpu_utilization=$1
    local memory_utilization=$2
    local disk_utilization=$3

    # Check if all metrics are below threshold
    if (( $(echo "$cpu_utilization < 60" | bc -l) )) && (( $(echo "$memory_utilization < 60" | bc -l) )) && (( $(echo "$disk_utilization < 60" | bc -l) )); then
        echo "VM is healthy"
    else
        echo "VM is not healthy"
        if (( $(echo "$cpu_utilization >= 60" | bc -l) )); then
            echo "CPU utilization is above 60%: $cpu_utilization%"
        fi
        if (( $(echo "$memory_utilization >= 60" | bc -l) )); then
            echo "Memory utilization is above 60%: $memory_utilization%"
        fi
        if (( $(echo "$disk_utilization >= 60" | bc -l) )); then
            echo "Disk space utilization is above 60%: $disk_utilization%"
        fi
    fi
}

# Main script execution
if [[ $1 == "explain" ]]; then
    echo "This script checks the health of a VM based on CPU, memory, and disk space utilization. It marks the VM as healthy if all metrics are below 60%. If any metric exceeds 60%, the VM is marked as not healthy, along with detailed reasons for the status."
else
    # Simulated metrics; in reality, you would fetch these from the system
    cpu_utilization=50   # Replace with actual command to get CPU usage
    memory_utilization=40 # Replace with actual command to get memory usage
    disk_utilization=30   # Replace with actual command to get disk usage

    check_health $cpu_utilization $memory_utilization $disk_utilization
}