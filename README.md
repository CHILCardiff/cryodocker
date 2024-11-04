Docks away!

To create the image, from the directory containing the Dockerfile:

```console
foo@bar:~$ docker build . -t 'mariadbtest'
```

Then to create the container:

```console
foo@bar:~$ >> docker run --name mariadbtest -e MARIADB_ROOT_PASSWORD=cryoparty -v $HOME/cryorepos/:/var/lib/cryorepos/ -d mariadbtest
```

