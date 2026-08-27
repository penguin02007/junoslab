#!/bin/bash

ml="$1"
state="$2"
target_device="$3"

get_help() {
    echo "Usage:"
    echo "  $0 [multi-lab number] [start|end] [device]"
    echo
    echo "Examples:"
    echo "  $0 21 start          # load all vMX and vCE start configs"
    echo "  $0 21 start 3        # load only vMX 3 (vr3)"
    echo "  $0 21 end vce2-3   # load vCE2-3 end config (solutions)"
}

# Validate required positional arguments
if [ -z "$ml" ] || [ -z "$state" ]; then
    get_help
    exit 1
fi

if [ "$state" != "start" ] && [ "$state" != "end" ]; then
    echo "Error: State must be 'start' or 'end'."
    echo
    get_help
    exit 1
fi

# Full topology device inventory
ALL_DEVICES=(
    vr1 vr2 vr3 vr4 vr5 vr6 vr7 vr8 vr9 vr10
    vce1-1 vce1-2 vce1-3 vce1-4
    vce2-1 vce2-2 vce2-3 vce2-4 vce2-5
    vix1 vix2
)

# Resolve target list (all vs. single device)
if [ -n "$target_device" ]; then
    # Normalize numeric input (e.g., '3' -> 'vr3')
    if [[ "$target_device" =~ ^[0-9]+$ ]]; then
        target_device="vr${target_device}"
    fi
    DEVICES=("$target_device")
else
    DEVICES=("${ALL_DEVICES[@]}")
fi

load_device_config() {
    local dev="$1"
    local conf_file="${dev}-${state}.conf"

    if [ ! -f "$conf_file" ]; then
        echo "[-] Skipping ${dev}: Configuration file '${conf_file}' not found."
        return 1
    fi

    echo "[+] Deploying ${conf_file} to clab-ml-${ml}-${dev}..."

    sshpass -padmin@123 scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
        "${conf_file}" "admin@clab-ml-${ml}-${dev}:/var/tmp/" || return 1

    sshpass -padmin@123 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
        "admin@clab-ml-${ml}-${dev}" \
        "edit; delete firewall; delete routing-options; delete policy-options; delete protocols; load merge /var/tmp/${conf_file}; commit and-quit"
}

for dev in "${DEVICES[@]}"; do
    load_device_config "$dev"
done
