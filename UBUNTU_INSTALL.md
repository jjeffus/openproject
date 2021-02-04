# Custom Version of OpenProject

This is a guide for setting up and deploying a installing the custom  version of
OpenProject in docker.

## Install on Debian/Ubuntu

First download the .deb file on the target system.

```
wget http:///ec2-3-15-237-164.us-east-2.compute.amazonaws.com/openproject.latest.deb
```

Now install the dependencies and update.

```
sudo apt update
sudo sh -c 'apt-get install -y zlib1g-dev build-essential           \
                    libssl-dev libreadline-dev                      \
                    libyaml-dev libgdbm-dev                         \
                    libncurses5-dev automake                        \
                    postgresql postgresql-contrib libpq-dev         \
                    libtool bison libffi-dev git curl               \
                    poppler-utils unrtf tesseract-ocr catdoc        \
                    libxml2 libxml2-dev libxslt1-dev # nokogiri     \
                    imagemagick memcached'
```

Install the .deb file.

```
sudo apt install ./openproject.latest.deb
```

Now run the installer to configure the instance.

```
sudo openproject configure
```
