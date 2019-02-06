#!/bin/bash
# Files are compressed before they are moved into the archive directory.
# This script creates a subdirectory in the current directory, to which old files are moved.
# After files are moved, they will be protected by changing their read, write and execution permissions.
# Might be something for cron (if slightly adapted) to execute weekly or monthly.
ARCHIVENR=`date +%Y%m%d`
DESTDIR="$PWD/archive-$ARCHIVENR"
mkdir "$DESTDIR"
# using quotes to catch file names containing spaces, using read -d for more
# fool-proof usage:
find "$PWD" -type f -a -mtime +5 | while read -d $'\000' file
do
    gzip "$file"; mv "$file".gz "$DESTDIR"
    echo "$file archived"
done

echo "This script can make any of the files in this directory private."
echo "Enter the number of the file you want to protect:"
select FILENAME in *;
do
    echo "You picked $FILENAME ($REPLY), it is now only accessible to you."
    chmod go-rwx "$FILENAME"
done
