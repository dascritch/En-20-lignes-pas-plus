#!/bin/bash

LOCK_DIR=~/locks
LOCK_FILE=${LOCK_DIR}/cron.lock

function lock_script() {
    mkdir -p ${LOCK_DIR}
    if [ -f "${LOCK_FILE}" ]; then 
        LOCKING_PID=`cat ${LOCK_FILE}`
        >&2  echo "ERROR : Script ${CALLED_FUNCTION} already locked on PID ${LOCKING_PID}. Cannot run PID $$ . Still running ?"
        exit 1
    fi
    echo $$ > ${LOCK_FILE}
}

function unlock_script() {
    rm ${LOCK_FILE}
}