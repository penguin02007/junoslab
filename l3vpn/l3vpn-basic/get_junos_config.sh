#!/bin/bash

ml="$1"
state="$2"
device="$3"

get_help() {
    echo "Usage:"
    echo "  $0 [multi-lab number] [start|end] [device]"
    echo
    echo "Examples:"
    echo "  $0 21 start          # Pull all vMX and vCE configs"
    echo "  $0 21 start 3        # Pull only vMX 3 (vr3)"
    echo "  $0 21 end 10         # Pull only vMX 10 (vr10)"
    echo "  $0 21 start vce2-3   # Pull only vCE2-3"
}

pull_vmx_config() {
    vmx="$1"

    echo "Downloading configuration for vMX $vmx..."

    sshpass -p 'admin@123' scp \
        "admin@clab-ml-$ml-vr$vmx:/config/juniper.conf.gz" \
        "vr$vmx.xml.conf.gz"

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
    vce="$1"

    echo "Downloading configuration for $vce..."

    sshpass -p 'admin@123' scp \
        "admin@clab-ml-$ml-$vce:/config/juniper.conf.gz" \
        "$vce.xml.conf.gz"

    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to download configuration from $vce"
        return 1
    fi

    gunzip -c "$vce.xml.conf.gz" > "$vce-$state.conf"
    sed -i 's/^##\sLast changed.*$/## Junos Lab ##/' "$vce-$state.conf"
    rm "$vce.xml.conf.gz"

    echo "Saved: $vce-$state.conf"
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

# Pull a single device if specified.
if [ -n "$device" ]; then

    # Numeric argument = vMX / vr device.
    if [[ "$device" =~ ^[0-9]+$ ]]; then
        pull_vmx_config "$device"
        exit $?

    # vce2-X argument = CE device.
    elif [[ "$device" =~ ^vce2-[0-9]+$ ]]; then
        pull_vce_config "$device"
        exit $?

    else
        echo "ERROR: Invalid device '$device'"
        echo "Use a vMX number (example: 3) or CE name (example: vce2-3)."
        get_help
        exit 1
    fi
fi

# No device specified: pull all vMX devices.
for vmx in {1..8} 10; do
    pull_vmx_config "$vmx"
done

# Pull all vCE devices.
for vce in vce2-1 vce2-2 vce2-3 vce2-4 vce2-5; do
    pull_vce_config "$vce"
done
