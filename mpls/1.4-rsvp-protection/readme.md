![alt text](image.png)

# RSVP Protection

In this task, you will implement  protection mechanisms to ensure traffic continuity across the core.

1. Configure a **secondary backup path** for all RSVP-signaled LSPs in the topology except for `vr3_to_vr8_2`, `vr8_to_vr3_2`, `vr7_to_vr4_2`, `vr4_to_vr2_2`.
2. For `vr1_to_vr6`, `vr6_to_vr1`, `vr2_to_vr5`, `vr5_to_vr2` ensure  protection path is established in standby mode. 
3. Ensure the `secondary` path is configured to share bandwidth with the primary path to optimize resource utilization in the core.
4. Configure LSPs `vr2_to_vr7`, `vr3_to_vr6`, `vr7_to_vr2`, `vr6_to_vr3` to be **non-revertive**. If a switchover to the protection path occurs, the traffic must stay on the backup path even after the primary link is restored.
5. Implement Fast Reroute (FRR) protection for LSPs `vr1_to_vr6`, `vr6_to_vr1`, `vr2_to_vr5`, `vr5_to_vr2`.
	1. The detour LSPs must **not** inherit bandwidth or administrative group settings from the main LSP.
	2. Detour LSPs must not exceed **five hops**.
6. Enable **Link Protection** for LSPs `vr1_to_vr8`,vr2_to_vr7, vr3_to_vr6 and vr4_to_vr5 and its reverse path.
	- _Note: Ensure `link-protection` is also enabled on the participating physical interfaces under `protocols rsvp`._
7. Configure both node link protection on `vr8_to_vr3_1` and `vr7_to_vr4_1` and its reverse path.

# IPv6 Tunneling with 6PE

1. Enable IPv6 over MPLS tunneling using 6PE. No native IPv6 forwarding allowed
2. No MPLS LSPs on route reflector. Static route is allowed on RR if needed.
3. 
## Tips
1. RSVP LSP are configured under `protocol mpls label-switched-path`.
2. Use `show rsvp session extensive` to see the explicit route object.
3. Use `show route table inet.3 protocol rsvp` to see loopback is reachable from MPLS LSPs.

