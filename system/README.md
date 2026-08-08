# Lab: Traffic Sampling & Flow Collection

## Traffic Sampling and Flow Collection

Configure traffic sampling on **vpe1** according to the following requirements:

1. **Sampling Parameters:**
   * Configure IPv4 traffic sampling at a rate of **1 out of every 50 packets** (`rate 50`).
2. **Interface Application:**
   * Apply IPv4 traffic sampling to interface `ge-0/0/0.0` such that both **ingress and egress** traffic on this interface are sampled.
3. **Collector & Export Configuration:**
   * Export sampled flows to the external Flow Collector at IP address `192.168.123.1` using UDP port `2055`.
   * Format the exported traffic using **cflowd version 5**.
   * Ensure flow export packets originate from the device's loopback interface (`lo0.0`).

---

## Verification

#### Configuration Solution