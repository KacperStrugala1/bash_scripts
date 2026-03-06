#!/bin/bash

CPU_USAGE=$(top -n2 -b | grep "%Cpu" | tail -1 | awk '{print 100-$8}')
RAM_USAGE=$(top -n2 -b | grep "MiB Mem" | tail -1 | awk '{print $8/$4*100}')
RAM_AVAILABLE=$(top -n2 -b | grep "MiB Mem" | tail -1 | awk '{print 100-($8/$4*100)}')
DISK_AVAILABLE=$(df -h | grep "C:" | awk '{print $4}')
DISK_USED=$(df -h | grep "C:" | awk '{print $3}')
PROCESSES_CPU=$(top -o %CPU -b -n2 | head -12 | tail -6)
PROCESSES_MEM=$(top -o %MEM -b -n2 | head -12 | tail -6 )

echo "CPU USAGE:" $CPU_USAGE "% "
echo "RAM USAGE:" $RAM_USAGE "%"
echo "RAM AVAILABLE:" $RAM_AVAILABLE "%"
echo "USED DISK SPACE:" $DISK_USED"B"
echo "AVAILABLE DISK SPACE:" $DISK_AVAILABLE"B"
echo -e "TOP 5 Processes by CPU:" "\n" "$PROCESSES_CPU"
echo -e "TOP 5 Processes by MEMORY:" "\n" "$PROCESSES_MEM"