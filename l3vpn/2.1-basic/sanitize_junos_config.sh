# /bin/bash

for i in `1 2 5 6`; do sshpass -padmin@123 ssh clab-ml_$1-vr$i "\
 edit;\
 delete interfaces ge-0/0/0; \
 delete interfaces ge-0/0/1; \
 commit and-quit"; \
 done
