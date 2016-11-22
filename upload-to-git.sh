#!/bin/bash
source $(pwd)/commonfuns.sh
source $(pwd)/commonVars.sh

cd $SCRIPT_PATH

if [ -e "$DEVOPS_REPO" ]; then
 rm -rf  $DEVOPS_REPO
fi

git clone "$GIT_BASE_URL/${devops_repo}.git"
ACT_STATUS="$?"
checkStatus "0" "$ACT_STATUS" "git clone of $GIT_BASE_URL/${devops_repo}.git"

cd $JENKINS_HOME
git add .
ACT_STATUS="$?"
checkStatus "0" "$ACT_STATUS" "git add"
DATE=$(date +%D:%H:%M:%S)
git commit -m "commiting jenkins configuration Time : $DATE"
ACT_STATUS="$?"
checkStatus "0" "$ACT_STATUS" "git commit to $GIT_BASE_URL/${JENKINS_REPO}.git"
