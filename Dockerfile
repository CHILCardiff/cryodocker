FROM mariadb:11.2

WORKDIR /usr/local/src

# Update apt
RUN apt update

EXPOSE 3306

WORKDIR /var/lib/cryorepos

# Create a 'chiltest' user
RUN useradd -ms /bin/bash chiltest
RUN chown --recursive chiltest /var/lib/cryorepos 
RUN chown --recursive chiltest /var/lib/mysql

USER chiltest