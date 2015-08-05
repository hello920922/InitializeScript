NOWDIR=$(pwd)

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
sudo cp /etc/profile $NOWDIR/profile
sudo chmod 777 $NOWDIR/profile
cat $NOWDIR/profile.add >> $NOWDIR/profile
sudo chmod 644 $NOWDIR/profile
sudo mv $NOWDIR/profile /etc/profile
source /etc/profile
source ~/.bashrc

git clone git://git.drogon.net/wiringPi
mv ./wiringPi ~/wiringPi
cd /home/pi/wiringPi
./build

cd /home/pi/
wget http://get.pi4j.com/download/pi4j-1.0.deb
sudo dpkg -i pi4j-1.0.deb
sudo cp /opt/pi4j/lib/* $JAVA_HOME/lib/java/
