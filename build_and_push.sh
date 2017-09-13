#!/usr/bin/env bash

docker build -t fmasa/lebeda:7.1 lebeda/7.1 --no-cache
docker build -t fmasa/lebeda:7.1-ci lebeda/7.1-ci --no-cache

docker push fmasa/lebeda
