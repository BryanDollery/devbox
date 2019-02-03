# What?

Docker image that contains most tools needed to build and compile software and to play around with things. Manifest includes:

 - curl, wget 
 - jq 
 - build-essential (includes c/c++, make, etc.)
 - software-properties-common
 - docker-ce 
 - openjdk-8-jdk (java 8)
 - go
 - ruby, rvm
 - python 
 - python-dev 
 - python-pip 
 - php 
 - php-cli 
 - git 
 - nodejs (includes npm and n the version manager)
 - net-tools, ping, etc.

This takes nearly 9 minutes to build and takes up 1.6GB

---

# Build
Run the build script

# Run
I have also included a script called devbox, that can be put on your path to make a 'devbox' command. 
