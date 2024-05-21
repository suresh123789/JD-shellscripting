#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1 )
LOGFILE=/tmp/$TIMESTAMP-$SCRIPTNAME.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 FAILED"
        #exit 1
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

dnf install mysql -y &>> $LOGFILE
VALIDATE $? "mysql installation"

dnf install git -y &>> $LOGFILE
VALIDATE $? "git installation"
