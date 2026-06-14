#!/usr/bin/env bash

set -e


if [ "$1" == "build_generator" ]
then
    docker build -f Dockerfile.generator -t generator:0.1 .
    docker images | grep generator

elif [ "$1" == "run_generator" ]
then
    mkdir -p data
    docker run --rm --name generator -v ./data:/data generator:0.1

elif [ "$1" == "create_local_data" ]
then
    mkdir -p local_data
    python generator/generate.py local_data

elif [ "$1" == "build_reporter" ]
then
    docker build -f Dockerfile.reporter -t reporter:0.1 .
    docker images | grep reporter

elif [ "$1" == "run_reporter" ]
then
    docker run --rm --name reporter -v ./data:/data reporter:0.1

elif [ "$1" == "structure" ]
then
    tree # документация

elif [ "$1" == "clear_data" ]
then
    cd data
    rm data.csv
    rm report.html

elif [ "$1" == "inside_generator" ]
then
    docker run --rm --name generator -v ./data:/data generator:0.1 ls -la /data

elif [ "$1" == "inside_reporter" ]
then
    docker run --rm --name reporter -v ./data:/data reporter:0.1 ls -la /data

else
    echo "Неправильная команда."
fi