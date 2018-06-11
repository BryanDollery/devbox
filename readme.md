# Docker Hub

hub.docker.com - bryandollery/devbox

---

# What?

Docker image that contains most tools needed to build and compile software and to play around with things. Manifest includes:

 - curl
 - wget 
 - lnav 
 - ldap-utils 
 - vim 
 - jq 
 - openssh-client
 - openssl
 - unzip
 - build-essential (includes c/c++, make, etc.)
 - docker-ce 
 - openjdk-8-jdk (java 8)
 - python 
 - python-dev 
 - python-pip 
 - python-software-properties 
 - php 
 - php-cli 
 - git 
 - nodejs & npm
 - is-up
 - terraform (with aws plugin cached)
 -
 - Also installed are ohmybash and awesome vim, just to make your life easier, but they only work when running as root (see below).

This takes agest to build and takes up 1.5GB


# Build

Use the build script. By default it builds bryandollery/devbox, but you should change this if you want your own fork

# Install

Install the run scripts in ~/bin on the host, creating the folder if necessary, and add ~/bin to the path (without checking if it's already there)

# Run

devbox: Run the container as root. This is really useful if you want to run other containers or experiment with installing things in ubuntu, or if you just want to use the cool bash and vim extensions

devboxme: Run the container as yourself (copies your groups and password files, uses your uid and your username). This allows you to create files as yourself, rather than as root, which is the default.

Run the run script to run the container. By default your entire home directory is mapped to the same location in the devbox, and it is started in the same directory you're currently in. The docker socket is mapped, so it's available. You may be running as root (your choice), so be aware that any files or directories you create will be owned by root.

# How?

The aws.tf file is used to force terraform to download the aws provider plugin. The rest is standard bash scripts.
