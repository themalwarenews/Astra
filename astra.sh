#!/bin/bash

# Function to install required packages if missing
install_required_packages() {
    local required_packages=("wget" "unzip" "figlet")
    local missing_packages=()

    for package in "${required_packages[@]}"; do
        if ! command -v "$package" &>/dev/null; then
            missing_packages+=("$package")
        fi
    done

    if [ ${#missing_packages[@]} -gt 0 ]; then
        echo "Installing required packages: ${missing_packages[*]}"
        if command -v apt-get &>/dev/null; then
            sudo apt-get update
            sudo apt-get install -qq -y "${missing_packages[@]}" >/dev/null
        elif command -v yum &>/dev/null; then
            sudo yum install -y "${missing_packages[@]}"
        else
            echo "Error: Package manager not found. Please install '${missing_packages[*]}' manually and run the script again."
            exit 1
        fi
    fi
}

install_naabu(){

    echo "-------------------------------------------------------"
    echo "Installing naabu..."
    # Step 4: Download the naabu release
    naabu_version="2.1.6"
    naabu_download_url="https://github.com/projectdiscovery/naabu/releases/download/v${naabu_version}/naabu_${naabu_version}_linux_amd64.zip"

    # Download naabu zip file with progress bar
    echo "Downloading naabu..."
    wget --quiet "$naabu_download_url" -O "naabu_${naabu_version}_linux_amd64.zip" 2>&1 

    # Step 5: Unzip the downloaded file with progress bar
    echo "Extracting naabu..."
    unzip "naabu_${naabu_version}_linux_amd64.zip" 

    # Step 6: Move the binary file to "/usr/local/bin" using sudo
    echo "Moving naabu binary to /usr/local/bin..."
    sudo mv naabu /usr/local/bin/

    # Step 7: Run the binary and check the version
    echo "Checking naabu version..."
    naabu --version

    # Clean up: Remove the downloaded zip file
    rm "naabu_${naabu_version}_linux_amd64.zip"

    echo "naabu has been installed and is ready for use."

    rm -rf *
    echo "-------------------------------------------------------"
}

install_nuclei() {
     echo "-------------------------------------------------------"
    echo "Installing nuclei..."
    local nuclei_version="2.9.10"
    local nuclei_download_url="https://github.com/projectdiscovery/nuclei/releases/download/v${nuclei_version}/nuclei_${nuclei_version}_linux_amd64.zip"

    echo "Downloading nuclei..."
    wget --quiet "$nuclei_download_url" -O "nuclei_${nuclei_version}_linux_amd64.zip" 2>&1

    echo "Extracting nuclei..."
    unzip "nuclei_${nuclei_version}_linux_amd64.zip"

    echo "Moving nuclei binary to /usr/local/bin..."
    sudo mv nuclei /usr/local/bin/

    echo "Checking nuclei version..."
    nuclei --version

    rm "nuclei_${nuclei_version}_linux_amd64.zip"

    echo "nuclei has been installed and is ready for use."

    rm -rf *
     echo "-------------------------------------------------------"
}

install_httpx() {
     echo "-------------------------------------------------------"
    echo "Installing httpx..."
    local httpx_version="1.3.4"
    local httpx_download_url="https://github.com/projectdiscovery/httpx/releases/download/v${httpx_version}/httpx_${httpx_version}_linux_amd64.zip"

    echo "Downloading httpx..."
    wget --quiet "$httpx_download_url" -O "httpx_${httpx_version}_linux_amd64.zip" 2>&1

    echo "Extracting httpx..."
    unzip "httpx_${httpx_version}_linux_amd64.zip"

    echo "Moving httpx binary to /usr/local/bin..."
    sudo mv httpx /usr/local/bin/

    echo "Checking httpx version..."
    httpx version

    rm "httpx_${httpx_version}_linux_amd64.zip"

    echo "httpx has been installed and is ready for use."

    rm -rf *
     echo "-------------------------------------------------------"
}

install_subfinder() {
     echo "-------------------------------------------------------"
    echo "Installing subfinder..."
    local subfinder_version="2.6.1"
    local subfinder_download_url="https://github.com/projectdiscovery/subfinder/releases/download/v${subfinder_version}/subfinder_${subfinder_version}_linux_amd64.zip"

    echo "Downloading subfinder..."
    wget --quiet "$subfinder_download_url" -O "subfinder_${subfinder_version}_linux_amd64.zip" 2>&1

    echo "Extracting subfinder..."
    unzip "subfinder_${subfinder_version}_linux_amd64.zip"

    echo "Moving subfinder binary to /usr/local/bin..."
    sudo mv subfinder /usr/local/bin/

    echo "Checking subfinder version..."
    subfinder version

    rm "subfinder_${subfinder_version}_linux_amd64.zip"

    echo "subfinder has been installed and is ready for use."

    rm -rf *
     echo "-------------------------------------------------------"
}

install_katana() {
     echo "-------------------------------------------------------"
    echo "Installing katana..."
    local katana_version="1.0.2"
    local katana_download_url="https://github.com/projectdiscovery/katana/releases/download/v${katana_version}/katana_${katana_version}_linux_amd64.zip"

    echo "Downloading katana..."
    wget --quiet "$katana_download_url" -O "katana_${katana_version}_linux_amd64.zip" 2>&1

    echo "Extracting katana..."
    unzip "katana_${katana_version}_linux_amd64.zip"

    echo "Moving katana binary to /usr/local/bin..."
    sudo mv katana /usr/local/bin/

    echo "Checking katana version..."
    katana version

    rm "katana_${katana_version}_linux_amd64.zip"

    echo "katana has been installed and is ready for use."

    rm -rf *
     echo "-------------------------------------------------------"
}

install_uncover() {
     echo "-------------------------------------------------------"
    echo "Installing uncover..."
    local uncover_version="1.0.5"
    local uncover_download_url="https://github.com/projectdiscovery/uncover/releases/download/v${uncover_version}/uncover_${uncover_version}_linux_amd64.zip"

    echo "Downloading uncover..."
    wget --quiet "$uncover_download_url" -O "uncover_${uncover_version}_linux_amd64.zip" 2>&1

    echo "Extracting uncover..."
    unzip "uncover_${uncover_version}_linux_amd64.zip"

    echo "Moving uncover binary to /usr/local/bin..."
    sudo mv uncover /usr/local/bin/

    echo "Checking uncover version..."
    uncover version

    rm "uncover_${uncover_version}_linux_amd64.zip"

    echo "uncover has been installed and is ready for use."

    rm -rf *
     echo "-------------------------------------------------------"
}

 

 # Step 1: Install required packages
install_required_packages

figlet -f slant "ASTRA"

# Step 2: Create a directory named 'all_tools'
mkdir -p all_tools

# Step 3: Change directory to 'all_tools'
cd all_tools || exit

# installing naabu
install_naabu

# installing nuclei
install_nuclei

# installing Subfinder
install_subfinder

# installing katana
install_katana

# installing httpx
install_httpx

# installing uncover
install_uncover
