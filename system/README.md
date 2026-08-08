# Lab: Traffic Sampling & Flow Collection

## Traffic Sampling and Flow Collection

### IPv4
1. Configure IPv4 traffic sampling at a rate of **1 out of every 50 packets**.
2. Apply IPv4 traffic sampling to interface `ge-0/0/0.0` such that both **ingress and egress** traffic on this interface are sampled.
3. **Collector Configuration:**
   * Export sampled flows to the external Flow Collector at IP address `192.168.XX.101` using UDP port `2055`.
   * Format the exported traffic using **cflowd version 5**.
   * Ensure flow export packets originate from the device's loopback interface.

---

#### Verification
`show interface xyz extensive`


## IPv6

Configure bidirectional IPv6 traffic sampling on interface ge-0/0/0.x using inline sampling.

1. Export the sampled flows to the Flow Collector at `192.168.XX.101` on port 2055.
2. Configure a flow template named jncie_ipfix. Ensure that the active flow export interval is set to 30 seconds and that flows are marked inactive after 180 seconds of inactivity.
3. Use  lo0 interface as  source address and configure the sampling rate to 1 packet out of every 1000 packets.

### Verification
Check inline-jflow using `show services accounting`

```
ping 2001:db8:1000::1 rapid 
admin@vpe1> show services accounting flow inline-jflow fpc-slot 0    
  Flow information
    FPC Slot: 0
    Flow Packets: 0, Flow Bytes: 0
    Active Flows: 0, Total Flows: 0
    Flows Exported: 0, Flow Packets Exported: 0
    Flows Inactive Timed Out: 0, Flows Active Timed Out: 0
    Total Flow Insert Count: 0

    IPv6 Flows:
    IPv6 Flow Packets: 0, IPv6 Flow Bytes: 0
    IPv6 Active Flows: 0, IPv6 Total Flows: 0
    IPv6 Flows Exported: 0, IPv6 Flow Packets Exported: 0
    IPv6 Flows Inactive Timed Out: 0, IPv6 Flows Active Timed Out: 0
    IPv6 Flow Insert Count: 0
```

```
ping 2001:db8:1000::1 rapid count 2000 
show services accounting flow inline-jflow fpc-slot 0    
  Flow information
    FPC Slot: 0
    Flow Packets: 2, Flow Bytes: 112
    Active Flows: 2, Total Flows: 4
    Flows Exported: 2, Flow Packets Exported: 1
    Flows Inactive Timed Out: 0, Flows Active Timed Out: 2
    Total Flow Insert Count: 2

    IPv6 Flows:
    IPv6 Flow Packets: 2, IPv6 Flow Bytes: 112
    IPv6 Active Flows: 2, IPv6 Total Flows: 4
    IPv6 Flows Exported: 2, IPv6 Flow Packets Exported: 1
    IPv6 Flows Inactive Timed Out: 0, IPv6 Flows Active Timed Out: 2
    IPv6 Flow Insert Count: 2

```
> **Note:** Output might show no traffic because 1 out of 1000 packets are sampled.


## Secure Streaming Telemetry
1. Ensure vpe1 can serve secure streaming telemetry data using gRPC on port 43123.
2. Use a local certificate named jncie_cert, allow up to 15 maximum connections, and allow access only from a host with IP address 10.10.1.1

### Verification

```
show security pki local-certificate
```

### Answers
1. Generate crypto key pair and assign key pair to certificate.
```
request security pki generate-key-pair type rsa size 2048 certificate-id jncie
request security pki local-certificate generate-self-signed subject DC=jncie.net domain-name jncie.net certificate-id jncie 
```

2. Tie SSL to gRPC, set max-connection and whitelisting.
```
set system services extension-service request-response grpc ssl port 43123
set system services extension-service request-response grpc ssl local-certificate jncie
set system services extension-service request-response grpc ssl use-pki
set system services extension-service request-response grpc max-connections 15
set system services extension-service notification allow-clients address 10.10.1.1
```