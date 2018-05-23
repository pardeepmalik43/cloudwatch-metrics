#!/bin/bash

#Update ubuntu
apt-get update

##Install zip unzip & perl 
apt-get install libwww-perl libdatetime-perl zip unzip -y

#Monitor Script
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O

#Unzip CloudWatch Script
unzip CloudWatchMonitoringScripts-1.2.2.zip 

#Check reported metrics to CloudWatch
./mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --mem-used --mem-avail


##Set Cronjob in Crontab
(crontab -l ; echo "*/5 * * * * ~/aws-scripts-mon/mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --disk-space-util --disk-path=/ --from-cron") | crontab -

