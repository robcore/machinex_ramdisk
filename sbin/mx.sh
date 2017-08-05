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

if [ -e /system/xbin/machinexrom ]; then
	rm -f "/sbin/zip";
	rm -f "/sbin/sqlite3";
	echo "[MACHINEX] Welcome to MachineX Rom.\n" | tee /dev/kmsg
else
	chown 0:2000 "/sbin/sqlite3"
	chmod 755 "/sbin/sqlite3"
	chown 0:2000 "/sbin/zip"
	chmod 755 "/sbin/zip"
fi

# Set correct r/w permissions for LMK parameters
chmod 666 /sys/module/lowmemorykiller/parameters/cost
chmod 666 /sys/module/lowmemorykiller/parameters/adj
chmod 666 /sys/module/lowmemorykiller/parameters/minfree
echo 32 > /sys/module/lowmemorykiller/parameters/cost;

echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps;

if [ -e /system/sonickles ]; then
	chown 0:0 /system/sonickles;
	chmod 777 /system/sonickles;
	echo 1134000 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_on;
	echo 1134000 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_off;
	echo "conservative" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
	echo "conservative" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor;
	echo "conservative" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
	echo "conservative" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;
fi

# Synapse
chown -R 0:0 /data/.machinex
chmod -R 777 /data/.machinex
chown -R 0:0 /sdcard/machinex
chmod -R 777 /sdcard/machinex

echo 0 > /sys/class/kgsl/kgsl-3d0/thermal_pwrlevel;
echo 450000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk;

echo 5120 > /proc/sys/vm/min_free_kbytes;

#Insecure adb...shhhh
stop adbd
cat /system/bin/sh > /sbin/adbdsh
chown 0.0 /sbin/adbdsh
chmod 0750 /sbin/adbdsh
/system/xbin/supolicy --live "permissive init_shell" "allow adbd adbd process setcurrent" "allow adbd init process dyntransition" "allow servicemanager { init_shell zygote } dir search" "allow servicemanager { init_shell zygote } file { read open }" "allow servicemanager { init_shell zygote } process getattr" "allow system_server init_shell binder { transfer call }" "allow zygote { servicemanager system_server } binder call"
start adbd

#what's the point of building your own kernel if you don't treat yourself?
if [ -e /system/robcore ]; then
	echo 2 > /sys/kernel/fast_charge/force_fast_charge;
	echo 0 > /sys/kernel/fast_charge/failsafe;
	echo 0 > /sys/kernel/fast_charge/screen_on_current_limit;
	echo 2100 > /sys/kernel/fast_charge/ac_charge_level;
	echo 1 > /sys/class/mdnie/mdnie/locked;
	setprop ro.ril.enable.amr.wideband 1;
fi

chown -h system.system /sys/devices/virtual/sec/sec_misc/drop_caches
chown -h root.root /sys/devices/virtual/sec/sec_misc/mx_drop_caches
chmod 644 /sys/devices/virtual/sec/sec_misc/mx_drop_caches

echo 0 > /sys/module/pm_8x60/modes/cpu0/retention/idle_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu1/retention/idle_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu2/retention/idle_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu3/retention/idle_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu2/standalone_power_collapse/suspend_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu3/standalone_power_collapse/suspend_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu2/standalone_power_collapse/idle_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu3/standalone_power_collapse/idle_enabled;
echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled;
echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled;
echo 1 > /sys/module/pm_8x60/modes/cpu2/power_collapse/suspend_enabled;
echo 1 > /sys/module/pm_8x60/modes/cpu3/power_collapse/suspend_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu0/wfi/suspend_enabled;
echo 0 > /sys/module/pm_8x60/modes/cpu0/wfi/idle_enabled;
echo 1 > /sys/module/pm_8x60/modes/cpu1/wfi/idle_enabled;
echo 1 > /sys/module/pm_8x60/modes/cpu2/wfi/idle_enabled;
echo 1 > /sys/module/pm_8x60/modes/cpu3/wfi/idle_enabled;
emmc_boot=`getprop ro.boot.emmc`
case "$emmc_boot"
    in "true")
        chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

#fastrpc permission setting
#insmod /system/lib/modules/adsprpc.ko
chown -h system.system /dev/adsprpc-smd
chmod -h 666 /dev/adsprpc-smd

echo "[MACHINEX] Machinex Post-Init Finishing Up" | tee /dev/kmsg
#echo 20 > /sys/devices/platform/msm_sdcc.3/idle_timeout
echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache;
echo 1 > /sys/module/rpm_resources/enable_low_power/pxo;
echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_dig;
echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_mem;

#echo electrodemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
#echo 80 > /sys/module/vmpressure/parameters/allocstall_threshold;
echo 1 > /sys/kernel/intelli_plug/intelli_plug_active;
echo Y > /sys/module/cpu_boost/parameters/input_boost_enabled;
echo 1350000 > /sys/module/cpu_boost/parameters/input_boost_freq;
echo 1 > /sys/module/msm_thermal/core_control/enabled;
echo 1 > /sys/kernel/sound_control_3/gpl_sound_control_enabled;
if [ -e /system/robcore ]; then
	echo 10 > /sys/kernel/sound_control_3/gpl_speaker_gain;
	echo 10 > /sys/kernel/sound_control_3/gpl_headphone_gain;
else
	echo 0 > /sys/kernel/sound_control_3/gpl_speaker_gain;
	echo 0 > /sys/kernel/sound_control_3/gpl_headphone_gain;
fi

chown -R 0:0 /res/synapse
chmod -R 775 /res/synapse
if [ ! -e /res/synapse/config.json ]; then
	if [ -d /sys/block/mmcblk1 ]; then
	    source /res/synapse/config.json.generate > /res/synapse/config.json
	else
	    source /res/synapse/config.json.xenerate > /res/synapse/config.json
	fi
fi
chmod -R 775 /res/synapse
chmod 775 /sbin/uci

chown -R 0:0 /data/.machinex
chmod -R 775 /data/.machinex

echo 0 > /sys/devices/virtual/mdnie/mdnie/scenario
echo 0 > /sys/devices/virtual/mdnie/mdnie/mode

# Init.d
$BB run-parts /system/etc/init.d
echo "[MACHINEX] INIT.D EXECUTED" | tee /dev/kmsg

echo "[MACHINEX] Post-Init COMPLETE" | tee /dev/kmsg
