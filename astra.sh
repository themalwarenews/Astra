#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'

# Reset color to default
reset='\033[0m'

check_requirements(){
        # Check if Figlet is installed
    if ! command -v figlet &> /dev/null
    then
        # Install Figlet package
        echo -e "${green}Installaing figlet. Please wait....${reset}"
        sudo apt update -qq
        sudo apt install -yqq figlet > /dev/null 2>&1
    else
        figlet -f slant "ASTRA"
    fi


    # Set the required version number
    REQUIRED_VERSION="1.19.2"

    # Get the current Go version
    CURRENT_VERSION=$(go version | awk '{print $3}')

    # Compare the versions
    if [ "$CURRENT_VERSION" != "go$REQUIRED_VERSION" ]; then
        echo "Your Go version is $CURRENT_VERSION, but $REQUIRED_VERSION is required."
        echo "Please upgrade to $REQUIRED_VERSION or later."
        exit 1
    fi

    #check whther script is running as root./
    if [[ $EUID -ne 0 ]]; then
     echo "This script must be run as root."
     exit 1
    fi


    if ! command -v git &> /dev/null
    then
        echo -e "${green}Installaing Git. Please wait....${reset}"
        sudo apt-get update -qq
        sudo apt-get install -yqq git > /dev/null 2>&1
    fi
}

install_nuclei() {

 cd "$current_dir"
echo -e "${green}  [+] cloning Nuclei repo... "
  # Cloning Nuclei repository in silent mode
  git clone -q https://github.com/projectdiscovery/nuclei.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
  # Navigating to the nuclei command directory
  cd nuclei/v2/cmd/nuclei
echo -e "${green}  [+] lets build Nuclei binary...."
  # Building nuclei from source code in silent mode
  sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
  # Moving the nuclei executable to /usr/local/bin directory in silent mode
  sudo mv nuclei /usr/local/bin/
echo -e "${green}  [+] checking the Version of Nuclei installed ${reset} "
  # Displaying the nuclei version
  nuclei -version
}

install_subfinder()
{
    cd "$current_dir"
echo -e "${green}  [+] cloning Subfinder repo... "
    # Cloning repo
    git clone -q https://github.com/projectdiscovery/subfinder.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd subfinder/v2/cmd/subfinder
echo -e "${green}  [+] lets build Subfinder binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv subfinder /usr/local/bin
echo -e "${green}  [+] checking the Version of subfinder installed ${reset} "
    # Displaying the subfinder version
    subfinder -version
}


install_naabu(){
    cd "$current_dir"
echo -e "${green}  [+] cloning naabu repo... "
    # Cloning repo  
    git clone -q https://github.com/projectdiscovery/naabu.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd naabu/v2/cmd/naabu
echo -e "${green}  [+] lets build naabu binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv naabu /usr/local/bin
echo -e "${green}  [+] checking the Version of naabu installed ${reset} "
     # Displaying the naabu version
    naabu -version
}

install_katana(){

    cd "$current_dir"
echo -e "${green}  [+] cloning katana github repo... "
    # Cloning repo  
    git clone -q https://github.com/projectdiscovery/katana.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd katana/cmd/katana
echo -e "${green}  [+] lets build Katana binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv katana /usr/local/bin
echo -e "${green}  [+] checking the Version of katana installed ${reset} "  
     # Displaying the katana version
    katana -version
}

install_httpx(){

    cd "$current_dir"
echo -e "${green}  [+] cloning httpx github repo... "
    # Cloning repo  
    git clone -q https://github.com/projectdiscovery/httpx.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd httpx/cmd/httpx
echo -e "${green}  [+] lets build httpx binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv httpx /usr/local/bin
echo -e "${green}  [+] checking the Version of httpx installed ${reset} "
     # Displaying the httpx version
    httpx -version
}

install_tlsx(){

    cd "$current_dir"
echo -e "${green}  [+] cloning tlsx github repo... "
    # Cloning repo  
    git clone -q https://github.com/projectdiscovery/tlsx.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd tlsx/cmd/tlsx
echo -e "${green}  [+] lets build httpx binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv tlsx /usr/local/bin
echo -e "${green}  [+] checking the Version of httpx installed ${reset} "
     # Displaying the httpx version
    tlsx -version
}

install_interactsh(){

    cd "$current_dir"
echo -e "${green}  [+] cloning interactsh github repo... "
    # Cloning repo  
    git clone -q https://github.com/projectdiscovery/interactsh.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd interactsh/cmd/interactsh-client
echo -e "${green}  [+] lets interactsh-client Proxify binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e "${green}  [+] checking the Version of interacsh-client installed ${reset} "
    # Moving binary to /usr/local/bin 
    sudo mv interactsh-client /usr/local/bin
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    cd ../interactsh-server
echo -e "${green}  [+] lets build interactsh-server binary...."
    # Building binary
    go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv interactsh-server /usr/local/bin
echo -e "${green}  [+] checking the Version of interacsh-server installed ${reset} "
     # Displaying the interacsh version
    interactsh-server -version

}

install_proxify(){

    cd "$current_dir"
echo -e "${green}  [+] cloning Proxify github repo... "
    # Cloning repo  
    git clone -q https://github.com/projectdiscovery/proxify.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd proxify/cmd/proxify
echo -e "${green}  [+] lets build Proxify binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv proxify /usr/local/bin
echo -e "${green}  [+] checking the Version of Proxify installed ${reset} "
     # Displaying the proxify version
    proxify -version
}

install_uncover(){

    cd "$current_dir"
echo -e "${green}  [+] cloning uncover github repo... "
    # Cloning repo  
    git clone -q https://github.com/projectdiscovery/uncover.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd uncover/cmd/uncover
echo -e "${green}  [+] lets build Proxify binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv uncover /usr/local/bin
echo -e "${green}  [+] checking the Version of uncover installed ${reset} "
     # Displaying the uncover version
    uncover -version
}

install_asnmap(){

    cd "$current_dir"
echo -e "${green}  [+] cloning asnmap github repo... "
    # Cloning repo  
    git clone -q https://github.com/projectdiscovery/asnmap.git
echo -e "${green}  [+] Git cloned, lets move to main.go directory..."
    # Navigate to cloned repo
    cd asnmap/cmd/asnmap
echo -e "${green}  [+] lets build Proxify binary...."
    # Building binary
    sudo go build > /dev/null 2>&1
echo -e " ${green} [+] Binary built, moving it to the /usr/local/bin/..."
    # Moving binary to /usr/local/bin 
    sudo mv asnmap /usr/local/bin
echo -e "${green}  [+] checking the Version of asnmap installed ${reset} "
     # Displaying the uncover version
    asnmap -version

}

check_requirements

mkdir astra-tools
cd astra-tools
current_dir=$(pwd)
echo -e "${cyan} \n Which tool do you want to install? \n${reset} "
echo -e "${blue} 1. Nuclei : Fast and customizable vulnerability scanner based on simple YAML based DSL \n"
echo -e  "${blue} 2. Subfinder : Fast passive subdomain enumeration tool. \n"
echo -e  "${blue} 3. naabu : A fast port scanner written in go with a focus on reliability and simplicity. Designed to be used in combination with other tools for attack surface discovery in bug bounties and pentests \n"
echo -e  "${blue} 4. katana : A next-generation crawling and spidering framework. \n"
echo -e  "${blue} 5. httpx : httpx is a fast and multi-purpose HTTP toolkit that allows running multiple probes using the retryablehttp library. \n"
echo -e  "${blue} 6. interactsh : An OOB interaction gathering server and client library \n"
echo -e  "${blue} 7. proxify : Swiss Army knife Proxy tool for HTTP/HTTPS traffic capture, manipulation, and replay on the go. \n"
echo -e  "${blue} 8. uncover : Quickly discover exposed hosts on the internet using multiple search engines. \n"
echo -e  "${blue} 9. asnmap : Go CLI and Library for quickly mapping organization network ranges using ASN information. \n ${reset}"
echo -e  "${blue} 10. tlsx : A fast and configurable TLS grabber focused on TLS based data collection and analysis. \n ${reset}"
echo -e  "${red} 0. All the  tools listed \n${reset} "

read -p "Enter your choice: " choice


case $choice in
    1)
        echo "Installing Nuclei...."
        install_nuclei
        ;;
    2)
        echo "Installing Subfinder...."
        install_subfinder
        ;;
    3)
        echo "Installing Naabu...."
        install_naabu
        ;;
    4)
        echo "Installing katana...."
        install_katana
        ;;
    5)
        echo "Installing httpx...."
        install_httpx
        ;;
    6)
        echo "Installing interactsh...."
        install_interactsh
        ;;
    7)
        echo "Installing proxify...."
        install_proxify
        ;;
    8)
        echo "Installing Uncover...."
        install_uncover
        ;;
    9)
        echo "Installing Asnmap...."
        install_asnmap
        ;;
    10)
        echo "Installing tlsx...."
        install_tlsx
        ;;
    0)
        echo "Installing ALL Tools...."
        install_nuclei
        install_subfinder
        install_naabu
        install_katana
        install_httpx
        install_interactsh
        install_proxify
        install_uncover
        install_asnmap
        install_tlsx
        ;;
    *)
        echo "Invalid choice. Exiting..."
        ;;
esac
