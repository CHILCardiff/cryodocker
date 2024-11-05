#!/bin/sh
# This script checks if the container is started for the first time.

CONTAINER_FIRST_STARTUP="CONTAINER_FIRST_STARTUP"
if [ ! -e /$CONTAINER_FIRST_STARTUP ]; then
    touch /$CONTAINER_FIRST_STARTUP
    # place your script that you only want to run on first startup.
    
    # Configure database
    echo "I'm configuring the DATABASE!!!"

    mariadb -u root --password=$MARIADB_ROOT_PASSWORD < /usr/bin/cryorepos/configure_chiltest.sql
    

fi