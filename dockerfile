from ubuntu:latest

run apt-get update && \
    apt-get install -y curl software-properties-common && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    add-apt-repository ppa:openjdk-r/ppa && \
    add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && \
    mkdir -p /tmp && \
    export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    echo "tzdata tzdata/Areas select Europe" > /tmp/tzdata.txt && \
    echo "tzdata tzdata/Zones/Europe select London" >> /tmp/tzdata.txt && \
    debconf-set-selections /tmp/tzdata.txt && \
    sh -c "$(curl -fsSL get.docker.com -o get-docker.sh)" && \
    apt-get install -y wget jq build-essential openjdk-8-jdk iputils-ping net-tools python python-dev python-pip neovim php php-cli git nodejs gawk autoconf automake bison libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev netcat nmap vim netstat tcpdump && \
    apt autoclean && \
    apt-get clean && \
    apt autoremove

run npm install -g n && \
    n latest && \
    curl -O https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz && \
    tar -xvf go1.9.1.linux-amd64.tar.gz && \
    mv go /usr/local && \
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_profile && \
    echo "export GOROOT=$HOME/go" >> ~/.bash_profile && \
    echo "export PATH=$PATH:/home/bryan_dollery/bin:/usr/local/go/bin" >> ~/.bash_profile && \
    echo "export PATH=$PATH:$GOROOT/bin" >> ~/.bash_profile && \
    echo "alias ll='ls -gAlFh'" >> ~/.bash_profile && \
    curl -sSL https://get.rvm.io | bash - && \
    . /etc/profile.d/rvm.sh && \
    /usr/local/rvm/bin/rvm install ruby --default && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" && \
    usermod -aG docker && \
    usermod -aG rvm

entrypoint ["/bin/bash"]


