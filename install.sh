#define color names
green="\033[32m"
red="\033[31m"
yellow="\033[33m"
reset="\033[0m"

#install wget, sudo and git
echo -e "${yellow}Die benötigten Pakete werden installiert...${reset}"
apt install wget sudo git -y > /dev/null 2>&1 &
wait
echo "${green}Die Pakete wurden erfolgreich installiert.${reset}"

#install ssh puplic key for HCK-NET
echo -e "${yellow}Der Download des Puplic-Keys startet...${reset}"
wget -q https://raw.githubusercontent.com/xzLxkas/pupssh/main/authorized_keys &
apt install openssh-server -y > /dev/null 2>&1 &
wait
echo "${green}Der Download wurde erfolgreich abgeschlossen.${reset}"

#download update script
echo -e "${yellow}Der Download des Update Skripts startet...${reset}"
wget -q https://raw.githubusercontent.com/xzLxkas/update.sh--apt/main/update.sh &
wait
echo "${green}Der Download wurde erfolgreich abgeschlossen.${reset}"
echo "run update.sh"
chmod +x update.sh
./update.sh

#install firewall; allow 80 443 22
echo -e "${yellow}Die Firewall wird Herruntergeladen und konfiguriert...${reset}"
apt install ufw -y > /dev/null 2>&1 &
ufw enable
ufw allow 22
ufw allow 80
ufw allow 443
wait
echo -e "${green}Die konfiguration war erfolgreich.${reset}"

#restart
echo -e "${red}Der Server wird nun neugestartet und das Skript wird entfernt.${reset}"
rm install.sh
reboot
