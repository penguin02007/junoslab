# /bin/bash

get_help() {
    echo "Usage: $0 [multi-lab number]"
    echo "Example: $0 21"
}
sanitize_config () {
    if [ -z "$1" ]; then
        get_help
    else
        echo "Delete Interfaces for LACP: clab multi-lab $1"
        for i in 1 2 5 6; do sshpass -padmin@123 ssh clab-ml-$1-vr$i "\
        edit;\
        delete interfaces ge-0/0/0; \
        delete interfaces ge-0/0/1; \
        commit and-quit"; \
        done
        echo "Clean Up Unit 0 in Interfaces: clab multi-lab $1"
        for i in {1..8} 10; do sshpass -padmin@123 ssh clab-ml-$1-vr$i "\
        edit;\
        delete protocols isis; \
        delete interfaces ge-0/0/2.0; \
        delete interfaces ge-0/0/3.0; \
        delete interfaces ge-0/0/4.0; \
        commit and-quit"; \
        done
    fi
}
main() {
    if [ -z "$1" ]; then
        get_help
    else
        for i in {1..8} 10; do sshpass -padmin@123 scp -o "StrictHostKeyChecking=no" vr$i-start.conf admin@clab-ml-$1-vr$i:/var/tmp/;done
        for i in {1..8} 10; do sshpass -padmin@123 ssh admin@clab-ml-$1-vr$i "edit;load merge /var/tmp/vr$i-start.conf;commit and-quit";done
        for i in vce1-1 vce1-2 vce1-3 vce1-4 vce2-1 vce2-2 vce2-3 vce2-4 vce2-5 vce3-1 vce3-2; do sshpass -padmin@123 scp -o "StrictHostKeyChecking=no" $i-start.conf admin@clab-ml-$1-$i:/var/tmp/;done
        for i in vce1-1 vce1-2 vce1-3 vce1-4 vce2-1 vce2-2 vce2-3 vce2-4 vce2-5 vce3-1 vce3-2; do sshpass -padmin@123 ssh admin@clab-ml-$1-$i "edit;load merge /var/tmp/$i-start.conf;commit and-quit";done
    fi
}
get_help() {
    echo "Usage: $0 [multi-lab number]"
    echo "Example: $0 21"
}
sanitize_config "$1"
main "$1"
