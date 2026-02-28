![alt text](image.png)

# MPLS LDP

There are three requirements to make up LDP, IGP, LDP and family MPLS.
IGP populate `inet.0`. It provides reachability needed for LDP neighbors to find each other's loopback and establish TCP session. LDP handles the "Hello" discovery
## Task 5.1: LDP Infrastructure & Session Security
- Enable LDP as shown in the diagram
- Ensure LDP is tracking the correct physical/logical interfaces as defined in the diagram.
- All LDP sessions should be configured with MD5 authentication  with `juniper123`.

## Task 5.2: IGP/LDP Synchronization
- Prevent traffic loss by ensuring IGP IS-IS does not advertise a link as available until LDP has successfully signaled labels across it.
- Configure IS-IS to track the LDP operational status on all core interfaces.

## Task 5.3: FEC Management & Path Diversity (vR1 & vR2)
- Inject specific IX-facing subnets into LDP.
- Ensure each FEC (Forwarding Equivalence Class) advertised by vR1 or vR2 is reachable via a separate LSP. This requires manipulating the LDP egress policy or using specific prefix-lists to control label advertisement.

## Task 5.4: Metric Alignment & Label Operations
- Configure LDP to ensure that LSPs reflect the same metric as the underlying IS-IS paths. (Note: LDP natively follows the IGP shortest path; this verifies that no manual metric offsets are overriding the IGP logic).
- Ensure that LDP labels are "popped" by the egress routers via PHP(Penultimate Hop Popping).
- The label for the egress loopback must 3 (Implicit Null).

## Task 5.5: Verification 

- `show ldp neighbor`: LDP sessions are up and authenticated.
- `show ldp database`: Verify FECs for all loopbacks (vR1-vR8) are present.
- `show isis interface detail`: Confirm LDP sync: enabled, Status: in sync.
- `show route table mpls.0`: Verify label-switched paths exist for all core loopbacks.
- `traceroute mpls ipv4 <remote-loopback>`: Confirm the path matches the IS-IS best path.

### Tips
- Enable ldp md5 authentication - `set protocols ldp sessions x.x.x.x authentication-key`
