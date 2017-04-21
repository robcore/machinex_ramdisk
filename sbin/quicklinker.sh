#!/system/bin/sh
export PATH=/sbin:/system/bin:/system/xbin:/res/synapse/actions:$PATH

# Symlink init to daemons
ln -sf /init /sbin/ueventd
ln -sf /init /sbin/watchdogd

