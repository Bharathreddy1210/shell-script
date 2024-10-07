#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/TMP/$SCRIPT_NAME-$TIMESTAMP.log

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

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"


