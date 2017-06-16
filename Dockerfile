FROM cptactionhank/atlassian-bamboo:latest

USER root

RUN mv /etc/apt/sources.list.d /tmp/ && apt-get update && apt-get upgrade -y --quiet \
	&& curl --silent https://download.docker.com/linux/debian/gpg | apt-key add - \
	&& apt-key fingerprint 0EBFCD88 \
	&& apt-get install --quiet --yes apt-transport-https ca-certificates curl gnupg2 software-properties-common \
	&& add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
	&& apt-get install --quiet --yes apt-transport-https ca-certificates curl gnupg2 software-properties-common \
	&& apt-get update \
	&& apt-get install --quiet --yes docker-ce 

COPY "start.sh" "/"

ENTRYPOINT ["/start.sh"]
