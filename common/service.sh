#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread
# these two should allow sepolicy=enforcing processing on most of devices
magiskpolicy --live "allow audioserver audioserver_tmpfs file { read write execute }"
magiskpolicy --live "allow mediaserver mediaserver_tmpfs file { read write execute }"
# this one seems to be specific to OnePlus 5, possibly many others.
magiskpolicy --live "allow hal_audio_default hal_audio_default process { execmem }"
# this one is a fix for Xiaomi Mi A1 and for Pixels running stock Oreo.
# probably fixes sepolicy for many other Oreo devices.
magiskpolicy --live "allow hal_audio_default hal_audio_default_tmpfs file { execute }"
