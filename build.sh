#!/bin/bash

docker build -t pts_base_ci:1.0.0 .
docker tag pts_base_ci:1.0.0 ortizman/pts_base_ci:1.0.0

# docker push ortizman/pts_base_ci:1.0.0