#!/bin/bash

sudo yum update

sudo yum install docker -y

sudo systemctl start docker

sudo systemctl enable docker

sudo docker run --name django -p 8000:8000 morhaf231/django

