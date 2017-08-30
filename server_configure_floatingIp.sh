#!/bin/bash

echo "-----------"
echo "key1 = $key1"
echo "key2 = $key2"
echo "key3 = $key3"
echo "key4 = $key4"

echo "key1 = $key1" > /tmp/test.log
echo "key2 = $key2" >> /tmp/test.log
echo "key3 = $key3" >> /tmp/test.log
echo "key4 = $key4" >> /tmp/test.log

echo "-----------"

if [ $server_shared_int_network_floatingIp ]
then
    screen -d -m -S client iperf -c $server_shared_int_network_floatingIp -t 300
else
    screen -d -m -S client iperf -c $server_private_floatingIp -t 300
fi

