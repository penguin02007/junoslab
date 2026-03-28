
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

Config on each lab pulled from device using the get_junos_config.sh.
```
