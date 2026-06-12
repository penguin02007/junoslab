#!/bin/bash

# Usage: ./script.sh <lab identifier> <start|end>
ml="$1"
state="$2"

for i in {1..8}; do
    vmx="$i"
    echo "Downloading configuration for vMX $vmx..."
    
    # Using sshpass to pull the configuration
    sshpass -p 'admin@123' scp "admin@clab-ml_$ml-vr$vmx:/config/juniper.conf.gz" "vr$vmx.xml.conf.gz"
    
    # Decompressing and clean up
    gunzip -c "vr$vmx.xml.conf.gz" > "vr$vmx-$state.conf"
    rm "vr$vmx.xml.conf.gz"
done

for vmx in vce1-1 vce1-2 vce1-3 vce1-4 vce2-1 vce2-2 vce2-3 vce2-4 vce2-5 vce3-1 vce3-2; do
    echo "Downloading configuration for vMX $vmx..."
    
    # Using sshpass to pull the configuration
    sshpass -p 'admin@123' scp "admin@clab-ml_$ml-$vmx:/config/juniper.conf.gz" "$vmx.xml.conf.gz"
    
    # Decompressing and clean up
    gunzip -c "$vmx.xml.conf.gz" > "$vmx-$state.conf"
    rm "$vmx.xml.conf.gz"
done
