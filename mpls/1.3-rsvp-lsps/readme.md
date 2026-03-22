Diagram 1.1: RSVP Topology
![alt text](image.png)

# RSVP - LSPs

`inet.3` vs `mpls.0`

During MPLS forwarding, only ingress router uses in `inet.3` , egress router on the path uses `mpls.0`.

This is because the headend router is the only one that needs to resolve the BGP route to an LSP. Transit and egress router only exists in `mpls.0` because they no longer forward an IP packet but uses label for swap or pop.

There are 

## Task 1.3: RSVP signaled LSPs
- Establish a mesh of RSVP LSPs as shown in diagram 2.2.
- Configure LSPs between specific PEs (vR1 to vR5, etc.).
    - Ensure LSPs utilize the administrative groups defined in Task 6.2 to influence path selection (e.g., `include-any GOLD`).
    - Enable Fast Reroute (FRR) to protect against link and node failures.
- LSP Configuration (assume LSP name is `vrX_to_vrX`)
1) Configure MD5 authentication for all RSVP sessions.
2) Enable BFD continuity checking for all RSVP sessions.
3) Make sure LSPs `vr2_to_vr7, vr7_to_vr2, vr3_to_vr6 and vr6_to_vr3` use only links belonging to RED administrative group.
4) Make sure LSPs  `vr1_to_vr8, vr8_to_vr1, vr4_to_r5, vr5_to_vr4` use only links belonging to GREEN administrative group.
5) Configure LSPs `vr3_to_vr8_1, vr3_to_vr8_2, vr8_to_vr3_1 and vr8_to_vr3_2` to use two distinct physical paths to the egress node. The paths should take three hops each. You may not use administrative groups in this step.
6) Configure LSPs `vr4_to_vr8_1, vr4_to_vr8_2, vr7_to_vr4_1 and vr7_to_vr4_2` so that they use two distinct physical paths to the egress node. LSPs M and O should use only the “green” links, and LSPs N and P should use only the “red” links.
7) Configure all LSPs except `vr1_to_vr8, vr4_to_vr5, vr8_to_vr1, vr5_to_vr4` to reserve 60 Mbps of bandwidth.
8) Configure LSPs A, B, S, and T to automatically re-signal the LSP once in 48 hours based on the average bandwidth usage. Make sure that the LSPs can use not less than 30 Mbps and not more than 120 Mbps.
9) Configure LSPs `vr1_to_vr8,  vr2_to_vr7, vr3_to_vr8, vr3_to_vr6, vr4_to_vr5` (as well as in reverse direction) to ensure that they have higher priority for bandwidth reservation than the remaining LSPs.
10) Make sure that if LSPs `vr3_to_vr8, vr4_to_vr7`  (as well as in reverse direction)  must be preempted, the ingress router will attempt to re-signal the LSP before tearing it down.
11) Configure automatic optimization for the LSPs `vr3_to_vr8_1, vr3_to_vr8_2, vr4_to_vr7_1, vr4_to_vr7_2`. Set the optimize timer to 8 hours. Make sure that the ingress routers attempt to re-signal the LSP before tearing it down.
12) Make sure that R5 and R6 prefer RSVP LSPs as the next hops for IPv4 BGP routes advertised by IX peers.
13) Configure LDP tunnels between R3 and R8 and between R4 and R7. Make sure that any router in your AS has an LDP-signaled LSP to any other router.
14) Make sure that IPv4 traffic at R8 from P1 to P2 uses LSP I and traffic from P1 to P3 uses LSP K.
15) Configure per-flow load balancing over LSPs `vr4_to_vr7_1 and vr4_to_vr7_2`. Similarly, configure per-flow load balancing over LSPs `vr7_to_vr4_1 and vr7_to_vr4_2`.
16) Make sure that MPLS paths in your network are hidden from external trace route utilities.
