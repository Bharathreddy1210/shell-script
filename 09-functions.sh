#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"

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
    echo -e $R "Please run this script as root user"
    exit 1
else 
    echo -e $G "you are super user"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"


