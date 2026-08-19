#!/bin/bash

ml="$1"
state="$2"
single_vmx="$3"

get_help() {
    echo "Usage:"
    echo "  $0 [multi-lab number] [start|end] [vmx number]"
    echo
    echo "Examples:"
    echo "  $0 21 start        # Pull all vMX and vce2 configs"
    echo "  $0 21 start 3      # Pull only vMX 3 (vr3)"
    echo "  $0 21 end 10       # Pull only vMX 10 (vr10)"
}

pull_vmx_config() {
    vmx="$1"

    echo "Downloading configuration for vMX $vmx..."

    sshpass -p 'admin@123' scp \
        "admin@clab-ml-$ml-vr$vmx:/config/juniper.conf.gz" \
        "vr$vmx.xml.conf.gz"

    # Only continue if SCP succeeded
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to download configuration from vr$vmx"
        return 1
    fi

    gunzip -c "vr$vmx.xml.conf.gz" > "vr$vmx-$state.conf"
    sed -i 's/^##\sLast changed.*$/## Junos Lab ##/' "vr$vmx-$state.conf"
    rm "vr$vmx.xml.conf.gz"

    echo "Saved: vr$vmx-$state.conf"
}

pull_vce_config() {
    vmx="$1"

    echo "Downloading configuration for $vmx..."

    sshpass -p 'admin@123' scp \
        "admin@clab-ml-$ml-$vmx:/config/juniper.conf.gz" \
        "$vmx.xml.conf.gz"

    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to download configuration from $vmx"
        return 1
    fi

    gunzip -c "$vmx.xml.conf.gz" > "$vmx-$state.conf"
    sed -i 's/^##\sLast changed.*$/## Junos Lab ##/' "$vmx-$state.conf"
    rm "$vmx.xml.conf.gz"

    echo "Saved: $vmx-$state.conf"
}

if [ -z "$ml" ] || [ -z "$state" ]; then
    get_help
    exit 1
fi

if [[ "$state" != "start" && "$state" != "end" ]]; then
    echo "ERROR: State must be 'start' or 'end'."
    get_help
    exit 1
fi

# If a specific vMX was supplied, pull only that device.
if [ -n "$single_vmx" ]; then
    pull_vmx_config "$single_vmx"
    exit $?
fi

# Otherwise pull all vMX devices.
for vmx in {1..8} 10; do
    pull_vmx_config "$vmx"
done

# Pull all vCE devices.
for vmx in vce2-1 vce2-2 vce2-3 vce2-4 vce2-5; do
    pull_vce_config "$vmx"
done
