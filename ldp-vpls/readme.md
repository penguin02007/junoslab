# LDP-Signaled VPLS

# Diagram

```
  +---------------------------------------------------------------------------------------------------+
  |                                                                                                   |
  |  MPLS core: BGP AS 65000 (iBGP, vRR = route reflector)                                            |
  |             IS-IS area 49.0001, level-2 only | LDP                                                |
  |  VPLS:      10.10.10.0/24, untagged CE ports                                                      |
  |                                                                                                   |
  |                           vRR (vr10, 172.16.0.10)                                                 |
  |                    ge-0/0/8.206 /         \ ge-0/0/9.207                                          |
  |                                /           \                                                      |
  |   vCE2-1 ---ge-0/0/5--- vR1 (172.16.0.1) ---ge-0/0/0--- vR2 (172.16.0.2) ---ge-0/0/5--- vCE2-2    |
  |   .21                    |  [PE]                          [PE]  |                       .22       |
  |              ge-0/0/3.118|                                      |ge-0/0/4.127                     |
  |                          |                                      |                                 |
  |   vCE3-1 ---ge-0/0/6--- vR8 (172.16.0.8) --ge-0/0/2.178-- vR7 (172.16.0.7) ---ge-0/0/5--- vCE2-5  |
  |   .31                       [PE]                          [PE]                          .25       |
  |                                                                                                   |
  +---------------------------------------------------------------------------------------------------+
```
Brings up IS-IS, LDP and iBGP (AS 65000) in the core with vRR reflecting to the PEs. The CEs come up with their 10.10.10.0/24 addresses on untagged ports. The PE attachment circuits have **no** configuration, and there is **no** VPLS yet.

```
netlab up
```

# Tasks

1. Verify the MPLS underlay. Each PE (vR1, vR2, vR7, vR8) must have an LDP label-switched path to the loopback of every other PE.

2. Configure an LDP-signaled VPLS (RFC 4762, FEC 128) instance `blue-vpls` with `vpls-id 100` on vR1, vR2, vR7 and vR8. Connect vCE2-1, vCE2-2, vCE2-5 and vCE3-1 with **untagged** attachment circuits. Every CE must be able to ping every other CE in 10.10.10.0/24.

3. On vR8, configure a flood filter that polices broadcast, unknown-unicast and multicast (BUM) traffic received from vCE3-1 to 1 Mbps. BUM traffic from the other CEs must not be affected.

4. Configure MAC limits on vR8:
   - Limit the `blue-vpls` MAC table to 3 entries and drop frames from new source MACs once the table is full. Find out which CE loses connectivity through vR8 and explain why.
   - Limit the vCE3-1 attachment circuit to 1 MAC address.
   - Raise the table size again and confirm that all CEs can ping each other.

> [!IMPORTANT]
> vMX has no tunnel services PIC. Configure `no-tunnel-services` in the VPLS instance, or the pseudowires will not come up.

> [!Verification]
```
show ldp session
show route table inet.3
show vpls connections instance blue-vpls
show vpls mac-table instance blue-vpls
show vpls mac-table instance blue-vpls count
show vpls statistics instance blue-vpls
show firewall filter vce3-1-bum
show route forwarding-table family vpls
```

> [!Tips]
> LDP VPLS (vR1 shown; use each PE's CE-facing interface and the other three PE loopbacks as neighbors):
```
delete interfaces ge-0/0/5 unit 0
set interfaces ge-0/0/5 encapsulation ethernet-vpls
set interfaces ge-0/0/5 unit 0 family vpls
set protocols ldp interface lo0.0
set routing-instances blue-vpls instance-type vpls
set routing-instances blue-vpls interface ge-0/0/5.0
set routing-instances blue-vpls protocols vpls vpls-id 100
set routing-instances blue-vpls protocols vpls no-tunnel-services
set routing-instances blue-vpls protocols vpls neighbor 172.16.0.2
set routing-instances blue-vpls protocols vpls neighbor 172.16.0.7
set routing-instances blue-vpls protocols vpls neighbor 172.16.0.8
```
> `ldp interface lo0.0` lets the PEs form targeted LDP sessions to each other's loopbacks, which carry the pseudowire labels.

> Flood filter on vR8 (BUM from vCE3-1 only):
```
set firewall policer bum-1m if-exceeding bandwidth-limit 1m burst-size-limit 15k
set firewall policer bum-1m then discard
set firewall family vpls filter vce3-1-bum term vce3-1 from interface ge-0/0/6.0
set firewall family vpls filter vce3-1-bum term vce3-1 then policer bum-1m
set firewall family vpls filter vce3-1-bum term vce3-1 then count vce3-1-bum
set firewall family vpls filter vce3-1-bum term default then accept
set routing-instances blue-vpls forwarding-options family vpls flood input vce3-1-bum
```
> A flood filter only sees flooded (BUM) traffic, so it does not need to match on traffic type. To generate broadcasts, run `clear arp` on the CEs and ping again.

> MAC limits on vR8:
```
set routing-instances blue-vpls protocols vpls mac-table-size 3 packet-action drop
set routing-instances blue-vpls protocols vpls interface ge-0/0/6.0 interface-mac-limit 1 packet-action drop
```
