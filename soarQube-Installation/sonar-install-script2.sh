#!/bin/bash
# Author: Landmark Technology
# CentOs or REHEL 7/8

#As a good security practice, SonarQuber Server is not advised to run sonar service as a root user, 
#so create a new user called sonar and grant sudo access to manage sonar services as follows
# 1. create a sonar 
# 2. Grand sudo access to sonar user
## 3. Enable PasswordAuthentication
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart

# 4. Install JAVA pre-requisite
cd /opt
sudo yum -y install unzip wget git
sudo yum install  java-11-openjdk-devel
# 5. Download the SonarqQube Server software. 
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube

# start sonarqube as sonar user using relative path
sudo su - sonar  
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/
cd /opt/sonarqube/bin/linux-x86-64/ 
sh sonar.sh start
# or start sonarqube as sonar user using absolute path
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start 
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
#sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start | stop | status | restart
