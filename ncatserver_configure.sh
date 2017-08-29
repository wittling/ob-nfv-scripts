#!/bin/bash

hostname -I > /home/ubuntu/identification
i=0
ncat $ncatserver_private 9876 < /home/ubuntu/identification 

# in case the server was not ready yet
while [ $? -ne 0 ] && [ $i -lt 5 ]; do
  sleep 2
  i=$((i+1))
  ncat $ncatserver_private 9876 < /home/ubuntu/identification 
done

if [ $? -ne 0 ]; then
  echo "Could not send ip address to host $ncatserver_private"
else
  echo "Ip address $(cat /home/ubuntu/identification) sent to host $ncatserver_private"
fi
