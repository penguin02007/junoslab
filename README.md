
This repository contains a collection of containerized network labs designed to study various protocols and environments. It is more leaner than VMs manually and allows you to focus on the configuration rather than the plumbing.

# 🚀 Lab Catalog

- BGP
- IS-IS
- MPLS (LDP, RSVP-TE)

## 🛠 Prerequisites

To run these labs, you will need:

- **[netlab](https://netlab.tools/):** Version 25+
- Virtualization Provider: Docker.
- Juniper Images: vMX or vJunos-router.

Config is pulled from virtual device using the following:
```
for i in {1..8}; do
	ml="3"
    vmx="vr$i"
    sshpass -p 'admin@123' scp "admin@clab-ml_$ml$-$vmx:/config/juniper.conf.gz" "$vmx.xml.conf.gz"
    gunzip -c "$vmx.xml.conf.gz" > "configs/$vmx.conf"
done
```