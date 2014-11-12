#!/bin/bash

sudo docker images | grep "latest"  | awk 'BEGIN { FS = "[ \t]+" } { print $1; print $3; }' | xargs -n 2  |  while read -r id ; do
    IMGID=`echo $id | awk 'BEGIN { FS = "[ \t]+" } { print $2; }' `
    IMGNM=`echo $id | awk 'BEGIN { FS = "[ \t]+" } { print $1; }' `
    sudo docker images | grep "^$IMGNM "| grep -v $IMGID | awk 'BEGIN { FS = "[ \t]+" } { print $3; }'
done | sort | uniq  | xargs sudo docker rmi
