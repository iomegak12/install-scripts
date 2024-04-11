#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y openjdk-11-jdk

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
 
sudo apt-get update -y
sudo apt-get install -y jenkins

sudo systemctl start jenkins
 
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -sSL https://get.docker.com | sudo bash -E -

sudo chmod 777 /var/run/docker.sock

docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
