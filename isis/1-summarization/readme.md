![alt text](image.png)

## Objectives
Configure IS-IS domain splitting the network into a Level 1 (Edge) and Level 2 (Backbone) hierarchy, ensuring specific traffic patterns and fast convergence.

## Task 1.1: Interface Setup

* Configure ISO NET addresses based on the Loopback IP addresses (e.g., 49.000X.1720.1600.000X.00).
* Enable wide-metrics-only on all nodes (Mandatory for MPLS/TE support).
* vR1 & vR3: Configure as Level-2 Only routers.
* vR2 & vR4: Configure as Level-1-2 routers (ABRs).
* Interfaces facing vR1 and vR3 must be Level 2 only.
* The link between vR2 and vR4 must be Level 1 only.
* Verification: Ensure vR1 cannot see vR2 or vR4 as Level 1 neighbors.
* Level 2 must have a single summarized route to BGP destinations.
* DC2: Enable BGP load balancing.

## Task 2.1: Summarization (L1 to L2)

The Edge routers (vR2, vR4) possess the specific loopbacks and connection links for the "Edge" network.

* Configure vR2 and vR4 to suppress individual Level 1 specific prefixes from entering the Level 2 backbone.
* Instead, advertise a single summary route 192.168.0.0/16 into the Level 2 backbone.
* Constraint: Do not summarize the Loopback addresses of vR2 and vR4 (172.16.0.2/32 and 172.16.0.4/32)—these must remain specific in the backbone for MPLS LSPs to resolve correctly later.
### Vertification - R1 or R3
```
show route protocol isis 192.168.0.0/16 
```

## Task 2.2: Route Leaking (L2 to L1)
* By default, L1 routers will only see a default route (ATT bit) to the backbone.
* Isolate vR4 to Level 1 only and configure a routing policy on vR4 to leak the Loopback address of vR1 (172.16.0.1/32) into the Level 1 area.
* Verification: Check show route protocol isis on vR4. It should see 172.16.0.1/32 as an L1 route (leaked from L2), but vR3's loopback should only be reachable via the default route.
```
show route protocol isis
show isis adjacency
```
## Task 3.1: External Routes
External Connectivity & Redistribution. Send Customer Connectivity via DC2.

* On vR2 and vR4, configure a static route to DC2's loopback (172.16.0.20/32) pointing to the respective next hops on the diagram.
* Redistribute these static routes into IS-IS Level 1 only.
* Constraint: Ensure external routes appear in the backbone (vR1/vR3) marked with the "External" flag.

## Task 4.1: Authentication

* Configure MD5 authentication for all IS-IS Hellos (IIHs) and LSPs.
* Use a keychain named JNCIE-KEY with a secret of juniper123.
* Constraint: The key must have a start-time of "now" and never expire.

### Task 4.2: Fast Convergence (BFD)

* Enable BFD (Bidirectional Forwarding Detection) on all IS-IS interfaces.
* Set minimum interval to 100ms and multiplier to 3.
* Verification: Run show bfd session to ensure sessions are "Up" and aligned with IS-IS neighbors.

## Task 4.3: Loop Free Alternate (LFA)

* Enable Link-Protection on vR2's interface facing vR4.
* Verify that vR2 has pre-calculated a backup path to vR4's loopback via the backbone if the direct link fails.

# Hints
* `set protocols isis interface <int> level 2 disable` - create L1-only links.
* `set routing-options aggregate route 172.16.0.0/16` combined with `set protocols isis export <policy>` for summarization.
* `set policy-options policy-statement LEAK-L2-L1 from level 2 / to level 1` - for route leaking.
* `set protocols isis level 1 external-preference` - to manage redistribution preferences.
* ` show isis interface xxx detail` - debug isis adjacency
