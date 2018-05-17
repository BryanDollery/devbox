from ubuntu:latest

run apt-get update && \
    apt-get install -y curl software-properties-common && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    add-apt-repository ppa:openjdk-r/ppa && \
    add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-cache policy docker-ce && \
    apt-get install -y wget jq build-essential docker-ce openjdk-8-jdk python python-dev python-pip neovim php php-cli python-software-properties git nodejs && \
    curl -O https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz && \
    tar -xvf go1.9.1.linux-amd64.tar.gz && \
    mv go /usr/local && \
    echo "export PATH=$PATH:/usr/local/go/bin" >> .bash_profile && \
    echo "export GOROOT=$HOME/go" >> .bash_profile && \
    echo "export PATH=$PATH:$GOROOT/bin" >> .bash_profile && \
    curl -sSL https://get.rvm.io | bash - && \
    . /etc/profile.d/rvm.sh && \
    /usr/local/rvm/bin/rvm install ruby --default && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" && \
    apt autoclean && \
    apt-get clean && \
    apt autoremove
run mv /.bash_profile ~
run echo "export PATH=$PATH:/home/bryan_dollery/bin:/usr/local/go/bin" >> ~/.bash_profile
run echo ". ~/.bash_profile" >> ~/.bashrc
entrypoint ["/bin/bash"]


