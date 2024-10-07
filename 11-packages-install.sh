#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then 
   echo $R "please login with root user" $N
   exit 1
else
   echo $Y "Super User" $N
fi

for i in $@
do
  echo "package to install: $i"
done


