
This repository contains a collection of containerized network labs designed to study various protocols and scenario. It is more leaner than VMs manually and allows you to focus on the configuration rather than the plumbing.

# 🚀 Lab Catalog

- BGP
- IS-IS
- MPLS (LDP, RSVP-TE)

## 🛠 Prerequisites

To run these labs, you will need:

- **[netlab](https://netlab.tools/):** Version 25+
- Virtualization Provider: Docker.
- Juniper Images: vMX or vJunos-router.

## Tutorial

Coming soon!

# Notes
Config on each lab pulled from device using `get_junos_config.sh`.

## netlab Defaults

Labs that use netlab's `isis` or `bgp` modules get the settings below unless the topology overrides them. Source: [IS-IS module](https://netlab.tools/module/isis/), [BGP module](https://netlab.tools/module/bgp/).

### Module selection

- A module in the top-level `module:` list is enabled on every node.
- A node-level `module:` **replaces** the global list for that node. For example, `module: [ vlan ]` on a node turns IS-IS and BGP off for that node.

### IS-IS

| Setting | Default | Override |
|---|---|---|
| Area | `49.0001` | `isis.area: "49.0002"` (quote it, or YAML reads it as a float) |
| Level | `level-2` | `isis.type: level-1` / `level-1-2` |
| NET | area + system ID from node `id` + `.00`, e.g. `49.0001.0000.0000.0010.00` for id 10 | node `isis.net` |
| Enabled on | all intra-AS interfaces with an IP address (including routed VLAN subinterfaces); not on EBGP or management interfaces | link/interface `isis: False` |
| Passive | loopback, stub links, links with a single router, `role: passive` | interface `isis.passive: true` |
| Network type | `point-to-point` when the interface has exactly one neighbor | link `isis.network_type` |
| Metrics | wide (cannot be disabled) | link `isis.metric` / `isis.cost` |
| IPv6 | multi-topology, enabled automatically when the node has IPv6 addresses | n/a |
| BFD | off | `isis.bfd: true` |

### BGP

| Setting | Default | Override |
|---|---|---|
| IBGP topology | full mesh; with `bgp.rr: true` on a node, RR clients peer only with the RRs | node `bgp.rr`, `bgp.rr_mesh` |
| IBGP source | loopback (needs an IGP to reach the other loopbacks) | n/a |
| Next-hop-self | on for IBGP | node `bgp.next_hop_self` |
| Router ID | loopback IPv4 address | node `bgp.router_id` |
| RR cluster ID | lowest router ID of the RRs in the AS | node `bgp.rr_cluster_id` |
| Address families | IPv4/IPv6 unicast, whichever the node has addresses for | n/a |
| Advertised prefixes | loopback | `bgp.advertise_loopback: false` |
| Communities | standard + extended to IBGP, standard to EBGP | `bgp.community` |
| Authentication | none; on Junos, `bgp.password` (MD5) works but `bgp.tcp_ao` is not supported | `bgp.session` plugin |

### Inspecting what netlab will configure

```bash
netlab create                           # build the data model, no lab started
netlab inspect --node vr1 isis
netlab inspect --node vr1 bgp
netlab inspect --node vr1 interfaces
```

