![alt text](image.png)

Objectives:
- All IS-IS adjacencies are up.
- All your routers can reach all other routers’ loopbacks
- No routing loops.
- Each IS-IS interface must have no more than one adjacency
- All routers must use MD5 authentication for Hello IS-IS protocol data unit (PDU) only on all IS-IS interfaces.
- L2 interfaces must not elect a Designated Intermediate System (DIS). 
- All BGP routes must be seen in all L1 routers database in Area 49.0002. 
- Level 2 must have a single summarized route to BGP destinations. 
- All IS-IS routes must be advertised to the DC2 BGP router. Any L1/L2 router failure must not have any L1 area isolated.
- Any ASBR failure must not result in BGP routes disappearing from the IS-IS domain or the default route disappearing in the DC2 BGP domain.
- No static routing is allowed.


