#!/bin/bash

# Function to check CPU, memory, and disk utilization
check_vm_health() {
    local cpu_usage=$(top -bn1 | grep "%Cpu(s)" | sed "s/.*, \([0-9.]*\)% id.*/\1/" | awk '{print 100 - $1}')
    local mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    local disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

    local health_status="healthy"
    local reasons=""

    if (( $(echo "$cpu_usage > 60" | bc -l) )); then
        health_status="not healthy"
        reasons+="CPU usage is at ${cpu_usage}%. ";
    fi

    if (( $(echo "$mem_usage > 60" | bc -l) )); then
        health_status="not healthy"
        reasons+="Memory usage is at ${mem_usage}%. ";
    fi

    if (( $(echo "$disk_usage > 60" | bc -l) )); then
        health_status="not healthy"
        reasons+="Disk usage is at ${disk_usage}%. ";
    fi

    if [ "$health_status" == "healthy" ]; then
        echo "VM is healthy"
    else
        echo "VM is not healthy. Reasons: $reasons"
    fi
}

# Check if argument is 'explain'
if [ "$1" == "explain" ]; then
    echo "This script checks the following metrics to determine VM health:";
    echo "1. CPU Usage: Should be below 60%";
    echo "2. Memory Usage: Should be below 60%";
    echo "3. Disk Usage: Should be below 60%";
else
    check_vm_health
fi
