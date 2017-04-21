#!/system/bin/sh
# Copyright (c) 2009-2012, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Removed Generalized BULLSHIT and kept our device specific props

#export PATH=${PATH}:/sbin:/system/bin:/system/xbin;
export PATH=/sbin:/system/bin:/system/xbin:/res/synapse/actions:$PATH

BB=busybox

mount -o remount,rw -t auto /
mount -t rootfs -o remount,rw rootfs
mount -o remount,rw /system

#Supersu
/system/xbin/daemonsu --daemon &

# Symlink init to daemons
ln -sf /init /sbin/ueventd
ln -sf /init /sbin/watchdogd

if [ -e /system/xbin/machinexrom ]; then
	rm -f "/data/firstboot" 2> /dev/null;
	rm -f "/sbin/busybox" 2> /dev/null;
	rm -f "/sbin/zip" 2> /dev/null;
	rm -f "/sbin/sqlite3" 2> /dev/null;
	echo "[machinex] Welcome to MachineX Rom.\n" | tee /dev/kmsg
fi

#Busybox
if [ -e /data/firstboot ]; then
	    for i in /system/xbin/*; do
        if [ -L "$i" ] && ([ "`./busybox ls -l \"$i\"|./busybox grep busybox`" ] || [ ! -e "$i" ]); then
            rm "$i" 2> /dev/null;
        fi
        done

	    for i in /system/bin/*; do
        if [ -L "$i" ] && ([ "`./busybox ls -l \"$i\"|./busybox grep busybox`" ] || [ ! -e "$i" ]); then
            rm "$i" 2> /dev/null;
        fi
        done

    rm /system/bin/busybox 2> /dev/null;

	chown 0:2000 /system/xbin
	chown 0:0 /system/xbin/busybox
	chmod 755 /system/xbin/busybox
	ln --target-directory=/system/xbin -s /system/xbin/busybox [
	ln --target-directory=/system/xbin -s /system/xbin/busybox [[
	ln --target-directory=/system/xbin -s /system/xbin/busybox ash
	ln --target-directory=/system/xbin -s /system/xbin/busybox awk
	ln --target-directory=/system/xbin -s /system/xbin/busybox base64
	ln --target-directory=/system/xbin -s /system/xbin/busybox basename
	ln --target-directory=/system/xbin -s /system/xbin/busybox blkdiscard
	ln --target-directory=/system/xbin -s /system/xbin/busybox blkid
	ln --target-directory=/system/xbin -s /system/xbin/busybox bunzip2
	ln --target-directory=/system/xbin -s /system/xbin/busybox bzcat
	ln --target-directory=/system/xbin -s /system/xbin/busybox bzip2
	ln --target-directory=/system/xbin -s /system/xbin/busybox cal
	ln --target-directory=/system/xbin -s /system/xbin/busybox cat
	ln --target-directory=/system/xbin -s /system/xbin/busybox chat
	ln --target-directory=/system/xbin -s /system/xbin/busybox chattr
	ln --target-directory=/system/xbin -s /system/xbin/busybox chgrp
	ln --target-directory=/system/xbin -s /system/xbin/busybox chmod
	ln --target-directory=/system/xbin -s /system/xbin/busybox chown
	ln --target-directory=/system/xbin -s /system/xbin/busybox chroot
	ln --target-directory=/system/xbin -s /system/xbin/busybox chrt
	ln --target-directory=/system/xbin -s /system/xbin/busybox cksum
	ln --target-directory=/system/xbin -s /system/xbin/busybox comm
	ln --target-directory=/system/xbin -s /system/xbin/busybox cp
	ln --target-directory=/system/xbin -s /system/xbin/busybox crond
	ln --target-directory=/system/xbin -s /system/xbin/busybox crontab
	ln --target-directory=/system/xbin -s /system/xbin/busybox cut
	ln --target-directory=/system/xbin -s /system/xbin/busybox date
	ln --target-directory=/system/xbin -s /system/xbin/busybox dd
	ln --target-directory=/system/xbin -s /system/xbin/busybox depmod
	ln --target-directory=/system/xbin -s /system/xbin/busybox devmem
	ln --target-directory=/system/xbin -s /system/xbin/busybox df
	ln --target-directory=/system/xbin -s /system/xbin/busybox diff
	ln --target-directory=/system/xbin -s /system/xbin/busybox dirname
	ln --target-directory=/system/xbin -s /system/xbin/busybox dmesg
	ln --target-directory=/system/xbin -s /system/xbin/busybox dnsd
	ln --target-directory=/system/xbin -s /system/xbin/busybox dnsdomainname
	ln --target-directory=/system/xbin -s /system/xbin/busybox dos2unix
	ln --target-directory=/system/xbin -s /system/xbin/busybox du
	ln --target-directory=/system/xbin -s /system/xbin/busybox echo
	ln --target-directory=/system/xbin -s /system/xbin/busybox egrep
	ln --target-directory=/system/xbin -s /system/xbin/busybox env
	ln --target-directory=/system/xbin -s /system/xbin/busybox ether-wake
	ln --target-directory=/system/xbin -s /system/xbin/busybox expand
	ln --target-directory=/system/xbin -s /system/xbin/busybox expr
	ln --target-directory=/system/xbin -s /system/xbin/busybox fakeidentd
	ln --target-directory=/system/xbin -s /system/xbin/busybox fatattr
	ln --target-directory=/system/xbin -s /system/xbin/busybox fbset
	ln --target-directory=/system/xbin -s /system/xbin/busybox fdflush
	ln --target-directory=/system/xbin -s /system/xbin/busybox fdformat
	ln --target-directory=/system/xbin -s /system/xbin/busybox fgrep
	ln --target-directory=/system/xbin -s /system/xbin/busybox find
	ln --target-directory=/system/xbin -s /system/xbin/busybox fold
	ln --target-directory=/system/xbin -s /system/xbin/busybox free
	ln --target-directory=/system/xbin -s /system/xbin/busybox freeramdisk
	ln --target-directory=/system/xbin -s /system/xbin/busybox fsck
	ln --target-directory=/system/xbin -s /system/xbin/busybox fstrim
	ln --target-directory=/system/xbin -s /system/xbin/busybox fsync
	ln --target-directory=/system/xbin -s /system/xbin/busybox ftpd
	ln --target-directory=/system/xbin -s /system/xbin/busybox ftpget
	ln --target-directory=/system/xbin -s /system/xbin/busybox ftpput
	ln --target-directory=/system/xbin -s /system/xbin/busybox fuser
	ln --target-directory=/system/xbin -s /system/xbin/busybox getopt
	ln --target-directory=/system/xbin -s /system/xbin/busybox grep
	ln --target-directory=/system/xbin -s /system/xbin/busybox groups
	ln --target-directory=/system/xbin -s /system/xbin/busybox gunzip
	ln --target-directory=/system/xbin -s /system/xbin/busybox gzip
	ln --target-directory=/system/xbin -s /system/xbin/busybox hd
	ln --target-directory=/system/xbin -s /system/xbin/busybox head
	ln --target-directory=/system/xbin -s /system/xbin/busybox hexdump
	ln --target-directory=/system/xbin -s /system/xbin/busybox hostid
	ln --target-directory=/system/xbin -s /system/xbin/busybox hostname
	ln --target-directory=/system/xbin -s /system/xbin/busybox httpd
	ln --target-directory=/system/xbin -s /system/xbin/busybox hwclock
	ln --target-directory=/system/xbin -s /system/xbin/busybox i2cdetect
	ln --target-directory=/system/xbin -s /system/xbin/busybox i2cdump
	ln --target-directory=/system/xbin -s /system/xbin/busybox i2cget
	ln --target-directory=/system/xbin -s /system/xbin/busybox i2cset
	ln --target-directory=/system/xbin -s /system/xbin/busybox id
	ln --target-directory=/system/xbin -s /system/xbin/busybox ifconfig
	ln --target-directory=/system/xbin -s /system/xbin/busybox ifenslave
	ln --target-directory=/system/xbin -s /system/xbin/busybox inotifyd
	ln --target-directory=/system/xbin -s /system/xbin/busybox insmod
	ln --target-directory=/system/xbin -s /system/xbin/busybox install
	ln --target-directory=/system/xbin -s /system/xbin/busybox ionice
	ln --target-directory=/system/xbin -s /system/xbin/busybox iostat
	ln --target-directory=/system/xbin -s /system/xbin/busybox ip
	ln --target-directory=/system/xbin -s /system/xbin/busybox ipaddr
	ln --target-directory=/system/xbin -s /system/xbin/busybox ipcalc
	ln --target-directory=/system/xbin -s /system/xbin/busybox iplink
	ln --target-directory=/system/xbin -s /system/xbin/busybox iproute
	ln --target-directory=/system/xbin -s /system/xbin/busybox iprule
	ln --target-directory=/system/xbin -s /system/xbin/busybox iptunnel
	ln --target-directory=/system/xbin -s /system/xbin/busybox kill
	ln --target-directory=/system/xbin -s /system/xbin/busybox killall
	ln --target-directory=/system/xbin -s /system/xbin/busybox killall5
	ln --target-directory=/system/xbin -s /system/xbin/busybox last
	ln --target-directory=/system/xbin -s /system/xbin/busybox less
	ln --target-directory=/system/xbin -s /system/xbin/busybox linuxrc
	ln --target-directory=/system/xbin -s /system/xbin/busybox ln
	ln --target-directory=/system/xbin -s /system/xbin/busybox logname
	ln --target-directory=/system/xbin -s /system/xbin/busybox losetup
	ln --target-directory=/system/xbin -s /system/xbin/busybox ls
	ln --target-directory=/system/xbin -s /system/xbin/busybox lsattr
	ln --target-directory=/system/xbin -s /system/xbin/busybox lsmod
	ln --target-directory=/system/xbin -s /system/xbin/busybox lsof
	ln --target-directory=/system/xbin -s /system/xbin/busybox lsusb
	ln --target-directory=/system/xbin -s /system/xbin/busybox lzop
	ln --target-directory=/system/xbin -s /system/xbin/busybox lzopcat
	ln --target-directory=/system/xbin -s /system/xbin/busybox md5sum
	ln --target-directory=/system/xbin -s /system/xbin/busybox microcom
	ln --target-directory=/system/xbin -s /system/xbin/busybox mkdir
	ln --target-directory=/system/xbin -s /system/xbin/busybox mkdosfs
	ln --target-directory=/system/xbin -s /system/xbin/busybox mke2fs
	ln --target-directory=/system/xbin -s /system/xbin/busybox mkfifo
	ln --target-directory=/system/xbin -s /system/xbin/busybox mkfs.ext2
	ln --target-directory=/system/xbin -s /system/xbin/busybox mkfs.vfat
	ln --target-directory=/system/xbin -s /system/xbin/busybox mknod
	ln --target-directory=/system/xbin -s /system/xbin/busybox mkswap
	ln --target-directory=/system/xbin -s /system/xbin/busybox modinfo
	ln --target-directory=/system/xbin -s /system/xbin/busybox modprobe
	ln --target-directory=/system/xbin -s /system/xbin/busybox more
	ln --target-directory=/system/xbin -s /system/xbin/busybox mount
	ln --target-directory=/system/xbin -s /system/xbin/busybox mountpoint
	ln --target-directory=/system/xbin -s /system/xbin/busybox mt
	ln --target-directory=/system/xbin -s /system/xbin/busybox mv
	ln --target-directory=/system/xbin -s /system/xbin/busybox nameif
	ln --target-directory=/system/xbin -s /system/xbin/busybox nanddump
	ln --target-directory=/system/xbin -s /system/xbin/busybox nandwrite
	ln --target-directory=/system/xbin -s /system/xbin/busybox nc
	ln --target-directory=/system/xbin -s /system/xbin/busybox netstat
	ln --target-directory=/system/xbin -s /system/xbin/busybox nice
	ln --target-directory=/system/xbin -s /system/xbin/busybox nmeter
	ln --target-directory=/system/xbin -s /system/xbin/busybox nohup
	ln --target-directory=/system/xbin -s /system/xbin/busybox nslookup
	ln --target-directory=/system/xbin -s /system/xbin/busybox ntpd
	ln --target-directory=/system/xbin -s /system/xbin/busybox od
	ln --target-directory=/system/xbin -s /system/xbin/busybox patch
	ln --target-directory=/system/xbin -s /system/xbin/busybox pgrep
	ln --target-directory=/system/xbin -s /system/xbin/busybox pidof
	ln --target-directory=/system/xbin -s /system/xbin/busybox ping
	ln --target-directory=/system/xbin -s /system/xbin/busybox ping6
	ln --target-directory=/system/xbin -s /system/xbin/busybox pkill
	ln --target-directory=/system/xbin -s /system/xbin/busybox pmap
	ln --target-directory=/system/xbin -s /system/xbin/busybox powertop
	ln --target-directory=/system/xbin -s /system/xbin/busybox printenv
	ln --target-directory=/system/xbin -s /system/xbin/busybox printf
	ln --target-directory=/system/xbin -s /system/xbin/busybox ps
	ln --target-directory=/system/xbin -s /system/xbin/busybox pscan
	ln --target-directory=/system/xbin -s /system/xbin/busybox pstree
	ln --target-directory=/system/xbin -s /system/xbin/busybox pwd
	ln --target-directory=/system/xbin -s /system/xbin/busybox rdate
	ln --target-directory=/system/xbin -s /system/xbin/busybox rdev
	ln --target-directory=/system/xbin -s /system/xbin/busybox readahead
	ln --target-directory=/system/xbin -s /system/xbin/busybox readlink
	ln --target-directory=/system/xbin -s /system/xbin/busybox realpath
	ln --target-directory=/system/xbin -s /system/xbin/busybox renice
	ln --target-directory=/system/xbin -s /system/xbin/busybox rev
	ln --target-directory=/system/xbin -s /system/xbin/busybox rfkill
	ln --target-directory=/system/xbin -s /system/xbin/busybox rm
	ln --target-directory=/system/xbin -s /system/xbin/busybox rmdir
	ln --target-directory=/system/xbin -s /system/xbin/busybox rmmod
	ln --target-directory=/system/xbin -s /system/xbin/busybox route
	ln --target-directory=/system/xbin -s /system/xbin/busybox run-parts
	ln --target-directory=/system/xbin -s /system/xbin/busybox script
	ln --target-directory=/system/xbin -s /system/xbin/busybox scriptreplay
	ln --target-directory=/system/xbin -s /system/xbin/busybox sed
	ln --target-directory=/system/xbin -s /system/xbin/busybox seq
	ln --target-directory=/system/xbin -s /system/xbin/busybox setsid
	ln --target-directory=/system/xbin -s /system/xbin/busybox sh
	ln --target-directory=/system/xbin -s /system/xbin/busybox sha1sum
	ln --target-directory=/system/xbin -s /system/xbin/busybox sha256sum
	ln --target-directory=/system/xbin -s /system/xbin/busybox sha3sum
	ln --target-directory=/system/xbin -s /system/xbin/busybox sha512sum
	ln --target-directory=/system/xbin -s /system/xbin/busybox shuf
	ln --target-directory=/system/xbin -s /system/xbin/busybox sleep
	ln --target-directory=/system/xbin -s /system/xbin/busybox smemcap
	ln --target-directory=/system/xbin -s /system/xbin/busybox sort
	ln --target-directory=/system/xbin -s /system/xbin/busybox split
	ln --target-directory=/system/xbin -s /system/xbin/busybox start-stop-daemon
	ln --target-directory=/system/xbin -s /system/xbin/busybox stat
	ln --target-directory=/system/xbin -s /system/xbin/busybox strings
	ln --target-directory=/system/xbin -s /system/xbin/busybox stty
	ln --target-directory=/system/xbin -s /system/xbin/busybox sum
	ln --target-directory=/system/xbin -s /system/xbin/busybox swapoff
	ln --target-directory=/system/xbin -s /system/xbin/busybox swapon
	ln --target-directory=/system/xbin -s /system/xbin/busybox sync
	ln --target-directory=/system/xbin -s /system/xbin/busybox sysctl
	ln --target-directory=/system/xbin -s /system/xbin/busybox tac
	ln --target-directory=/system/xbin -s /system/xbin/busybox tail
	ln --target-directory=/system/xbin -s /system/xbin/busybox tar
	ln --target-directory=/system/xbin -s /system/xbin/busybox tee
	ln --target-directory=/system/xbin -s /system/xbin/busybox telnet
	ln --target-directory=/system/xbin -s /system/xbin/busybox telnetd
	ln --target-directory=/system/xbin -s /system/xbin/busybox test
	ln --target-directory=/system/xbin -s /system/xbin/busybox tftp
	ln --target-directory=/system/xbin -s /system/xbin/busybox tftpd
	ln --target-directory=/system/xbin -s /system/xbin/busybox time
	ln --target-directory=/system/xbin -s /system/xbin/busybox timeout
	ln --target-directory=/system/xbin -s /system/xbin/busybox top
	ln --target-directory=/system/xbin -s /system/xbin/busybox touch
	ln --target-directory=/system/xbin -s /system/xbin/busybox tr
	ln --target-directory=/system/xbin -s /system/xbin/busybox traceroute
	ln --target-directory=/system/xbin -s /system/xbin/busybox traceroute6
	ln --target-directory=/system/xbin -s /system/xbin/busybox truncate
	ln --target-directory=/system/xbin -s /system/xbin/busybox tty
	ln --target-directory=/system/xbin -s /system/xbin/busybox ttysize
	ln --target-directory=/system/xbin -s /system/xbin/busybox tunctl
	ln --target-directory=/system/xbin -s /system/xbin/busybox uevent
	ln --target-directory=/system/xbin -s /system/xbin/busybox umount
	ln --target-directory=/system/xbin -s /system/xbin/busybox uname
	ln --target-directory=/system/xbin -s /system/xbin/busybox uncompress
	ln --target-directory=/system/xbin -s /system/xbin/busybox unexpand
	ln --target-directory=/system/xbin -s /system/xbin/busybox uniq
	ln --target-directory=/system/xbin -s /system/xbin/busybox unix2dos
	ln --target-directory=/system/xbin -s /system/xbin/busybox unlink
	ln --target-directory=/system/xbin -s /system/xbin/busybox unlzop
	ln --target-directory=/system/xbin -s /system/xbin/busybox unzip
	ln --target-directory=/system/xbin -s /system/xbin/busybox uptime
	ln --target-directory=/system/xbin -s /system/xbin/busybox users
	ln --target-directory=/system/xbin -s /system/xbin/busybox usleep
	ln --target-directory=/system/xbin -s /system/xbin/busybox uudecode
	ln --target-directory=/system/xbin -s /system/xbin/busybox uuencode
	ln --target-directory=/system/xbin -s /system/xbin/busybox vconfig
	ln --target-directory=/system/xbin -s /system/xbin/busybox vi
	ln --target-directory=/system/xbin -s /system/xbin/busybox watch
	ln --target-directory=/system/xbin -s /system/xbin/busybox wc
	ln --target-directory=/system/xbin -s /system/xbin/busybox wget
	ln --target-directory=/system/xbin -s /system/xbin/busybox which
	ln --target-directory=/system/xbin -s /system/xbin/busybox who
	ln --target-directory=/system/xbin -s /system/xbin/busybox whoami
	ln --target-directory=/system/xbin -s /system/xbin/busybox whois
	ln --target-directory=/system/xbin -s /system/xbin/busybox xargs
	ln --target-directory=/system/xbin -s /system/xbin/busybox zcat
	busybox --install -s /system/xbin
	rm -rf /cache/lost+found/* 2> /dev/null;
	rm -rf /data/lost+found/* 2> /dev/null;
	rm -rf /data/tombstones/* 2> /dev/null;
	rm -rf /storage/sdcard0/Android/data/com.google.android.youtube/cache 2> /dev/null;

	if [ -d /data/data/com.af.synapse ]; then
		$BB rm -f /data/data/com.af.synapse/cache/* 2> /dev/null;
		$BB rm -f /data/data/com.af.synapse/databases/* 2> /dev/null;
		$BB rm -f /data/data/com.af.synapse/files/* 2> /dev/null;
	fi
	rm -f /data/firstboot 2> /dev/null;
fi

chmod 755 /sbin/init.qcom.mx_boot.sh
chown 0:0 /sbin/init.qcom.mx_boot.sh
chown 0:2000 "/sbin/zip"
chmod 755 "/sbin/zip"

# Set correct r/w permissions for LMK parameters
chmod 666 /sys/module/lowmemorykiller/parameters/cost
chmod 666 /sys/module/lowmemorykiller/parameters/adj
chmod 666 /sys/module/lowmemorykiller/parameters/minfree

# Cleaning (thx Slim80)
# setprop ro.ril.disable.power.collapse 0
# setprop persist.service.btui.use_aptx 1
# setprop persist.sys.ssr.restart_level 1
# Fixes for WizCyan
#setprop persist.security.tlc.otp 0
#setprop net.knoxscep.version N/A
#while we are here
#setprop sys.pwrcntl.decision.change 0
#setprop ro.qualcomm.cabl 0
#setprop ril.modem.lte.powercontrol on
#setprop persist.service.bdroid.version 0
#setprop persist.bluetooth_fw_ver bcm4335_V0343.0353.hcd

#PVSSR=`cat /sys/devices/system/soc/soc0/pvs_bin`
#if [ $PVSSR == 1 ]; then
#	echo 1 > /sys/module/subsystem_restart/parameters/restart_level;
#fi
echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps 2> /dev/null;

if [ -d /system/priv-app/STweaks ]; then
	rm -rf /system/priv-app/STweaks 2> /dev/null;
fi

if [ -e /system/priv-app/STweaks.apk ]; then
	rm -f /system/priv-app/STweaks.apk 2> /dev/null;
fi

if [ -e /system/priv-app/STweaks/STweaks.apk ]; then
	rm -f /system/priv-app/STweaks/STweaks.apk 2> /dev/null;
fi

if [ -e /system/sonickles ]; then
	chown 0:0 /system/sonickles 2> /dev/null;
	chmod 777 /system/sonickles 2> /dev/null;
	echo 1134000 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_on 2> /dev/null;
	echo 1134000 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_off 2> /dev/null;
	echo "conservative" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2> /dev/null;
	echo "conservative" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor 2> /dev/null;
	echo "conservative" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor 2> /dev/null;
	echo "conservative" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor 2> /dev/null;
fi

#give qualcomm the business, and any overzealous folks making it persistent
if [ -e /system/etc/init.qcom.post_boot.sh ]; then
	mv /system/etc/init.qcom.post_boot.sh /system/etc/init.qcom.post_boot.sh-bak
fi
if [ -e /system/bin/mpdecision ]; then
	stop mpdecision
	mv /system/bin/mpdecision /system/bin/mpdecision-bak
fi

if [ -e /system/bin/thermald ]; then
	stop thermald
	mv /system/bin/thermald /system/bin/thermald-bak
fi
if [ -e /system/lib/hw/power.default.so ]; then
	mv /system/lib/hw/power.default.so /system/lib/hw/power.default.so.bak
fi
if [ -e /system/bin/thermal-engine ]; then
	stop thermal-engine
	mv /system/bin/thermal-engine /system/bin/thermal-engine-bak
fi

# Synapse
# Make internal storage directory, and copy profiles to it.
if [ ! -d /data/.machinex ]; then
	mkdir /data/.machinex
fi

chown -R 0:0 /data/.machinex
chmod -R 777 /data/.machinex

if [ ! -d /sdcard/machinex ]; then
	mkdir /sdcard/machinex
fi

if [ ! -d /sdcard/machinex/Synapse ]; then
	mkdir /sdcard/machinex/Synapse;
fi

if [ ! -d /sdcard/machinex/Synapse/kernel_backups ]; then
	mkdir /sdcard/machinex/Synapse/kernel_backups
fi

if [ ! -d /sdcard/machinex/Synapse/saved_profiles ]; then
	mkdir /sdcard/machinex/Synapse/saved_profiles
fi
if [ ! -d /data/.machinex/saved_presets ]; then
	mkdir /data/.machinex/saved_presets
fi

if [ ! -d /sdcard/machinex/Logs ]; then
	mkdir /sdcard/machinex/Logs
fi

if [ ! -d /sdcard/machinex/ZippedLogs ]; then
	mkdir /sdcard/machinex/ZippedLogs
fi

if [ ! -d /sdcard/machinex/initbackups ]; then
		mkdir /sdcard/machinex/initbackups
fi

if [ ! -e /sdcard/machinex/Synapse/kernel_backups/.selected_boot_img ]; then
	touch /sdcard/machinex/Synapse/kernel_backups/.selected_boot_img
	echo None > /sdcard/machinex/Synapse/kernel_backups/.selected_boot_img 2> /dev/null;
fi

if [ ! -e /sdcard/machinex/Synapse/saved_profiles/.selected_config_profile ]; then
	touch /sdcard/machinex/Synapse/saved_profiles/.selected_config_profile
	echo None > /sdcard/machinex/Synapse/saved_profiles/.selected_config_profile 2> /dev/null;
fi

if [ ! -e /data/.machinex/saved_presets/.selected_preset_profile ]; then
	touch /data/.machinex/saved_presets/.selected_preset_profile
	echo None > /data/.machinex/saved_presets/.selected_preset_profile 2> /dev/null;
fi

chown -R 0:0 /data/.machinex
chmod -R 777 /sdcard/machinex

if [ -e /system/etc/init.d/01fstrim ]; then
	cp -p /system/etc/init.d/01fstrim /sdcard/machinex/initbackups/01fstrim
fi

if [ -e /system/etc/init.d/01_set_init_permissions.sh ]; then
	cp -p /system/etc/init.d/01_set_init_permissions.sh /sdcard/machinex/initbackups/01_set_init_permissions.sh
fi

if [ -e /system/etc/init.d/09kill_mediasrvr ]; then
	cp -p /system/etc/init.d/09kill_mediasrvr /sdcard/machinex/initbackups/09kill_mediasrvr
fi

if [ -e /system/etc/init.d/10Kerneltweaks ]; then
	cp -p /system/etc/init.d/10Kerneltweaks /sdcard/machinex/initbackups/10Kerneltweaks
fi

if [ -e /system/etc/init.d/70zipalign ]; then
	cp -p /system/etc/init.d/70zipalign /sdcard/machinex/initbackups/70zipalign
fi

if [ -e /system/etc/init.d/85sqlite_optimize ]; then
	cp -p /system/etc/init.d/85sqlite_optimize /sdcard/machinex/initbackups/85sqlite_optimize
fi

if [ -e /system/etc/init.d/91fixUpdateService ]; then
	cp -p /system/etc/init.d/91fixUpdateService /sdcard/machinex/initbackups/91fixUpdateService
fi

if [ ! -e /data/.machinex/bck_prof ]; then
	cp -p /res/synapse/files/bck_prof /data/.machinex/bck_prof
fi

if [ ! -e /data/.machinex/dropcaches_prof ]; then
	cp -p /res/synapse/files/dropcaches_prof /data/.machinex/dropcaches_prof
fi

if [ ! -e /data/.machinex/gammafaux_prof ]; then
	cp -p /res/synapse/files/gammafaux_prof /data/.machinex/gammafaux_prof
fi

if [ ! -e /data/.machinex/gammafrancoN5_prof ]; then
	cp -p /res/synapse/files/gammafrancoN5_prof /data/.machinex/gammafrancoN5_prof
fi

if [ ! -e /data/.machinex/gammafranco_prof ]; then
	cp -p /res/synapse/files/gammafranco_prof /data/.machinex/gammafranco_prof
fi

if [ ! -e /data/.machinex/gamma_prof ]; then
	cp -p /res/synapse/files/gamma_prof /data/.machinex/gamma_prof
fi

if [ ! -e /data/.machinex/gs4.sh ]; then
	cp -p /res/synapse/files/gs4.sh /data/.machinex/gs4.sh
fi

if [ ! -e /data/.machinex/lmk_prof ]; then
	cp -p /res/synapse/files/lmk_prof /data/.machinex/lmk_prof
fi

if [ ! -e /data/.machinex/volt_prof ]; then
	cp -p /res/synapse/files/volt_prof /data/.machinex/volt_prof
fi

if [ ! -e /data/.machinex/hotplug_prof ]; then
	cp -p /res/synapse/files/hotplug_prof /data/.machinex/hotplug_prof
fi

if [ ! -e /data/.machinex/spcm_prof ]; then
	cp -p /res/synapse/files/spcm_prof /data/.machinex/spcm_prof
fi
if [ ! -e /data/.machinex/supolicy_prof ]; then
	cp -p /res/synapse/files/supolicy_prof /data/.machinex/supolicy_prof
fi
if [ ! -e /data/.machinex/gserv_prof ]; then
	cp -p /res/synapse/files/gserv_prof /data/.machinex/gserv_prof
fi

chown -R 0:0 /data/.machinex
chmod -R 777 /data/.machinex

# Backup mpdecision, powerhal, thermald and thermal-engine bs.
# They are useless for this kernel, but the user will require
# them otherwise.
MPDURR='cat /sys/module/msm_mpdecision/parameters/enabled'
if [ $MPDURR -eq 1 ]; then
	echo 0 > /sys/module/msm_mpdecision/parameters/enabled 2> /dev/null;
fi

#ensure proper default settings are selected (ramdisks can be finicky)
#echo 512 > /sys/block/mmcblk0/queue/read_ahead_kb;
#echo 512 > /sys/block/mmcblk1/queue/read_ahead_kb;
# echo 0 > /sys/devices/system/cpu/cpu0/rq-stats/hotplug_enable
#echo 0 > /sys/class/power_supply/battery/wc_enable;
echo 0 > /sys/class/kgsl/kgsl-3d0/thermal_pwrlevel 2> /dev/null;
echo 450000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk 2> /dev/null;

#Will do some testing soon regard battery

#if [ ! -e /system/sonickles ]; then
#	echo 1890000 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_on
#	echo 1890000 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_off
#	echo 1890000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
#	echo 1890000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
#	echo 1890000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
#	echo 1890000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
#fi

echo 0 > /sys/kernel/sched/arch_power 2> /dev/null;
echo 32 > /sys/module/lowmemorykiller/parameters/cost 2> /dev/null;
#Steal some permisisons from the system
#chown 0:0 /sys/class/mdnie/mdnie/mode
#chown 0:0 /sys/class/mdnie/mdnie/scenario
#chown 0:0 /sys/devices/virtual/mdnie/mdnie/mode
#chown 0:0 /sys/devices/virtual/mdnie/mdnie/scenario
#chown 0:0 /sys/class/backlight/panel/auto_brightness
#echo 0 > /sys/devices/virtual/mdnie/mdnie/outdoor;
#echo 0 > /sys/devices/virtual/mdnie/mdnie/scenario;
#echo 0 > /sys/devices/virtual/mdnie/mdnie/mode;
# Set min_free_kbytes to 5120, better than what it was
echo 5120 > /proc/sys/vm/min_free_kbytes 2> /dev/null;
#echo Y > /sys/module/hci_uart/parameters/reset

#Insecure adb...shhhh
stop adbd
cat /system/bin/sh > /sbin/adbdsh
chown 0.0 /sbin/adbdsh
chmod 0750 /sbin/adbdsh
/system/xbin/supolicy --live "permissive init_shell" "allow adbd adbd process setcurrent" "allow adbd init process dyntransition" "allow servicemanager { init_shell zygote } dir search" "allow servicemanager { init_shell zygote } file { read open }" "allow servicemanager { init_shell zygote } process getattr" "allow system_server init_shell binder { transfer call }" "allow zygote { servicemanager system_server } binder call"
start adbd
#Allow Macloader to write .cid.info
#/system/xbin/supolicy --live "permissive init_shell" "allow macloader system_data_file:file { open }" "allow macloader wifi_efs_file:dir { search }" "allow macloader wifi_efs_file:file { read open getattr }" "allow macloader wifi_file:file { write create setattr }" "allow macloader system_data_file:dir { read write create add_name }"

#Make Everything permissive
#/system/xbin/supolicy --live "permissive *"

#	echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb;
#	echo 3072 > /sys/block/mmcblk1/queue/read_ahead_kb;
#what's the point of building your own kernel if you don't treat yourself?
if [ -e /system/robcore ]; then
	echo 10 10 235 > /sys/kernel/sound_control_3/gpl_speaker_gain 2> /dev/null;
	echo 10 10 235 > /sys/kernel/sound_control_3/gpl_headphone_gain 2> /dev/null;
	echo 2 > /sys/kernel/fast_charge/force_fast_charge 2> /dev/null;
	echo 0 > /sys/kernel/fast_charge/failsafe 2> /dev/null;
	echo 0 > /sys/kernel/fast_charge/screen_on_current_limit 2> /dev/null;
	echo 2100 > /sys/kernel/fast_charge/ac_charge_level 2> /dev/null;
#	echo 1 > /sys/devices/virtual/mdnie/mdnie/mdnie_lock 2> /dev/null;
	setprop ro.ril.enable.amr.wideband 1 2> /dev/null;
fi

# Disable knox
#pm disable com.sec.enterprise.knox.cloudmdm.smdms
#pm disable com.sec.knox.bridge
#pm disable com.sec.enterprise.knox.attestation
#pm disable com.sec.knox.knoxsetupwizardclient
#pm disable com.samsung.knox.rcp.components
#pm disable com.samsung.android.securitylogagent
#ensure proper default settings are selected (ramdisks can be finicky)
#chown 0:0 /sys/class/lcd/panel/panel_colors
#chmod 644 /sys/class/lcd/panel/panel_colors
#echo 2 > /sys/class/lcd/panel/panel_colors;

#Start up hw random generator if it isn't already
qrngd
echo "[machinex] HW QRNGD ACTIVATED" | tee /dev/kmsg

#mount -o remount,ro -t auto /
#mount -t rootfs -o remount,ro rootfs
#mount -o remount,ro /system

#properties
#setprop ril.ims.ltevoicesupport 1
#setprop ril.cs_svc 1
#setprop ril.modem.lte.powercontrol 1
setprop debug.performance.tuning 0
setprop ro.qualcomm.cabl 0
setprop persist.rmnet.mux disabled
setprop persist.data.netmgrd.qos.enable false
#wifi logging
setprop debug.enable.wl_log 1
#/sbin/uci reset
#/sbin/uci
#am force-stop com.af.synapse 2> /dev/null;

#echo 2 > /sys/kernel/intelli_plug/min_cpus_online
#echo Y > /sys/module/msm_thermal/parameters/enabled;
#echo 70 > /sys/module/msm_thermal/parameters/limit_temp_degC
#echo 1 > /sys/module/msm_thermal/core_control/enabled;
#echo 80 > /sys/module/msm_thermal/parameters/core_limit_temp_degC
#if [ -e /system/robcore ]; then
#	echo machinactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2> /dev/null;
#else
#fi

# Init.d
$BB run-parts /system/etc/init.d
echo "[machinex] INIT.D EXECUTED" | tee /dev/kmsg
echo "[machinex] Machinex Init Complete" | tee /dev/kmsg

