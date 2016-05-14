FROM gocd/gocd-agent
RUN apt-get -y update && apt-get -y install python-pip && pip install docker-compose && addgroup go users && chmod 777 /var/run/docker.sock
COPY ./post-run/ /opt/post-run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD /opt/post-run/post-run && /sbin/my_init