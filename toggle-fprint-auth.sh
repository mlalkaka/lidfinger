#!/bin/sh
PATH=/bin:/usr/bin

logger --tag lidfinger Toggling fingerprint sensor

grep -q close /proc/acpi/button/lid/LID/state
if [ $? = 0 ]; then
    logger --tag lidfinger Disabling fingerprint sensor
    echo 0 > /sys/bus/usb/devices/1-9/authorized
    if [ $? = 0 ]; then
        logger --tag lidfinger Successfully disabled fingerprint sensor
    else
        logger --tag lidfinger Failed to disable fingerprint sensor
    fi
fi

grep -q open /proc/acpi/button/lid/LID/state
if [ $? = 0 ]; then
    logger --tag lidfinger Enabling fingerprint sensor
    echo 1 > /sys/bus/usb/devices/1-9/authorized
    if [ $? = 0 ]; then
        logger --tag lidfinger Successfully enabled fingerprint sensor
    else
        logger --tag lidfinger Failed to enable fingerprint sensor
    fi
fi

logger --tag lidfinger Finished toggling fingerprint sensor

exit 0
