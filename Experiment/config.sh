#!/bin/sh

KEYS_PLIST=Keys.plist
SECRET_KEYS=~/.secretkeys

if [ -f "${SECRET_KEYS}" ] && [ -f "${KEYS_PLIST}" ]; then
    source ${SECRET_KEYS}
    echo ${GREETING}
else
    echo "Fail!"
fi
