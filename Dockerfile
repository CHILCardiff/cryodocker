FROM mariadb:11.2
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install pip
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update
RUN apt -y install python3.12

