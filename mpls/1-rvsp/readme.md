![alt text](image-1.png)

# RSVP

## Task 2.1 Bandwidth Management
- Enable RSVP on all core-facing interfaces for routers vR1 through vR8 (refer to Figure 4.2).
    
- **Bandwidth Reservation:** Configure all RSVP-enabled interfaces to allow exactly **333 Mbps** of reservable bandwidth.
    
- **Exception:** The `ae0` Ethernet bundles must **not** have a manual bandwidth reservation configured (allow default behavior).

## Task 2.2 Link Coloring
- Configure IS-IS to track the LDP operational status on all core interfaces.

## Task 0.3: FEC Management
- Inject specific IX-facing subnets into LDP.
- Ensure each FEC (Forwarding Equivalence Class) advertised by vR1 or vR2 is reachable via a separate LSP. This requires manipulating the LDP egress policy to control label advertisement.


## Task 0.5: Verification 

- `show ldp neighbor`: LDP sessions are up and authenticated.
- `show ldp database`: Verify FECs and labels.
- `show isis interface ext`: LDP sync state is`in sync`
- `show route table mpls.0`: Label-switched paths exist for all core loopbacks.
- `traceroute mpls ipv4 <remote-loopback>`: Confirm the path matches the IS-IS best path.

### Tips
- Setting bandwidth -  `set protocols rsvp interface ge-0/0/2.170 bandwidth 333m
- Creating admin groups - `set protocols mpls interface ge-0/0/2.170 admin-group` GREEN`