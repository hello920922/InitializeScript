#Save current directory.
NOWDIR=$(pwd)

#Install hbase.
cd /usr/local
sudo mkdir data

sudo wget http://www.apache.org/dist/hbase/stable/hbase-1.0.1.1-bin.tar.gz
sudo tar xvfz hbase-1.0.1.1-bin.tar.gz
sudo rm hbase-1.0.1.1-bin.tar.gz
cd hbase-1.0.1.1

hbase_rootdir=${TMPDIR-'/usr/local/data'}/tsdhbase
iface=lo`uname | sed -n s/Darwin/0/p`

sudo cp $NOWDIR/hbase-site.xml conf/hbase-site.xml 

./bin/start-hbase.sh

#Install GnuPlot.
cd /usr/local
sudo apt-get install gcc
sudo apt-get install libgd2-xpm-dev
sudo  wget http://sourceforge.net/projects/gnuplot/files/gnuplot/4.6.3/gnuplot-4.6.3.tar.gz
sudo tar zxvf gnuplot-4.6.3.tar.gz
sudo rm gnuplot-4.6.3.tar.gz
cd gnuplot-4.6.3
sudo ./configure
sudo make install
sudo apt-get install gnuplot
sudo apt-get install dh-autoreconf

#Install openTSDB.
cd /usr/local
sudo git clone git://github.com/OpenTSDB/opentsdb.git

cd opentsdb
sudo ./build.sh
