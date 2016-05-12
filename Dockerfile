FROM gocd/gocd-agent
RUN apt-get -y update && apt-get -y install python-pip && pip install docker-compose && addgroup go users
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
