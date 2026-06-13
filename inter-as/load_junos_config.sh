# /bin/bash

main() {
    if [ -z "$1" ]; then
        get_help
    else
        for i in 1 2 3 4 5 6 7 8; do sshpass -padmin@123 scp -o "StrictHostKeyChecking=no" vr$i-start.conf admin@clab-ml_$1-vr$i:/var/tmp/;done
        for i in 1 2 3 4 5 6 7 8; do sshpass -padmin@123 ssh admin@clab-ml_$1-vr$i "edit;load merge /var/tmp/vr$i-start.conf;commit and-quit";done
        for i in vce1-1 vce1-2 vce1-3 vce1-4 vce2-1 vce2-2 vce2-3 vce2-4 vce2-5 vce3-1 vce3-2; do sshpass -padmin@123 scp -o "StrictHostKeyChecking=no" vr$i-start.conf admin@clab-ml_$1-vr$i:/var/tmp/;done
        for i in vce1-1 vce1-2 vce1-3 vce1-4 vce2-1 vce2-2 vce2-3 vce2-4 vce2-5 vce3-1 vce3-2; do sshpass -padmin@123 ssh admin@clab-ml_$1-$i "edit;load merge /var/tmp/vr$i-start.conf;commit and-quit";done
    fi
}
get_help() {
    echo "Usage: $0 [multi-lab number]"
    echo "Example: $0 21"
}
main "$1"
