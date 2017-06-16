# bamboo_docker
Dockerized Bamboo with docker installed

With this container you will be able to start a Bamboo instance that is able to build Docker images.

In order to run it you can use the following initD

#!/bin/sh

### BEGIN INIT INFO
# Provides:       bamboo
# Required-Start:    $local_fs $remote_fs $network $syslog $named
# Required-Stop:     $local_fs $remote_fs $network $syslog $named
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts bamboo
# Description:       starts Bamboo using start-stop-daemon
### END INIT INFO

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
NAME=bamboo
DESC=bamboo

start() {
        /usr/bin/docker pull aimartin/docker_bamboo:latest
        /usr/bin/docker rm --force "bamboo-container"
        /usr/bin/docker create --restart=no --name "bamboo-container" \
    --publish "8085:8085" \
    --privileged \
    --volume "/var/docker/bamboo:/var/atlassian/bamboo" \
    --env "CATALINA_OPTS=" \
    aimartin/docker_bamboo:latest
        /usr/bin/docker start "bamboo-container"
}

stop() {
        /usr/bin/docker stop "bamboo-container"
}

case "$1" in
        start)
                start
                ;;
        stop)
                stop
                ;;
        restart)
                stop
                sleep 5
                start
                ;;
esac
