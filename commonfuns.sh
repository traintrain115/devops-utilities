#!/bin/bash

func checkStatus() {

if [ "$1" == "$2" ]; then
 echo "$3 Success"
 echo "0"
else
 echo "$3 Failed"
 exit 5
fi

}
