# bamboo_docker
Dockerized Bamboo with docker installed

With this container you will be able to start a Bamboo instance that is able to build Docker images.

In order to run it you can use the bamboo initd script from the repo. or you just can start the docker container with privileges.

I also recommend you to put /var/atlassian/bamboo in a volume, so every time you destroy and recreate the container, for example to upgrade it, you won´t need to re-configure bamboo.

Many thanks to cptactionhank, as this is a fork from his work.
