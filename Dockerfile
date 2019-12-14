FROM ubuntu:18.04

MAINTAINER Mihai Petrescu <mihai.petrescu@gmail.com>

RUN apt-get update

RUN apt-get install -y software-properties-common

# install handbreak
RUN add-apt-repository ppa:stebbins/handbrake-releases
RUN apt-get install -y handbrake-cli

# Add crontab file in the cron directory
COPY handbrake.sh /root/handbrake.sh
