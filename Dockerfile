from ubuntu:latest

copy pom.xml /root

run apt-get update && \
    apt-get install -y apt-transport-https curl software-properties-common apt-utils locales tzdata && \
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
    apt-get update && \
    apt-cache policy docker-ce && \
    apt-get install -y wget lnav vim jq build-essential docker-ce openjdk-8-jdk maven python python-dev python-pip vim php php-cli git nodejs npm unzip && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" && \
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && \
    sh ~/.vim_runtime/install_awesome_vimrc.sh && \
    cd /root && \
    mvn dependency:resolve && \
    mvn clean && \
    npm install --global is-up-cli && \
    apt autoclean && \
    apt-get clean && \
    apt autoremove && \
    rm /root/pom.xml && \
    rm -rf /tmp/*

entrypoint ["/bin/bash"]
