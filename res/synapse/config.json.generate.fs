cat << CTAG
{
    name:"FS",
    elements:[
    	{ SDescription:{
        	description:"\n\tFor now, this tab just displays the status of the three main partitions.\n\n",
        	background:0
        }},
    	{ SLiveLabel:{
			refresh:10000000,
			title:"Filesystem of /cache Partition",
			style:"normal",
			action:"
			if grep -q 'cache f2fs' /proc/mounts ; then
				echo F2FS;
			else
				echo EXT4;
			fi;"
		}},
		{ SSpacer:{
		   height:1
		}},
		{ SLiveLabel:{
			refresh:10000000,
			title:"Filesystem of /data Partition",
			style:"normal",
			action:"
			if grep -q 'data f2fs' /proc/mounts ; then
				echo F2FS;
			else
				echo EXT4;
			fi;"
		}},
		{ SSpacer:{
		   height:1
		}},
		{ SLiveLabel:{
			refresh:10000000,
			title:"Filesystem of /system Partition",
			style:"normal",
			action:"
			if grep -q 'system f2fs' /proc/mounts ; then
				echo F2FS;
			else
				echo EXT4;
			fi;"
		}},
		{ SSpacer:{
		   height:1
		}},
		{ SPane:{
		title:"Filesystem Controls",
		description:""
        }},
		{ SButton:{
			label:"Remount /system as Writeable",
			action:"mount -o remount,rw \/system;
			echo Remounted \/system as Writable!;"
		}},
		{ SDescription:{
		   description:""
		}},
		{ SButton:{
			label:"Remount /system as Read-Only",
			action:"mount -o remount,ro \/system;
			echo Remounted \/system as Read-Only!;"
		}},
		{ SDescription:{
		   description:""
		}},
		{ SButton:{
			label:"Remount RootFS as Writeable",
			action:"/xbin/busybox mount -t rootfs -o remount,rw rootfs;
			echo Remounted RootFS as Writable!;"
		}},
		{ SDescription:{
		   description:""
		}},
		{ SButton:{
			label:"Remount RootFS as Read-Only",
			action:"/xbin/busybox mount -t rootfs -o remount,ro rootfs;
			echo Remounted RootFS as Read-Only!;"
		}},
		{ SDescription:{
		   description:"\n"
		}},
	{ SPane:{
		title:"Maintenance"
	}},
	{ SDescription:{
		description:""
	}},
	{ SDescription:{
		description:" Use this button to SQlite (defrag/reindex) all databases found in /data & /sdcard, this increases database read/write performance. Frequent inserts, updates, and deletes can cause the database file to become fragmented - where data for a single table or index is scattered around the database file. Running VACUUM ensures that each table and index is largely stored contiguously within the database file. In some cases, VACUUM may also reduce the number of partially filled pages in the database, reducing the size of the database file further."
	}},
	{ SDescription:{
		description:""
	}},
		{ SButton:{
			label:"Optimize Databases",
			action:"devtools optimizedb"
		}},
	{ SDescription:{
		description:""
	}},
	{ SDescription:{
		description:" NOTE: This process can take from 1-2 minutes and device may be UNRESPONSIVE during this time, PLEASE WAIT for the process to finish ! An error just means that some databases weren't succesful. Log output to /sdcard/SkyHigh/Logs/SQLite.txt."
	}},
	{ SDescription:{
		description:""
	}},
	{ SPane:{
		title:""
	}},
	{ SDescription:{
		description:""
	}},
    ]
}
CTAG
