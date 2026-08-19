#!/bin/bash

ml="$1"
state="$2"

get_help() {
    echo "Usage: $0 [multi-lab number] [start|end]"
    echo "Example: $0 21 start"
}

if [ -z "$1" ]; then
    get_help
else
    for i in {1..8} 10; do
        vmx="$i"
        echo "Downloading configuration for vMX $vmx..."
        
        sshpass -p 'admin@123' scp "admin@clab-ml-$ml-vr$vmx:/config/juniper.conf.gz" "vr$vmx.xml.conf.gz"

        # pull config and clean up
        gunzip -c "vr$vmx.xml.conf.gz" > "vr$vmx-$state.conf"
        sed -i 's/^##\sLast changed.*$/## Junos Lab ##/' "vr$vmx-$state.conf"
        rm "vr$vmx.xml.conf.gz"
    done

    for vmx in vce2-1 vce2-2 vce2-3 vce2-4 vce2-5; do
        echo "Downloading configuration for $vmx..."

        sshpass -p 'admin@123' scp "admin@clab-ml-$ml-$vmx:/config/juniper.conf.gz" "$vmx.xml.conf.gz"

        # pull config and clean up
        gunzip -c "$vmx.xml.conf.gz" > "$vmx-$state.conf"
        sed -i 's/^##\sLast changed.*$/## Junos Lab ##/' "$vmx-$state.conf"
        rm "$vmx.xml.conf.gz"
    done
fi
