#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs/"
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
        echo -e "$2: $R Failed $N"
        exit 1
    else 
        echo "$2: $G Success $N"
    fi
}

echo "This script executed at : $TIMESTAMP"
CHECK_ROOT
dnf list installed mysql &>>$LOG_FILENAME
if [ $? -ne 0 ]
then 
    dnf install mysql -y &>>$LOG_FILENAME
    VALIDATE $? "mysql installed"
else 
    echo "mysql installed: $Y already $N"
fi 
dnf list installed git &>>$LOG_FILENAME
if [ $? -ne 0 ]
then 
    dnf install git -y &>>$LOG_FILENAME
    VALIDATE $? "git installed"
else 
    echo -e "git installed: $Y Already $N"
fi