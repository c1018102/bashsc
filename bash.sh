#!/bin/sh

echo "Enter LAMP for LAMP install to start"
read lampcode
if [ $lampcode="LAMP" ]
then
  echo "LAMP install initiated"
else
  echo "Unknown - please try again"
fi

for i in {5..1}
do
   echo "LAMP install loading: $i "
   sleep 1
done

#LAMP INSTALL
sudo apt update
sudo apt upgrade -y
sudo apt install apache2 -y
sudo systemctl status apache2
sudo apt install mariadb-server mariadb-client -y
sudo systemctl status mariadb
sudo mysql_secure_installation
sudo apt install php php-mysql php-xml php-mbstring libapache2-mod-php -y

date >> LAMPINSTALL.txt
echo "LAMP install completed and up to date" >> LAMPINSTALL.txt
echo "" >> LAMPINSTALL.txt

echo ""
echo "LAMPINSTALL Logged"


#Application Check
echo ""
echo "Application Install Checker"
echo "1 - Apache2"
echo "2 - Nginx"
echo "3 - PHP"
echo "4 - MariaDB"
read app;
case $app in
  1) echo "Apache2 is installed!";;
  2) echo "Ngnix is not installed!";;
  3) echo "PHP is installed!";;
  4) echo "MariaDB is installed!";;
  *) echo "Unknown Application!";; 
esac

echo ""
echo "Enter an installed application"
read First_string
echo -e "First application - \n ${First_string}"

echo "Enter a second installed application"
read Second_string
echo -e "Second application - \n ${Second_string}"

application_string="$First_string$Second_string"

echo -e "\n ${application_string} are working together!"
echo -e "\n"


