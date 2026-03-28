![alt text](image.png)

# RSVP Protection

In this task, you will implement  protection mechanisms to ensure traffic continuity across the core.

## 1. Secondary Path Protection

Configure a **secondary backup path** for all RSVP-signaled LSPs in the topology except for `vr3_to_vr8_2`, `vr8_to_vr3_2`, `vr7_to_vr4_2`, `vr4_to_vr2_2`.

## 2. Standby Secondary Paths

For the LSPs identified as **L31, L32, L71, and L72** (the horizontal spans), ensure the protection path is established in **standby mode**. The backup path must be up and signaled _before_ a primary path failure occurs.

## 3. Bandwidth Inheritance and Sharing

Configure all secondary protection paths to inherit bandwidth settings from their respective primary paths.

- **Special Requirement:** For LSPs **L31, L32, L71, and L72**, ensure the `secondary` path is configured to **share bandwidth** with the primary path to optimize resource utilization in the core.
    

## 4. Non-Revertive Behavior

Configure LSPs **L2, L3, L4, and L43** (the eastern mesh connections) to be **non-revertive**. If a switchover to the protection path occurs, the traffic must stay on the backup path even after the primary link is restored.

## 5. Fast Reroute (FRR) with Detour Constraints

Implement **Fast Reroute (FRR)** protection for LSPs **L31, L32, L71, and L72**.

- The detour LSPs must **not** inherit bandwidth or administrative group (RED/GREEN) settings from the main LSP.
    
- Configure a hop-limit constraint: Detour LSPs must not exceed **five hops**.
    

## 6. Link Protection

Enable **Link Protection** for the following group of LSPs:

- **L1, L8, L2, L3, L4, L43, L5, and L53**.
    
- _Note: Ensure `link-protection` is also enabled on the participating physical interfaces under `protocols rsvp`._
    

## 7. Node and Link Protection

For LSPs **L81, L82, L83, and L13** (the upper and western diagonal connections), configure both **Link and Node protection** to protect against transit router failures in the core.
## Tips
1. RSVP LSP are configured under `protocol mpls label-switched-path`.
2. Use `show rsvp session extensive` to see the explicit route object.
3. Use `show route table inet.3 protocol rsvp` to see loopback is reachable from MPLS LSPs.
