#!/bin/bash

USERID=$(id -u)
VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo "$2: FAILED"
        exit 1
    else
        echo "$2: SUCCESS"
    fi
}
if [ USERID -ne 0 ]
then
    echo "ERROR:: please run this script as root user"
    exit 1
fi 

dnf list installed mysql
if [ $? -ne 0 ]
then #not installed
    dnf install mysql -y
    VALIDATE $? "mysql installation"
else
    echo "mysql installed: ALREADY"
fi 

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "installtion git"
    # if [ $? -ne 0 ]
    # then
    #     echo "git installation: FAILED"
    #     exit 1
    # else
    #     echo "git installation: SUCCESS"
    # fi 
else
    echo "git installed: ALREADY"
fi 