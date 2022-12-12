#!/bin/bash
# Author: Landmark Technology
# CentOs or REHEL 7/8

#As a good security practice, SonarQuber Server is not advised to run sonar service as a root user, 
#so create a new user called sonar and grant sudo access to manage sonar services as follows
# 1. create a sonar 
sudo useradd sonar
# 2. Grand sudo access to sonar user
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
sudo hostnamectl set-hostname sonar
sudo su - sonar
