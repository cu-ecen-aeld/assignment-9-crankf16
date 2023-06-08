#!/bin/sh

case "$1" in 

	start)
		echo 'Starting Crankf16 Processes Scull and Faulty'
		/usr/bin/module_load hello
		/usr/bin/scull_load
		/usr/bin/module_load faulty
		echo 'Here comes the AESDCHAR driver'
		/usr/bin/aesdchar_load
		;;
		
	stop)
		echo 'Stopping Crankf16 Processes Scull and Faulty'
		/usr/bin/module_unload hello
		/usr/bin/module_unload faulty
		/usr/bin/scull_unload
		/usr/bin/aesdchar_unload
		;;
		
	*)
	echo "Usage: $0 {start|stop}"
	exit 1
esac

exit 0
