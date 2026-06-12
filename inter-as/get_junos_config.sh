#!/bin/bash

# Usage: ./script.sh <lab identifier> <start|end>
ml="$1"
state="$2"

for i in {1..8} 21 22 {111..132}; do
    vmx="$i"
    echo "Downloading configuration for vMX $vmx..."
    
    # Using sshpass to pull the configuration
    sshpass -p 'admin@123' scp "admin@clab-ml_$ml-vr$vmx:/config/juniper.conf.gz" "vr$vmx.xml.conf.gz"
    
    # Decompressing the configuration
    gunzip -c "vr$vmx.xml.conf.gz" > "vr$vmx-$state.conf"
    
    # Cleanup compressed file
    rm "vr$vmx.xml.conf.gz"
done
