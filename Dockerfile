FROM ubuntu:22.04

WORKDIR /opt

RUN apt-get -y update && apt-get -y install git openjdk-17-jdk curl wget ripgrep clang-format vim htop clang clangd gdb unzip && \
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
    wget https://github.com/microsoft/vscode-cpptools/releases/download/v1.17.5/cpptools-linux.vsix && \
    unzip cpptools-linux.vsix -d cpptools-linux && \
    chmod u+x /opt/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7 && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_0.40.2_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && install lazygit /usr/local/bin && rm /opt/lazygit && \
    cd java-debug && mvn clean install -DskipTests && \
    rm /opt/*.tar.gz /opt/*.vsix && \
    mkdir -p /root/.config/lazygit && \
    echo "disableStartupPopups: true" > /root/.config/lazygit/config.yml && \
    mkdir /opt/lua-lsp && \
    wget https://github.com/LuaLS/lua-language-server/releases/download/3.7.0/lua-language-server-3.7.0-linux-x64.tar.gz && \
    tar -C /opt/lua-lsp -xzvf lua-language-server-3.7.0-linux-x64.tar.gz

COPY nvim /root/.config/nvim

# USER environment variable is needed for dap.utils pick_process()
ENV USER root

RUN /opt/nvim-linux64/bin/nvim --headless "+Lazy! sync" +qa

WORKDIR /data

ENTRYPOINT /opt/nvim-linux64/bin/nvim
