#!/bin/bash

LOG_FILE="../logs/health.log"
echo "====================================================================================================" >> $LOG_FILE
echo "server healthcheck - $(date)" >> $LOG_FILE
echo "====================================================================================================" >> $LOG_FILE


#cpu usage

echo "CPU usage:" >> $LOG_FILE
top -bn1 | grep "Cpu(s)" >> $LOG_FILE

#memory usage

echo "Memory usage:" >> $LOG_FILE
free -h >> $LOG_FILE

#disc usgae

echo "Disc usage:" >> $LOG_FILE
df -h >> $LOG_FILE

#running services

echo "" >> $LOG_FILE
echo "running services:" >> $LOG_FILE
ps -ef | head  >> $LOG_FILE


#network check

echo "" >> $LOG_FILE
echo "Internet connectivity:" >> $LOG_FILE

ping -c 2 google.com > /dev/null

if [ $? -eq 0 ]
then 
	echo "intenet is connected" >> $LOG_FILE
       else
	echo "no internet connection" >> $LOG_FILE
fi

echo "" >> $LOG_FILE
echo "Health check completed" >> $LOG_FILE



