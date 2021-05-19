# BugBounty Kali Setup Script
#
# Tools:
#	- amass
#   - subfinder (https://github.com/projectdiscovery/subfinder)
#	- dnsx
# 	- httpx
#	- nuclei
#	- jaeles
#   - dirsearch

echo "[INFO] Updating..."
apt-get update >/dev/null 2>&1 && 
mkdir /opt/subdomain &&
cd /opt/subdomain &&

# amass install
echo "[INFO] Installing Amass..."
apt-get install amass -y >/dev/null 2>&1 &&

# subfinder install
echo "[INFO] Installing Subfinder..."
apt-get install subfinder -y >/dev/null 2>&1 &&

# commonpeak2
echo "[INFO] Downloading Commonpeak2"
git clone https://github.com/assetnote/commonspeak2-wordlists.git >/dev/null 2>&1 &&

# dnsx install
echo "[INFO] Installing dnsx..."
wget https://github.com/projectdiscovery/dnsx/releases/download/v1.0.3/dnsx_1.0.3_linux_amd64.tar.gz >/dev/null 2>&1 &&
gunzip dnsx_1.0.3_linux_amd64.tar.gz >/dev/null 2>&1 &&
tar -xvf dnsx_1.0.3_linux_amd64.tar >/dev/null 2>&1 &&
rm *.md && rm dnsx_1.0.3_linux_amd64.tar &&

# httpx install
echo "[INFO] Installing httpx..."
wget https://github.com/projectdiscovery/httpx/releases/download/v1.0.5/httpx_1.0.5_linux_amd64.tar.gz >/dev/null 2>&1 &&
gunzip httpx_1.0.5_linux_amd64.tar.gz >/dev/null 2>&1 &&
tar -xvf httpx_1.0.5_linux_amd64.tar >/dev/null 2>&1 &&
rm *.md && rm httpx_1.0.5_linux_amd64.tar &&

# nuclei install
echo "[INFO] Installing nuclei..."
wget https://github.com/projectdiscovery/nuclei/releases/download/v2.3.5/nuclei_2.3.5_linux_amd64.tar.gz >/dev/null 2>&1 &&
gunzip nuclei_2.3.5_linux_amd64.tar.gz >/dev/null 2>&1 &&
tar -xvf nuclei_2.3.5_linux_amd64.tar >/dev/null 2>&1 &&
rm nuclei_2.3.5_linux_amd64.tar &&
/opt/subdomain/nuclei -update-templates >/dev/null 2>&1 &&

# jaeles install
echo "[INFO] Installing jaeles..."
wget https://github.com/jaeles-project/jaeles/releases/download/beta-v0.16/jaeles-v0.16-linux-amd64.zip >/dev/null 2>&1 &&
unzip jaeles-v0.16-linux-amd64.zip >/dev/null 2>&1 &&
rm jaeles-v0.16-linux-amd64.zip &&
mv jaeles-v0.16-linux-amd64 jaeles &&
/opt/subdomain/jaeles config init &&

cd /opt &&

# dirsearch install
echo "[INFO] Installing Dirsearch..."
git clone https://github.com/maurosoria/dirsearch >/dev/null 2>&1 &&

# SecList install
#echo "[INFO] Installing SecList..."
#git clone https://github.com/danielmiessler/SecLists.git >/dev/null 2>&1 &&

echo "[INFO] Kali is Ready for Hunting!"

