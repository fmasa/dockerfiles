#!/usr/bin/env bash

docker build -t fmasa/lebeda:7.1 lebeda/7.1
docker build -t fmasa/lebeda:7.1-ci lebeda/7.1-ci

docker push fmasa/lebeda
