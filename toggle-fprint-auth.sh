#!/bin/sh
PATH=/bin:/usr/bin

logger --tag lidfinger Toggling fingerprint sensor

grep -q close /proc/acpi/button/lid/LID/state
if [ $? = 0 ]; then
    logger --tag lidfinger Disabling fingerprint sensor
    echo 0 > /sys/bus/usb/devices/1-9/authorized
fi

grep -q open /proc/acpi/button/lid/LID/state
if [ $? = 0 ]; then
    logger --tag lidfinger Enabling fingerprint sensor
    echo 1 > /sys/bus/usb/devices/1-9/authorized
fi

logger --tag lidfinger Finished toggling fingerprint sensor

exit 0
