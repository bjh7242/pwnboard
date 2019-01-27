FROM ubuntu:latest

RUN apt-get update && \
  apt-get install -y redis-server \
  python3-redis \
  python3-flask \ 
  python3-yaml \
  python3-requests
  
EXPOSE 80

COPY . /opt/pwnboard/
COPY config.yml /etc/pwnboard/config.yml
COPY slack_token /etc/pwnboard/slack_token
WORKDIR /opt/pwnboard/

#CMD ["service", "redis-server", "start"]
#CMD service redis-server start
ENTRYPOINT ["python3", "/opt/pwnboard/pwnboard.py"]
