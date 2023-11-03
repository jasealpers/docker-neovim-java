FROM ubuntu:22.04

WORKDIR /opt

RUN apt-get -y update && apt-get -y install git openjdk-17-jdk curl wget ripgrep clang-format vim htop && \
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
    tar -xzvf nvim-linux64.tar.gz && \
    wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz && \
    tar -xzvf apache-maven-3.9.5-bin.tar.gz && \
    update-alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.9.5/bin/mvn 120 && \
    update-alternatives --set mvn /opt/apache-maven-3.9.5/bin/mvn && \
    wget https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.29.0/jdt-language-server-1.29.0-202310261436.tar.gz -O jdt-language-server-1.29.0.tar.gz && \
    mkdir jdtls && tar -xzvf jdt-language-server-1.29.0.tar.gz -C jdtls && \
    git clone https://github.com/microsoft/java-debug.git && \
    wget https://projectlombok.org/downloads/lombok.jar && \
    cd java-debug && mvn clean install -DskipTests && \
    rm /opt/*.tar.gz && \
    mkdir /root/.config

COPY nvim /root/.config/nvim

RUN /opt/nvim-linux64/bin/nvim --headless "+Lazy! sync" +qa

WORKDIR /data

ENTRYPOINT /opt/nvim-linux64/bin/nvim
