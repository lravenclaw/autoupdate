#!/bin/sh

USER='user'
REPO='/home/'${USER}'/Documents/autoupdate/data/'
COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`
DATELOG=`date +'%Y-%m-%d-%H-%M-%S'`
LOG="/tmp/autoupdate_data_${DATELOG}.txt"

GIT=`which git`

cd ${REPO}

"Current directory: $PWD" >> ${LOG} 2>&1
if git diff-index --quiet HEAD --; then
    echo '\nNo changes found. Skip pushing.\n'
else
    echo 'Changes found. Pushing changes...\n'
    ${GIT} config --local user.name "bash-script"
    ${GIT} config --local user.email "no-email@temp.com"
    ${GIT} add --all && git commit -m 'update' >> ${LOG} 2>&1
    sudo -u user ${GIT} push origin main >> ${LOG} 2>&1
fi

