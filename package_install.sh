#!/bin/bash
USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
    echo "you are super user"
else
    echo "you must be super user to execute"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installation SUCCESS"
else
    echo "installation FAILURE"
    exit 1
fi

dnf install git -y

if [ $? -eq 0 ]
then
    echo "installation SUCCESS"
else
    echo "installation FAILURE"
    exit 1
fi
