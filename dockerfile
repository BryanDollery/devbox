from ubuntu:latest

run apt-get update && \
    apt-get install -y curl software-properties-common apt-utils locales tzdata && \
    echo "tzdata tzdata/Areas select Europe" > timezone.txt \
    echo "tzdata tzdata/Zones/Europe select London" >> timezone.txt \
    debconf-set-selections timezone.txt \
    rm /etc/timezone \
    rm /etc/localtime \
    dpkg-reconfigure -f noninteractive tzdata \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) test" && \
    add-apt-repository ppa:openjdk-r/ppa && \
    add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-cache policy docker-ce && \
    apt-get install -y wget jq build-essential docker-ce openjdk-8-jdk maven python python-dev python-pip vim php php-cli git nodejs && \
    curl -O https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" && \
    apt autoclean && \
    apt-get clean && \
    apt autoremove
run mv /.bash_profile ~
run echo "export PATH=$PATH:/home/bryan_dollery/bin:/usr/local/go/bin" >> ~/.bash_profile
run echo ". ~/.bash_profile" >> ~/.bashrc
entrypoint ["/bin/bash"]


