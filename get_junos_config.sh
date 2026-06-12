for i in {1..8}; do
    ml="$1"
    state="$2"
    vmx="$i"
    sshpass -p 'admin@123' scp "admin@clab-ml_$ml-vr$vmx:/config/juniper.conf.gz" "vr$vmx.xml.conf.gz"
    gunzip -c "vr$vmx.xml.conf.gz" > "vr$vmx-$state.conf"
done
