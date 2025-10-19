#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo -e "$2: $R FAILED $N "
        exit 1
    else 
        echo -e "$2: $G SUCCESS $N "
    fi 
}

CHECK_ROOT (){
    if [ $USERID -ne 0 ]
    then 
        echo "ERROR:PLEASE RUN THIS SCRIPT AS ROOT USER"
        exit 1
    else
        echo "YOU ARE IN SUPER_USER"
    fi
}

CHECK_ROOT

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "MYSQL installation"
    
else
    echo -e "Mysql installed: $Y ALREADY $N "
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "GIT Installation"
else
    echo -e "GIT installed: $Y ALREADY $N "
fi