#!/bin/sh

# Browse only

#cp ./workload/browse_only_transitions.txt ./workload/user_transitions.txt
#cp ./workload/browse_only_transitions.txt ./workload/author_transitions.txt

#bench/flush_cache 490000
#rsh instance4 RUBBoS/flush_cache 880000 	# web server
#rsh instance2 RUBBoS/flush_cache 880000	# database
#rsh instance3 RUBBoS/flush_cache 490000	# remote client
#rsh sci7 RUBBoS/flush_cache 490000	# remote client
#rsh sci8 RUBBoS/flush_cache 490000	# remote client
#make emulator 

# Default

cp ./workload/user_default_transitions.txt ./workload/user_transitions.txt
cp ./workload/author_default_transitions.txt ./workload/author_transitions.txt

./flush_cache 490000
rsh webserver RUBBoS/flush_cache 880000	# web server
rsh dbserver RUBBoS/flush_cache 880000	# database
rsh appserver RUBBoS/flush_cache 880000	# was
#rsh instance3 RUBBoS/flush_cache 490000	# main client 
#rsh rc1 RUBBoS/flush_cache 490000	# remote client
#rsh sci8 RUBBoS/flush_cache 490000	# remote client
make emulator
