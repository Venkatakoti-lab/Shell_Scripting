#!/bin/bash

USERID=$(id -u)
if [$USERID -ne 0]
then
     echo "ERROR:: user must have sudo access to run this script"
     exit 1 #other than 0 we can give any number
fi
dnf install mysqll -y
dnf install maven -y