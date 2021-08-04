#!/bin/bash

echo "Beginning system updates"

sudo apt-get update

sudo apt-get dist-upgrade -y

echo "Beginning system clean"

sudo apt-get autoclean

sudo apt-get autoremove -y

echo "Completed systems updates and clean up"
