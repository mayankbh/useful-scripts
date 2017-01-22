#!/bin/zsh

inotifywait \
    -r \
    -e create \
    --format "%w    %f" \
    -m \
    --exclude "^.+?\.sw.?$" . | while read INPUT; do
        
        FILENAME=`echo $INPUT | awk '{print $2}'`;
        FOLDER=`echo $INPUT | awk '{print $1}'`;
        FOLDER=${FOLDER#./};
        grive -s $FOLDER;

done
