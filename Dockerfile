from ubuntu:latest

run apt-get update && \
    apt-get install -y curl software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && \
    mkdir -p /tmp && \
    export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    echo "tzdata tzdata/Areas select Europe" > /tmp/tzdata.txt && \
    echo "tzdata tzdata/Zones/Europe select London" >> /tmp/tzdata.txt && \
    debconf-set-selections /tmp/tzdata.txt && \
    curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y wget jq build-essential openjdk-8-jdk maven iputils-ping net-tools nodejs python python-dev python-pip neovim php php-cli git gawk autoconf automake bison libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev netcat nmap vim tcpdump && \
    apt autoclean && \
    apt-get clean && \
    apt autoremove

run npm install -g n && \
    n latest

run curl -fsSL get.docker.com | bash

run curl -sSL https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz -o go.tar.gz && \
    tar -xvf go.tar.gz && \
    rm -f go.tar.gz && \
    mv go /usr/local && \
    mkdir -p /root/go && \
    echo "export GOROOT=/root/go" >> ~/.bash_profile && \
    echo "export PATH=$PATH:/home/bryan_dollery/bin:/usr/local/go/bin" >> ~/.bash_profile && \
    echo "export PATH=$PATH:$GOROOT/bin" >> ~/.bash_profile && \
    echo "alias ll='ls -gAlFh'" >> ~/.bash_profile

run curl -sSL https://get.rvm.io | bash - && \
    . /etc/profile.d/rvm.sh && \
    /usr/local/rvm/bin/rvm install ruby --default

run sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
run update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64 && \
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre


run echo "Complete"
