#!/bin/bash
# This script gives information about a file.
FILENAME="$1"
if [ ! $# == 1 ]; then
    echo "Usage is: filetest filename"
    echo -n "Please enter a file name and press [ENTER]:"
    read FILENAME
    # exit 0
fi
echo "Properties for $FILENAME:"
if [ -f $FILENAME ]; then
    echo "Size is $(ls -lh $FILENAME | awk '{ print $5 }')"
    echo "Type is $(file $FILENAME | cut -d":" -f2 -)"
    echo "Inode number is $(ls -i $FILENAME | cut -d" " -f1 -)"
    echo "$(df -h $FILENAME | grep -v Mounted | awk '{ print "On",$1", which is mounted as the",$6,"partition."}')"
elif [ -d $FILENAME ]; then
    echo "Size is $(ls -dlh $FILENAME | awk '{ print $5 }')"
    echo "Type is $(file $FILENAME | cut -d":" -f2 -)"
    echo "Inode number is $(ls -di $FILENAME | cut -d" " -f1 -)"
    echo "$(df -h $FILENAME | grep -v Mounted | awk '{ print "On",$1", which is mounted as the",$6,"partition."}')"
    printf "All the text files under this directory are:\n"
    for i in `ls $FILENAME`; do file $FILENAME/$i | grep ASCII; done
else
    echo "File does not exist."
fi
