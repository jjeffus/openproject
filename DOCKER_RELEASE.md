# Custom Version of OpenProject

This is a guide for setting up and deploying a installing the custom  version of
OpenProject in docker.

## To Build a Docker Image

Then add the GPG key for the official Docker repository to your system:
```
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Add the Docker repository to APT sources:

```
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
```

Make sure you are about to install from the Docker repo instead of the default Ubuntu repo:

```
    sudo apt-cache policy docker-ce
    sudo apt install docker-ce
```

If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:

```
    sudo usermod -aG docker ${USER}
```

To apply the new group membership, log out of the server and back in, or type the following:

```
    su - ${USER}
```

First get the base docker image

```
    docker pull ubuntu
```

Once this loads run

```
  docker run -it ubuntu
```

Now follow the guide for installing on Ubuntu.
When ready for release.

To push your image, first log into Docker Hub.

```
    docker login -u docker-registry-username
```

Then you may push your own image using:

```
    docker push docker-registry-username/docker-image-name
```
