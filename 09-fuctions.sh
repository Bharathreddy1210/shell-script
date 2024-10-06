#!/bin/bash

USERID=$(id -u)

VALIDATE(){
   if [ $? -ne 0 ]
   then 
      echo "$2...FAILURE"
      exit 1
   else
      echo "$2...SUCCESS"
   fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script as root user"
    exit 1
else 
    echo "you are super user"
fi

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install git -y
VALIDATE $? "Installing git"


