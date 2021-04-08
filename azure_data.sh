#/bin/bash
sudo apt update -y
sudo apt install default-jdk -y
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
sudo apt-get install wget -y
sudo wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz -P /tmp
sudo tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.27 /opt/tomcat/latest
sudo chown -RH tomcat: /opt/tomcat/latest
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'