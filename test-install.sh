#!/bin/bash
# used for the integration tests

# sudo apt-get update && sudo apt-get install -y iperf && sudo apt-get install -y screen

# We will disable the full update as it seems to be contributing to an openbaton timeout.
# For now at least.
sudo apt-get install -y iperf && sudo apt-get install -y screen

# check if iperf and screen are installed
command -v iperf > /dev/null
if [ $? -ne 0 ]
then 
  >&2 echo "Iperf was not installed successfully"
else
  echo "Iperf is installed"
fi
command -v screen > /dev/null
if [ $? -ne 0 ]
then
  >&2 echo "Screen was not installed successfully"
else
  echo "Screen is installed"
fi
