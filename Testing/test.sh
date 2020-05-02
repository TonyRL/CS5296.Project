#!/bin/bash
echo "Testing CPU, results are save in /tmp/CPU_trial.txt"
cat /proc/cpuinfo | grep 'model name' > /tmp/CPU_name.txt
sysbench cpu --threads=4 --cpu-max-prime=10000 run > /tmp/CPU_trial1.txt
sysbench cpu --threads=4 --cpu-max-prime=10000 run > /tmp/CPU_trial2.txt
sysbench cpu --threads=4 --cpu-max-prime=10000 run > /tmp/CPU_trial3.txt
echo "Testing RAM, results are save in /tmp/RAM_trial.txt"
sysbench memory --threads=4 --memory-total-size=10G --memory-oper=write --memory-scope=global run > /tmp/RAM_trial1.txt
sysbench memory --threads=4 --memory-total-size=10G --memory-oper=write --memory-scope=global run > /tmp/RAM_trial2.txt
sysbench memory --threads=4 --memory-total-size=10G --memory-oper=write --memory-scope=global run > /tmp/RAM_trial3.txt
echo "Testing Disk, results are save in /tmp/Disk_trial.txt"
sysbench fileio --threads=16 --file-total-size=3G --file-test-mode=rndrw prepare
sysbench fileio --threads=16 --file-total-size=3G --file-test-mode=rndrw run > /tmp/Disk_trial1.txt
sysbench fileio --threads=16 --file-total-size=3G --file-test-mode=rndrw run > /tmp/Disk_trial2.txt
sysbench fileio --threads=16 --file-total-size=3G --file-test-mode=rndrw run > /tmp/Disk_trial3.txt
sysbench fileio --threads=16 --file-total-size=3G --file-test-mode=rndrw cleanup