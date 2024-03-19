#!/bin/bash

processName="sshd"

ps aux | grep -q $processName > /dev/null

if [ $? == 0 ];
then
        echo "$(date) - $processName is running!" >> /process-cron.log
else
        echo "$(date) - $processName is not running, starting..." >> /process-cron.log
        sudo service ssh start
fi
