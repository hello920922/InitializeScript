sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install vim -y
sudo apt-get install apache2 -y
sudo apt-get install mysql-server mysql-client -y
sudo apt-get install php5 php5-common -y
sudo apt-get install libapache2-mod-php5 -y
sudo apt-get install php5-mysql -y

sudo /etc/init.d/apache2 restart
sudo /etc/init.d/mysql restart

sudo echo -e "<?\nphpinfo();\n?>" >> ./phpinfo.php
sudo mv phpinfo.php /var/www/phpinfo.php
sudo cp ./bashrc ~/.bashrc
sudo cp ./bashrc /root/.bashrc
sudo cp ./vimrc ~/.vimrc
sudo cp ./vimrc /root/.vimrc
source ~/.bashrc
