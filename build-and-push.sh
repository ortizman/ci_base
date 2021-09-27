#!/bin/bash

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 048659116606.dkr.ecr.us-east-1.amazonaws.com

docker build -t pts_base_ci .
docker tag pts_base_ci ortizman/pts_base_ci:1.0.0
docker push ortizman/pts_base_ci:1.0.0
