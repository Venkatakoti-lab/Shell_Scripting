#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
     echo "ERROR:: user must have sudo access to run this script"
     exit 1 #other than 0 we can give any number
fi


dnf list installed mysql
if [ $? -ne 0 ]
then #not installed mysql package
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
         echo "Installing MySql... FAILURE"
         exit 1
    else
        echo "Installing MySql... SUCCESS"
    fi
else
     echo "MySql is already... Installed"
fi 

dnf list installed git

if [ $? -ne 0 ]
then
     dnf install git -y
     if [ $? -ne 0 ]
     then
          echo "Git installed...FAILED"
          exit 1
     else
          echo "Git installed...SUCCESSFULLY"
else
     echo "Git already...INSTALLED"
fi 

     