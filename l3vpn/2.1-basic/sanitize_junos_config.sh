# /bin/bash

main() {
    if [ -z "$1" ]; then
        get_help
    else
        echo "Processing: clab multi-lab $1"
        for i in 1 2 5 6; do sshpass -padmin@123 ssh clab-ml_$1-vr$i "\
        edit;\
        delete interfaces ge-0/0/0; \
        delete interfaces ge-0/0/1; \
        commit and-quit"; \
        done
    fi
}
get_help() {
    echo "Usage: $0 [multi-lab number]"
    echo "Example: $0 21"
}
main "$1"
