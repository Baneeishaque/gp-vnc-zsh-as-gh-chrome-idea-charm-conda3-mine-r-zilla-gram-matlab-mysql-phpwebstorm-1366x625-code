FROM baneeishaque/gp-vnc-zsh-as-gh-chrome-idea-charm-conda3-scrcpy-r-zilla-gram-matlab-mysql-phpwebstorm-1366x625-code

ARG rubyMineDownloadUrl="https://download.jetbrains.com/ruby/RubyMine-2021.1.2.tar.gz"
ARG rubyMineInstallationFile="RubyMine-2021.1.2.tar.gz"

WORKDIR $HOME
RUN sudo wget $rubyMineDownloadUrl \
 && sudo tar -xvf $rubyMineInstallationFile -C /usr/local/ \
 && sudo rm $rubyMineInstallationFile

RUN sudo mkdir -p ~/.config/JetBrains/RubyMine2021.1 \
 && sudo cp /usr/local/RubyMine-2021.1.2/bin/rubymine64.vmoptions ~/.config/JetBrains/RubyMine2021.1/ \
 && echo "-Dsun.java2d.xrender=false" | sudo tee -a ~/.config/JetBrains/RubyMine2021.1/rubymine64.vmoptions

RUN wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add - \
 && echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list \
 && sudo apt update \
 && sudo apt install -y \
     anydesk tilda \
 && sudo rm -rf /var/lib/apt/lists/*
