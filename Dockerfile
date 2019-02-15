from ubuntu:latest

run apt-get update && \
    apt-get install -y curl software-properties-common apt-transport-https && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    add-apt-repository ppa:openjdk-r/ppa && \
    add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && \
    mkdir -p /tmp && \
    export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    echo "tzdata tzdata/Areas select Europe" > /tmp/tzdata.txt && \
    echo "tzdata tzdata/Zones/Europe select London" >> /tmp/tzdata.txt && \
    debconf-set-selections /tmp/tzdata.txt && \
    curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y wget jq build-essential dirmngr openjdk-8-jdk maven iputils-ping net-tools nodejs python python-dev python-pip neovim php php-cli git gawk autoconf automake bison libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev netcat nmap vim tcpdump kubectl dnsutils groff unzip && \
    apt autoclean && \
    apt-get clean && \
    apt autoremove && \
    touch /root/.bash_aliases && \
    chmod a+rwx /root/.bash_aliases && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" && \
    echo ". /root/.bash_alises" >> .bash_profile && \
    echo "alias ll='ls -gAlFh'" >> /root/.bash_aliases.sh && \
    echo "alias tf='terraform'" >> /root/.bash_aliases.sh

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
    echo "export PATH=$PATH:$GOROOT/bin" >> ~/.bash_profile

run curl -sSL https://get.rvm.io | bash - && \
    . /etc/profile.d/rvm.sh && \
    /usr/local/rvm/bin/rvm install ruby --default

env JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre

run curl -sSL https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip -o /tmp/tf.zip && \
    cd /tmp && \
    unzip tf.zip && \
    mv terraform /usr/local/bin/ && \
    rm -rf /tmp/tf* && \
    curl -sSL https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_amd64.zip -o /tmp/packer.zip && \
    cd /tmp && \
    unzip packer.zip && \
    mv packer /usr/local/bin && \
    rm -rf /tmp/packer* && \
    curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash && \
    pip install --upgrade --no-cache-dir awscli --ignore-installed six && \
    aws --version && \
    pip install ansible

volume git
volume helm
volume kube
volume m2
volume aws
volume vault
volume ssh
volume bin

run echo "Complete"
