#!/usr/bin/env bash

docker build -t fmasa/lebeda:8.1 lebeda/8.1 --no-cache
docker build -t fmasa/lebeda:8.1-ci lebeda/8.1-ci --no-cache

docker build -t fmasa/lebeda:8.0 lebeda/8.0 --no-cache
docker build -t fmasa/lebeda:8.0-ci lebeda/8.0-ci --no-cache

docker build -t fmasa/lebeda:7.4 lebeda/7.4 --no-cache
docker build -t fmasa/lebeda:7.4-ci lebeda/7.4-ci --no-cache

docker build -t fmasa/lebeda:7.3 lebeda/7.3 --no-cache
docker build -t fmasa/lebeda:7.3-ci lebeda/7.3-ci --no-cache

docker build -t fmasa/lebeda:7.1 lebeda/7.1 --no-cache
docker build -t fmasa/lebeda:7.1-ci lebeda/7.1-ci --no-cache

docker build -t fmasa/firefox firefox --no-cache

docker push fmasa/lebeda
docker push fmasa/firefox
