FROM mariadb:11.2

WORKDIR /usr/local/src

# Update apt
RUN apt update

# Install Python 3.12
RUN apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update -y 
RUN apt install -y python3.12 python3.12-dev
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12
RUN python3.12 -m pip install virtualenv
RUN apt install -y libmariadb-dev

RUN apt install -y apache2 apache2-utils apache2-dev ssl-cert libapache2-mod-wsgi-py3 

RUN apt install git

EXPOSE 3306
EXPOSE 3291

WORKDIR /opt/chil
# Create virtual environment
RUN python3.12 -m virtualenv .env

# Create a 'chiltest' user
RUN useradd -ms /bin/bash chiltest
RUN chown --recursive chiltest /opt/chil 
RUN chown --recursive chiltest /var/lib/mysql

USER chiltest