![alt text](image.png)

# Create the Topology 
1. `netlab up --plugin multilab -s defaults.multilab.id=21`
2. `bash load_junos_config.sh [multi-lab number]` - Bring up lacp, ldp, mpls and add routing policy.
2. `bash sanitize_junos_config.sh [multi-lab number]` - Delete physical interfaces for lacp. 

# Challanges
1. Validate core and ce interfaces.  `show interface desc`
2. Troubleshoot the following:
  - Ensure ISIS adjacency are up, all routers should have 34 adjacencies except for vr1 and vr2 that should have 4.
    `show isis adjacency | match Up | count `
  - Ensure 8 iBGP sessions are up in vRR.
    `show bgp summary | match Est | count`
  - Ensure LDP and RSVP sessions are up on all routers.
4. Configure BGP VPNv4 address family on all routers.
5. Configure iBGP peering between router reflector, vr1 and vr3 to allow router reflector to advertise a maximum of two paths for each IPv4 unicast prefix.
6. Route Reflector: Configure RR without enabling MPLS data-plane transport. Static route is permitted.
7. Customer C1:
  - Integrate customer C1 sites such that Area 0 forms a seamless, uninterrupted logical topology across the provider core, bypassing the requirement for explicit virtual-link or ASBR interventions.
  -  While maintaining secondary backdoor adjacencies at customer premises, enforce inbound and outbound routing policies to guarantee that the provider's MPLS core remains the primary forwarding vector for inter-site traffic.
  - Provision the backbone infrastructure to function as a deterministic secondary path for traffic exchanged between CE1-2 and CE1-3.
  - Design the routing policy framework to ensure that if customer C1 decommissions its backdoor connectivity, the primary PE failure scenario involving either R3 or R4 will not result in partial or total network partition of any customer C1 site.
8. Customer C2:
  - Configure customer C2 to operate in a centralized hub-and-spoke transit model, enforcing site S1 as the obligatory focal point for all inter-site traffic exchanges.
  - Implement strict loop-prevention and split-horizon controls to ensure that prefixes originated within customer C2 sites S1 or S2 are never reflected or advertised back to their source origin.
  - Ensure full reachability of all local PE-CE link subnets across remote sites within the customer C2 VPN topology.
  | Device | Interface | IP | Routing Instance |
  | :--- | :--- | :--- | :--- |
  | R1 | lo0.1 | .19 | hub   |
  | R1 | lo0.2 | .20 | spoke |
  | R2 | lo0.1 | .21 | hub   |
  | R2 | lo0.2 | .22 | spoke |
  | R4 | lo0.2 | .24 | spoke |
  | R4 | lo0.2 | .25 | spoke |
  | R7 | lo0.1 | .33 | spoke |

9. Route Target:
  - Restrict BGP VPN routing updates such that individual PE devices import only those prefix targets matching their specific localization requirements.
  - Establish local VRF route leakage on router R4 to allow direct local communication between customer C1 site S2 and customer C2 site S2. Guarantee that these locally leaked prefixes are strictly isolated and constrained, preventing leakage toward any remote PE nodes.
10. Internet:
  - Provide customer C1 site S2 with multi-homed Internet connectivity via a single customer-facing interface attachment. The routing design must ensure high availability, ensuring that the control or forwarding plane failure of either R3 or R4 does not disrupt Internet reachability for customer C1 site S2.

# Verification:
1. Confirm CE can ping each other.
   - ce2-3 to ce2-5
   - ce2-3 to ce2-4

  | CE Name | CE Loopback | Edge | site  |
  | :--- | :--- | :--- | :--- |
  | CE2-1 | 10.10.10.1 | vr1 | hub   |
  | CE2-2 | 10.10.10.2 | vr2 | hub   |
  | CE2-3 | 10.10.10.3 | vr4 | spoke |
  | CE2-4 | 10.10.10.4 | vr5 | spoke |
  | CE2-5 | 10.10.10.5 | vr7 | spoke |