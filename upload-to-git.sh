#!/bin/bash
source $(dirname $0)/commonfuns.sh
source $(dirname $0)/commonVars.sh

cd $JENKINS_HOME
if [ ! -e '.git' ]; then

 $GIT_PATH init .
 ACT_STATUS="$?" 
 checkStatus "0" "$ACT_STATUS" "$GIT_PATH init . Failed"
 $GIT_PATH remote add origin "$GIT_BASE_URL/${JENKINS_REPO}.git"
 ACT_STATUS="$?"
 checkStatus "0" "$ACT_STATUS" "$GIT_PATH remote add origin $GIT_BASE_URL/${JENKINS_REPO}.git"
fi

$GIT_PATH add .
ACT_STATUS="$?"
checkStatus "0" "$ACT_STATUS" "$GIT_PATH add"
DATE=$(date +%D:%H:%M:%S)
$GIT_PATH commit -m "commiting jenkins configuration Time : $DATE"
ACT_STATUS="$?"
checkStatus "0" "$ACT_STATUS" "$GIT_PATH commit to $GIT_BASE_URL/${JENKINS_REPO}.git"
$GIT_PATH push -u origin master
checkStatus "0" "$ACT_STATUS" "$GIT_PATH push -u origin master"
