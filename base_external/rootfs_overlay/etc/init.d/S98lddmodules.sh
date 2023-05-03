#!/bin/sh

case "$1" in 

	start)
		echo 'Starting Crankf16 Processes Scull and Faulty'
		/usr/bin/scull_load
		/usr/bin/module_load faulty
		modprobe hello
		;;
		
	stop)
		echo 'Stopping Crankf16 Processes Scull and Faulty'
		rmmod hello
		/usr/bin/module_unload faulty
		/usr/bin/scull_unload
		;;
		
	*)
	echo "Usage: $0 {start|stop}"
	exit 1
esac

exit 0
