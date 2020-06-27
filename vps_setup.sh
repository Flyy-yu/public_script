#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y vim
sudo apt-get install -y openssh-server
sudo apt-get install -y hydra
sudo apt-get install -y binwalk
sudo apt-get install -y git
sudo apt-get install -y radare2
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk
sudo apt-get install -y npm
sudo apt-get install -y curl
sudo apt-get install -y python-dnspython
sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y unzip
sudo apt-get install -y nmap
pip install --upgrade pip
pip3 install --upgrade pip
pip3 install colored
sudo apt install -y awscli
sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install -y ruby2.5 ruby2.5-dev
sudo gem install wpscan
sudo apt-get install -y libcurl4-openssl-dev

#install go
if [[ -z "$GOPATH" ]];then
     echo "Installing Golang"
     wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
     sudo tar -xvf go1.13.4.linux-amd64.tar.gz
     sudo rm -r /usr/local/go
     sudo mv go /usr/local 
     export GOROOT=/usr/local/go
     export GOPATH=$HOME/go
     export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
     echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
     echo 'export GOPATH=$HOME/go'    >> ~/.bashrc            
     echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc    
     chmod a+x ~/.bashrc
     source ~/.bashrc
     sleep 1

fi

mkdir tools
cd ~/tools/

git clone https://github.com/blechschmidt/massdns.git
cd massdns
make

cd ~/tools/
git clone https://github.com/s0md3v/Arjun
wget https://raw.githubusercontent.com/gwen001/github-search/master/github-subdomains.py

git clone https://github.com/nahamsec/recon_profile.git

echo "Installing amass"
sudo apt update sudo apt install snapd
sudo snap install amass
echo "Installing subfinder"
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.0/subfinder-linux-amd64.tar
tar -xzvf subfinder-linux-amd64.tar
sudo mv subfinder-linux-amd64 /usr/bin/subfinder
echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip3 install -r requirements.txt
cd ~/tools/
echo "done"

echo "Installing LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
python setup.py install
cd ..
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"

#For specific platform
echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/

cd ~
echo "Installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git

echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/

git clone https://github.com/guelfoweb/knock.git
git clone https://github.com/nahamsec/lazyrecon.git

cd ~
mkdir wordlist
cd wordlist
git clone https://github.com/danielmiessler/RobotsDisallowed.git
wget https://github.com/danielmiessler/SecLists/blob/master/Discovery/DNS/dns-Jhaddix.txt

cd ~
git clone https://github.com/Flyy-yu/reeecon

echo "ffuf"
go get github.com/ffuf/ffuf

echo "Installing gobuster"
go get github.com/OJ/gobuster

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 

#secretz is a tool that minimizes the large attack surface of Travis CI. It automatically fetches repos, builds.
go get -u github.com/lc/secretz

#aquatone
cd ~/tools/
mkdir aquatone
cd aquatone
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip
sudo mv aquatone /bin/

sudo apt install -y chromium-browser

sudo apt -y autoremove

mkdir ~/recon_result
