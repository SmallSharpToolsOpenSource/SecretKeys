#!/bin/sh

KEYS_PLIST=${TARGET_BUILD_DIR}/${FULL_PRODUCT_NAME}/Keys.plist
SECRET_KEYS=~/.secretkeys

if [ -f "${SECRET_KEYS}" ] && [ -f "${KEYS_PLIST}" ]; then
    source ${SECRET_KEYS}

    echo "### Found Keys.plist ###"

    # Greeting
    /usr/libexec/PlistBuddy -c "Set :Greeting '${GREETING}'" "${KEYS_PLIST}"
    /usr/libexec/PlistBuddy -c "Print :Greeting" "${KEYS_PLIST}"

    # SecretCode
    /usr/libexec/PlistBuddy -c "Set :SecretCode '${SecretCode}'" "${KEYS_PLIST}"
    /usr/libexec/PlistBuddy -c "Print :SecretCode" "${KEYS_PLIST}"

    # SecretToken
    /usr/libexec/PlistBuddy -c "Set :SecretToken '${SecretToken}'" "${KEYS_PLIST}"
    /usr/libexec/PlistBuddy -c "Print :SecretToken" "${KEYS_PLIST}"

else
    echo "### Unable to update Keys.plist ###"
fi
