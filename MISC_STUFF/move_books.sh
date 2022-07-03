# for: without readarr and/or without calibre integration in readarr
# for manual cronning

find /volume1/downloads/[[FOLDER]]/books -name '*.epub' -exec mv {} /volume1/docker/calibre/upload/ \;

find /volume1/downloads/[[FOLDER]]/books -name '*.pdf' -exec mv {} /volume1/docker/calibre/upload/ \;

find /volume1/downloads/[[FOLDER]]/books -depth -type d -empty -exec rmdir {} \;


# manual upload w readarr by adding to Wanted manually 
