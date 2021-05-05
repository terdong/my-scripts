#!/bin/bash
wget -P /home/gehem/downloads/ http://www.scala-lang.org/files/archive/scala-2.10.3.tgz

tar xvzf /home/gehem/downloads/scala-2.10.3.tgz

sudo mv scala-2.10.3 /archive/.conf/

sudo ln -s /archive/.conf/scala-2.10.3 /usr/local/scala 

SCALA_HOME="/usr/local/scala"

BIN_HOME="/usr/bin"

echo "INSTALL SCALA!"

sudo ln -s $SCALA_HOME/bin/scala $BIN_HOME/scala
sudo ln -s $SCALA_HOME/bin/scalac $BIN_HOME/scalac
sudo ln -s $SCALA_HOME/bin/fsc $BIN_HOME/fsc
sudo ln -s $SCALA_HOME/bin/sbaz $BIN_HOME/sbaz
sudo ln -s $SCALA_HOME/bin/sbaz-setup $BIN_HOME/sbaz-setup
sudo ln -s $SCALA_HOME/bin/scaladoc $BIN_HOME/scaladoc
sudo ln -s $SCALA_HOME/bin/scalap $BIN_HOME/scalap

echo "INSTALL COMPLET!"
