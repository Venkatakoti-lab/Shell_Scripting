#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
R="\e[0m"
LOGS_FOLDER="/var/log/shellscript-log/"
LOG_FILE=$(echo $0 | cut -d "." -f1) 
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILENAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
CHECK_ROOT (){
    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: Please run this script as root user"
        exit 1
    fi
}
VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 install: $R Failed $N"
        exit 1
    else 
        echo -e "$2 install: $G Success $N"
    fi
}
echo "This script is executed at: $TIMESTAMP"
CHECK_ROOT
for package in $@
do
  dnf list installed $package &>>$LOG_FILENAME
  if [ $? -ne 0 ]
  then 
        dnf install $package -y &>>$LOG_FILENAME
        VALIDATE $? "$package"
  else 
      echo -e "$package installed: Already"
  fi 
done