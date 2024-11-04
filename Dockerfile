FROM mariadb:11.2

WORKDIR /usr/local/src

# Update apt
RUN apt update

# Install Python pre-requisites
RUN apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

RUN wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz
RUN tar -xf Python-3.12.0.tgz

WORKDIR /usr/local/src/Python-3.12.0

RUN /bin/sh configure --enable-optimizations
RUN make -j 4
RUN make altinstall

RUN python3.12 -m pip install --upgrade pip

RUN echo 'alias python=python3.12' >> ~/.bashrc

WORKDIR /var/lib/cryorepos

# Create a 'chiltest' user
RUN useradd -ms /bin/bash chiltest
RUN chown --recursive chiltest /var/lib/cryorepos 
RUN chown --recursive chiltest /var/lib/mysql
USER chiltest