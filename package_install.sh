#!/bin/bash
USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
    echo "you are super user"
else
    echo "you must be super user to execute"
    exit1
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installation success"
else
    echo "installation FAILURE"
    exit1
fi
