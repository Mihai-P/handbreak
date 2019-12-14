
# Working on the docker image
## Prerequisites 
You should login into the gitlab registry by doing this:

```console
docker login registry.gitlab.com
```

You have to login using your git username and a personal access token that you can create from [here](https://gitlab.com/profile/personal_access_tokens).

To run the tests you have to install goss. Follow the instructions [here](https://medium.com/@aelsabbahy/tutorial-how-to-test-your-docker-image-in-half-a-second-bbd13e06a4a9).

## Building the container
To build the container run:

```console
docker build -t registry.gitlab.com/mihai-p/handbreak .
```

## Running the container
To run the container

```console
docker run --name docker-cron -it registry.gitlab.com/mihai-p/docker-cron
```

this will create a container called docker-cron. 

PLEASE NOTE THAT RUNNING THE CONTAINER MAY UPDATE THE DDNS IPs.

## Working with the container

```console
docker exec -it docker-cron /bin/bash
```

or you can just run something like this

```console
docker exec -it docker-cron bash /root/ddns.sh
```

## Testing the docker container

See more details about testing the container [here](https://medium.com/@aelsabbahy/tutorial-how-to-test-your-docker-image-in-half-a-second-bbd13e06a4a9). You can run the tests by running: 

```console
dgoss run -it registry.gitlab.com/mihai-p/handbreak
```

## Cleaning up
To delete the container from the local machine run:

```console
docker container rm docker-cron
```