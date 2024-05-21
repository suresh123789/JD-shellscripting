#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1 )
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R=$(\e[31m)
G=$(\e[32m)
Y=$(\e[33m)
N=$(\e[0m)


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 $R FAILED $N"
        #exit 1
    else
        echo "$2 $G SUCCESS $N"
    fi
}
if [ $USERID -eq 0 ]
then 
    echo "$G you are super user $N"
else
    echo "$R you must be super user to execute $N"
    exit 1
fi

dnf install mysql -y &>> $LOGFILE
VALIDATE $? "mysql installation"

dnf install git -y &>> $LOGFILE
VALIDATE $? "git installation"
