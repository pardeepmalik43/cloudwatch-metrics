#!/bin/bash
"#################**********************************************************######################################"
echo "#                                                                                                               #"
echo "# 		Welcome!! This script will  install Cloud Watch Metrics                                       #"
echo "#                                                       						      #"
echo "#################**********************************************************######################################"

#Update ubuntu
apt-get update

echo -e "\n\n\n"
echo " 				Updating System files... "
echo -e "\n\n\n"


##Install zip unzip & perl 
apt-get install libwww-perl libdatetime-perl curl zip unzip -y

#Monitor Script
cd ~/
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O

#Unzip CloudWatch Script
unzip CloudWatchMonitoringScripts-1.2.2.zip 

cd ~/aws-scripts-mon

echo -e "\n\n\n"

#Check reported metrics to CloudWatch
./mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --mem-used --mem-avail


##Set Cronjob in Crontab
(echo "*/5 * * * * ~/aws-scripts-mon/mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --disk-space-util --disk-path=/ --from-cron") | crontab -


