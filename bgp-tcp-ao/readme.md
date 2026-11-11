# BGP Authentication (TCP-AO)

# Diagram

```
  +-------------------------------------------------------------+
  |  BGP AS 65000 (iBGP, vRR = route reflector)                 |
  |  IS-IS area 49.0001, level-2 only                           |
  |                                                             |
  |                vRR (vr10, 172.16.0.10)                      |
  |               /  ge-0/0/8.206  ge-0/0/9.207 \               |
  |              /                               \              |
  |       vR1 (172.16.0.1) ----------------- vR2 (172.16.0.2)   |
  |                             ge-0/0/0                        |           
  |                                                             |
  +-------------------------------------------------------------+
```
Brings up IS-IS and iBGP (AS 65000) with vRR reflecting to vR1 and vR2. The sessions start **without** authentication.

```
cd junoslab/bgp-tcp-ao
netlab up --plugin multilab -s defaults.multilab.id=12
```

# Tasks

1. Secure vRR <-> vR1/vR2 sessions with TCP MD5 (`authentication-key`).

2. Migrate vRR <-> vR1 sessions from MD5 to TCP Authentication Option (RFC 5925) using key chain.

3. Add a key (`send-id 2` / `recv-id 2`) with `start-time` a few minutes in the future. Confirm key rolls over hitlessly: the BGP session stays up and the flap count does not increase.

4. Shut down vR1 `ge-0/0/8` and confirm that the authenticated session to vRR stays up over vR2.

> [!Verification]
```
show bgp neighbor | match "Authentication|State"
show bgp neighbor 172.16.0.1 | match "Authentication|State|Flap"
show security keychain detail
show system statistics tcp | match auth
```
> [!Answer]
Replace 12 with the actual multilab number.

```
bash ../scripts/get_junos_config.sh 12 end vrr
bash ../scripts/get_junos_config.sh 12 end 1
bash ../scripts/get_junos_config.sh 12 end 2
```