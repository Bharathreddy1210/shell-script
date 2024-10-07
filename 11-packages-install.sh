#!/bin/bash

USERID=$(id-u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then 
   echo $R "please login with root user" $N
else
   echo $Y "Super User"
fi

