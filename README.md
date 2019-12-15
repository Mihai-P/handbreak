
# Working on the docker image
## Prerequisites 
To run the tests you have to install goss. Follow the instructions [here](https://medium.com/@aelsabbahy/tutorial-how-to-test-your-docker-image-in-half-a-second-bbd13e06a4a9).

## Building the container
To build the container run:

```console
docker build -t handbreak .
```

## Running the container
To run the container

```console
docker run --name docker-cron -it handbreak
```

this will create a container called docker-cron.

## Working with the container

```console
docker exec -it handbreak /bin/bash
```

## Testing the docker container

See more details about testing the container [here](https://medium.com/@aelsabbahy/tutorial-how-to-test-your-docker-image-in-half-a-second-bbd13e06a4a9). You can run the tests by running: 

```console
dgoss run -it handbreak
```

## Cleaning up
To delete the container from the local machine run:

```console
docker container rm handbreak
```