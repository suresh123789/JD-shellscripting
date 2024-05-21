#!/bin/bash
USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 FAILED"
        exit 1
    else
        echo "$2 SUCCESS"
    fi
}
if [ $USERID -eq 0 ]
then 
    echo "you are super user"
else
    echo "you must be super user to execute"
    exit 1
fi

dnf install mysql -y
VALIDATE $? "mysql installation"

dnf install git -y
VALIDATE $? "git installation"
