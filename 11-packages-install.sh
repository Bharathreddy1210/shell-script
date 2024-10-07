#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE() {
        if [ $? -ne 0 ] 
      then 
          echo "$2...FAILURE"
          Exit 1
      else
          echo "$2...SUCCESS"
        fi
}

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
   echo -e $R "please login with root user" $N
   exit 1
else
   echo -e $Y "Super User" $N
fi

for i in $@
do
  echo "package to install: $i"
  dnf list installed $i &>>$LOGFILE
  if [ $? eq 0 ]
  then  
      echo -e $Y "$i already installed....SKIP" $N
  else
      dnf install $i -y &>>$LOGFILE
      VALIDATE $? "Installation of $i"
  fi 
done



