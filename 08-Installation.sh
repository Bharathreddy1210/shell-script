#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1 # manually exit if error comes.
else
    echo "Super user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of Mysql.... Failure"
    exit 1
else 
    echo "Installation of Mysql...Success"
fi

