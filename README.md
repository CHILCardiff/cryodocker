Docks away!

To create the image, from the directory containing the Dockerfile:

```console
foo@bar:~$ docker build . -t 'mariadbtest'
```

Then to create the container:

```console
foo@bar:~$ >> docker run --name mariadbtest -e MARIADB_ROOT_PASSWORD=cryoparty -v $HOME/cryorepos/:/var/lib/cryorepos/ -d mariadbtest
```

# Build Docker image
The first step is to build the Docker image

```bash
docker build -t 'chiltest' .
```

# Run and configure the Docker image
We need to provide the following options when running the Docker image:

There is a better way of doing this using Docker compose - we should probably do that...

| Command                                         | Description                                        |
| :---------------------------------------------- | :------------------------------------------------- |
| `-p 3306:3306`                                  | Mount MariaDB port from container                  |
| `-p 3291:3291`                                  | Mount CryoDB port from container                   |
| `-e MARIADB_ROOT_PASSWORD=cryoparty`            | Set the MariaDB root password environment variable |
| `-e CYRODB_SALT=a_poor_salt`                    | Set the CryoDB server salt                         |
| `-v /path/to/cryodb:/opt/chil/cryodb`           | Mount path from local repository to container      |
| `-v /path/to/cryodecoder:/opt/chil/cryodecoder` | Mount path from local repository to container      |
| `-v /path/to/cryoweb:/opt/chil/cryoweb`         | Mount path from local repository to container      |
| `-d`                                            | Run container in detatched mode                    |

Run the command to intialise the container 
```bash
docker run --name 'chiltest' -p 3306:3306 -p 3291:3291 -e MARIADB_ROOT_PASSWORD=cryoparty -e CYRODB_SALT=a_poor_salt -v /path/to/cryodb:/opt/chil/cryodb -v /path/to/cryodecoder:/opt/chil/cryodecoder -v /path/to/cryoweb:/opt/chil/cryoweb -d 'chiltest'
```