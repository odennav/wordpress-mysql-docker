#!/bin/bash

echo "*******************************************************"
echo "Creating docker compose file"
touch docker-compose.yml
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Copying template from text file to YAML file"
cat docker-compose.txt >> docker-compose.yml
sleep 5
echo -e "\n"

sleep 5
echo "*******************************************************"
echo "Starting the compose service"
docker-compose up -d
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Check if desired images are created"
docker images
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Check if desired containers are running"
docker ps
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Pull data from localhost listening on port specified in YAML file"
curl localhost:8000
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Please view wordpress site at this url  localhost:8000  on a web browser"
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Docker login"
docker login
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Push wordpress image to docker hub "
docker tag wordpress victortreten/repo_test:wordpress
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Push wordpress image to docker hub "
docker tag mysql:5.7 victortreten/repo_test:mysql57
sleep 5
echo -e "\n"

echo "*******************************************************"
echo "Push wordpress image to docker hub "
docker push victortreten/repo_test:wordpress
sleep 5
echo -e "\n"


echo "*******************************************************"
echo "Push mysql image to docker hub "
docker push victortreten/repo_test:mysql57
sleep 5
echo -e "\n"

echo "END"
