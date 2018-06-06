from ubuntu:latest

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
    apt-get install -y wget vim jq build-essential docker-ce openjdk-8-jdk maven python python-dev python-pip vim php php-cli git nodejs && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" && \
    apt autoclean && \
    apt-get clean && \
    apt autoremove

copy pom.xml /root
run cd /root && mvn dependency:resolve && mvn clean && rm /root/pom.xml

entrypoint ["/bin/bash"]

