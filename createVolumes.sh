#!/bin/bash
# this script was originally imported from:
# https://github.com/patrocinio/microbank/blob/master/scripts/createVolumes.sh
# thanks to Eduardo Patrocinio ( https://github.com/patrocinio )

# add your nfs server address 
FILE_SERVER=192.168.130.10
# add the directory you are sharing ( get this info running showmount -e 192.168.130.10)
FILE_PATH=/k8s
# add an directory to be temporary place for the creating of yaml
TEMP_FILE=/tmp/volume.yaml

# args: 
# 1: file
# 2: begin
# 3: end
function create_pv () {
	for i in $(eval echo "{$2..$3}")
	do
   		echo Creating PV $i
   		kubectl delete pv d-${i}
		sed s/FILE_SERVER/$FILE_SERVER/g < volume_config/$1.yaml | \
   		sed s:FILE_PATH:$FILE_PATH:g  | \
   		sed s/FILE_SYSTEM/d-${i}/g > $TEMP_FILE

   		cat $TEMP_FILE
   		kubectl create -f /tmp/volume.yaml
	done
}

create_pv 'rwo' 1 20
create_pv 'rwx' 21 40
create_pv 'rwx-large' 41 50
create_pv 'rwo-large' 51 60

