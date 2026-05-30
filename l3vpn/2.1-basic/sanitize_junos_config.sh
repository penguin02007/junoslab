# /bin/bash

main() {
    if [ -z "$1" ]; then
        get_help
    else
        echo "Delete Interfaces for LACP: clab multi-lab $1"
        for i in 1 2 5 6; do sshpass -padmin@123 ssh clab-ml_$1-vr$i "\
        edit;\
        delete interfaces ge-0/0/0; \
        delete interfaces ge-0/0/1; \
        commit and-quit"; \
        done
        echo "Clean Up Unit 0 in Interfaces: clab multi-lab $1"
        for i in 1 2 3 4 5 6 7 8; do sshpass -padmin@123 ssh clab-ml_$1-vr$i "\
        edit;\
        delete interfaces ge-0/0/2.0; \
        delete interfaces ge-0/0/3.0; \
        delete interfaces ge-0/0/4.0; \
        commit and-quit"; \
        done
    fi
}
get_help() {
    echo "Usage: $0 [multi-lab number]"
    echo "Example: $0 21"
}
main "$1"
