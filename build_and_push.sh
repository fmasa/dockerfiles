#!/usr/bin/env bash

docker build -t fmasa/lebeda:7.3 lebeda/7.3 --no-cache
docker build -t fmasa/lebeda:7.3-ci lebeda/7.3-ci --no-cache

docker build -t fmasa/lebeda:7.1 lebeda/7.1 --no-cache
docker build -t fmasa/lebeda:7.1-ci lebeda/7.1-ci --no-cache

docker build -t fmasa/firefox firefox --no-cache

docker push fmasa/lebeda
docker push fmasa/firefox
