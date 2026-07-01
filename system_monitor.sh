#!/bin/bash

LOG_FILE="system_monitor.log"

DISK_THRESHOLD=75
MEMORY_THRESHOLD=75

echo "========================================"
echo "       System Monitoring Report"
echo "Date:$(date)"
echo "========================================"

###########################
# Disk Usage
###########################

disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk Usage : ${disk_usage}%"

if [ "$disk_usage" -ge "$DISK_THRESHOLD" ]
then
    echo "ALERT: Disk usage is above ${DISK_THRESHOLD}%"

    echo "$(date): Disk usage is ${disk_usage}%" >> $LOG_FILE
else
    echo "Disk usage is normal."
fi

echo ""

###########################
# Memory Usage
###########################

memory_usage=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2*100}')

echo "Memory Usage : ${memory_usage}%"

if [ "$memory_usage" -ge "$MEMORY_THRESHOLD" ]
then
    echo "ALERT: Memory usage is above ${MEMORY_THRESHOLD}%"

    echo "$(date): Memory usage is ${memory_usage}%" >> $LOG_FILE
else
    echo "Memory usage is normal."
fi

echo ""

###########################
# Top CPU Processes
###########################

echo "Top CPU Consuming Processes"

ps -eo pid,user,%cpu,%mem,command --sort=-%cpu | head -6

echo ""

###########################
# Top Memory Processes
###########################

echo "Top Memory Consuming Processes"

ps -eo pid,user,%cpu,%mem,command --sort=-%mem | head -6

echo ""

echo "Monitoring Completed Successfully."
	

