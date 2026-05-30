![alt text](image.png)

# Create the topolgy 
1. `netlab up --plugin multilab -s defaults.multilab.id=21`
2. `bash sanitize_junos_config.sh [multi-lab number]` - Delete physical interfaces for lacp. 
3. `bash load_junos_config.sh [multi-lab number]` - Bring up lacp, ldp, mpls and add routing policy.

# Lab Question
1. Validate core and ce interfaces.  `show interface desc`
2. Troubleshoot the following:
  - Ensure isis adjacency are up.
  - Ensure iBGP sessions are up in vRR.
2. Configure BGP VPNv4 address family on all routers.