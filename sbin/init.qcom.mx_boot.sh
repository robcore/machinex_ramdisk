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

chown -h system.system /sys/devices/virtual/sec/sec_misc/drop_caches
chown -h root.root /sys/devices/virtual/sec/sec_misc/mx_drop_caches
chmod 644 /sys/devices/virtual/sec/sec_misc/mx_drop_caches
#letting users decide this one, leaving params at stock
#letting users decide this one, leaving params at stock
#chown -h root /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
#chown -h root /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
#chown -h root /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
#chown -h root /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
#chown -h root /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#chown -h root /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
#chown -h root /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
#chown -h root /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
#chown -h root /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
#chown -h root /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
#chown -h root /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
#chown -h root /sys/devices/system/cpu/cpu1/online
#chown -h root /sys/devices/system/cpu/cpu2/online
#chown -h root /sys/devices/system/cpu/cpu3/online
#chmod -h 664 /sys/devices/system/cpu/cpu1/online
#chmod -h 664 /sys/devices/system/cpu/cpu2/online
#chmod -h 664 /sys/devices/system/cpu/cpu3/online
#chown -h root /sys/devices/system/cpu/cpufreq/ondemand/enable_turbo_mode
#chmod -h 664 /sys/devices/system/cpu/cpufreq/ondemand/enable_turbo_mode
#chown -h root /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
#chown -h root /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
#chown -h root /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
echo 0 > /sys/module/pm_8x60/modes/cpu0/retention/idle_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu1/retention/idle_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu2/retention/idle_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu3/retention/idle_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu2/standalone_power_collapse/suspend_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu3/standalone_power_collapse/suspend_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu2/standalone_power_collapse/idle_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu3/standalone_power_collapse/idle_enabled 2> /dev/null;
echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled 2> /dev/null;
echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled 2> /dev/null;
echo 1 > /sys/module/pm_8x60/modes/cpu2/power_collapse/suspend_enabled 2> /dev/null;
echo 1 > /sys/module/pm_8x60/modes/cpu3/power_collapse/suspend_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu0/wfi/suspend_enabled 2> /dev/null;
echo 0 > /sys/module/pm_8x60/modes/cpu0/wfi/idle_enabled 2> /dev/null;
echo 1 > /sys/module/pm_8x60/modes/cpu1/wfi/idle_enabled 2> /dev/null;
echo 1 > /sys/module/pm_8x60/modes/cpu2/wfi/idle_enabled 2> /dev/null;
echo 1 > /sys/module/pm_8x60/modes/cpu3/wfi/idle_enabled 2> /dev/null;
emmc_boot=`getprop ro.boot.emmc`
case "$emmc_boot"
    in "true")
        chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

# Google play services wakelock fix
# Controlled via Synapse
if [ -e /system/xbin/machinexrom ] || [ -e /data/.machinex/gdisable ]; then
	echo "[MACHINEX] Google Services Fix SKIPPED" | tee /dev/kmsg
else
	su -c "pm disable com.google.android.gsf/com.google.android.gsf.update.SystemUpdateService"
	su -c "pm disable com.google.android.gsf/com.google.android.gsf.subscribedfeeds.SubscribedFeedsSyncAdapterService"
	su -c "pm disable com.google.android.gsf/com.google.android.gsf.checkin.CheckinService"
	su -c "pm disable com.google.android.gsf/com.google.android.gsf.checkin.EventLogService"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateActivity"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateService"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateService$Receiver"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdateActivity"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdateService"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdateService$Receiver"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver"
	echo "[MACHINEX] Google Services Fix APPLIED" | tee /dev/kmsg
fi

#fastrpc permission setting
#insmod /system/lib/modules/adsprpc.ko
chown -h system.system /dev/adsprpc-smd
chmod -h 666 /dev/adsprpc-smd
echo "[machinex] Machinex Post-Init Finishing Up" | tee /dev/kmsg
#echo 20 > /sys/devices/platform/msm_sdcc.3/idle_timeout
echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache 2> /dev/null;
echo 1 > /sys/module/rpm_resources/enable_low_power/pxo 2> /dev/null;
echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_dig 2> /dev/null;
echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_mem 2> /dev/null;

echo electrodemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;

echo Y > /sys/module/cpu_boost/parameters/input_boost_enabled 2> /dev/null;
echo 1350000 > /sys/module/cpu_boost/parameters/input_boost_freq 2> /dev/null;

echo 1 > /sys/kernel/intelli_plug/intelli_plug_active 2> /dev/null;

echo "[machinex] Post-Init COMPLETE" | tee /dev/kmsg
