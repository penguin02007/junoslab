# /bin/bash

main() {
    if [ -z "$1" ]; then
        get_help
    else
        for i in 1; do sshpass -padmin@123 scp -o "StrictHostKeyChecking=no" vr$i-start.conf admin@clab-ml_$1-vr$i:/var/tmp/;done
        for i in 1; do sshpass -padmin@123 ssh admin@clab-ml_$1-vr$i "edit;load merge /var/tmp/vr$i-start.conf;commit and-quit";done
    fi
}
get_help() {
    echo "Usage: $0 [multi-lab number]"
    echo "Example: $0 21"
}
main "$1"
