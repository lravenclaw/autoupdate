#!/bin/sh

USER='user'
REPO='/home/'${USER}'/Documents/autoupdate/data/'
COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`
DATELOG=`date +'%Y-%m-%d-%H-%M-%S'`
LOG="/tmp/autoupdate_data_${DATELOG}.txt"

GIT=`which git`

cd ${REPO}

export GIT_SSL_NO_VERIFY=1

"Current directory: $PWD" >> ${LOG} 2>&1
if git diff-index --quiet HEAD --; then
    'No changes found. Skip pushing.' >> ${LOG} 2>&1
else
    'Changes found. Pushing changes...\n' >> ${LOG} 2>&1
    ${GIT} config --local user.name "bash-script"
    ${GIT} config --local user.email "no-email@temp.com"
    ${GIT} add --all && git commit -m 'update' >> ${LOG} 2>&1
    sudo -u user ${GIT} push origin main >> ${LOG} 2>&1
fi

