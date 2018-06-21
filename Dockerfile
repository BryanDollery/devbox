from phusion/baseimage

copy aws.tf /work/

env TERRAFORM_VER 0.11.7
env TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip
env TF_PLUGIN_CACHE_DIR "/root/.terraform.d/plugin-cache"
env DEBIAN_FRONTEND noninteractive
env TERM linux
env JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
env TOMCAT apache-tomcat-8.5.31
env CATALINA_HOME /usr/local/tomcat
env CATALINA_BASE /usr/local/tomcat
env CATALINA_TMPDIR /usr/local/tomcat/temp
env PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/tomcat/bin:/root/sso/adm/bin

run apt-get update && \
    apt-get install -y apt-transport-https curl software-properties-common apt-utils locales tzdata && \
    echo "tzdata tzdata/Areas select Europe" > timezone.txt && \
    echo "tzdata tzdata/Zones/Europe select London" >> timezone.txt && \
    debconf-set-selections timezone.txt && \
    rm /etc/timezone && \
    rm /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) test" && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-cache policy docker-ce && \
    apt-get install -y bash bash-completion wget lnav ldap-utils vim jq build-essential openssl openssh-client docker-ce openjdk-8-jdk maven python python-dev python-pip vim php php-cli git awscli s3cmd nodejs unzip && \
    npm install --global is-up-cli json-log-viewer json-viewer && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} && \
    unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin && \
    rm /tmp/${TERRAFORM_ZIP} && \
    cd /work && \
    terraform init && \
    terraform get && \
    cd /root && \
    rm -rf /work && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" && \
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && \
    sh ~/.vim_runtime/install_awesome_vimrc.sh && \
    cd /tmp && \
    wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.zip && \
    unzip apache-tomcat* && \
    mkdir -p /usr/local/tomcat && \
    mv $TOMCAT/* /usr/local/tomcat/ && \
    mv /usr/local/tomcat/webapps/ROOT /tmp && \
    rm -rf /usr/local/tomcat/webapps/* && \
    mv /tmp/ROOT /usr/local/tomcat/webapps/ && \
    update-java-alternatives --set java-1.8.0-openjdk-amd64 && \
    git clone https://github.com/BryanDollery/openam-plus.git && \
    cd openam-plus && \
    mkdir -p /root/sso/adm /root/sso/config && \
    unzip AM-SSOAdmin* -d /root/sso/adm && \
    unzip AM-SSOConfig* -d /root/sso/config && \
    cd /root && \
    apt autoclean && \
    apt-get clean && \
    apt autoremove && \
    rm -rf /tmp/*

run chmod a+x $CATALINA_HOME/bin/*.sh
entrypoint ["/bin/bash"]
