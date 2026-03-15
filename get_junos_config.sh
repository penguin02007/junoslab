for i in {1..8}; do
    ml="3"
    vmx="vr$i"
    sshpass -p 'admin@123' scp "admin@clab-ml_$ml-$vmx:/config/juniper.conf.gz" "$vmx.xml.conf.gz"
    gunzip -c "$vmx.xml.conf.gz" > "configs/$vmx.conf"
done
