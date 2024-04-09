#!/bin/bash
echo "*********************************************************"
echo "Stopping Wordpress image"
docker stop wordpressCont
sleep 3

echo "*********************************************************"
echo "Stopping mysql image"
docker stop mysqlCont
sleep 3

echo "*********************************************************"
echo "Removing wordpress container"
docker rm wordpressCont
sleep 3

echo "*********************************************************"
echo "Removing wordpress container"
docker rm mysqlCont
sleep 3

echo "*********************************************************"
echo "Deleting wordpress and mysql images"
docker rmi wordpress
docker rmi victortreten/repo_test:wordpress
docker rmi victortreten/repo_test:mysql57
docker rmi mysql:5.7
sleep 3

echo "*********************************************************"
echo "Deleting all wordpress dependency files"
rm -rf wp-*
rm *.php
rm license.txt
rm readme.html
sleep 3

echo "*********************************************************"
echo "Deleting docker compose template"
rm docker-compose.yml
sleep 3

echo "*********************************************************"
echo "Confirm docker containers removed"
docker ps 
sleep 3

echo "*********************************************************"
echo "Check current directory for deendency files"
pwd
ls -la




