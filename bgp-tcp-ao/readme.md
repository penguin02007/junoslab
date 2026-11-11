# BGP Authentication (TCP-AO)

```
            vRR (vr10, 172.16.0.10)
           /  ge-0/0/8.206  ge-0/0/9.207 \
          /                               \
   vR1 (172.16.0.1) ---- ge-0/0/0 ---- vR2 (172.16.0.2)
```

Brings up IS-IS and an iBGP (AS 65000) with vRR reflecting to vR1 and vR2. The sessions start **without** authentication.

```
netlab up
```

# Tasks

1. Secure vRR <-> vR1/vR2 sessions with TCP MD5 (`authentication-key`).

2. Migrate sessions from MD5 to TCP Authentication Option (RFC 5925) using key chain.

3. Change vR2 to `hmac-sha-1-96` and confirm that the session does not come up. Find the log message that shows why.

4. Add a second key (`send-id 2` / `recv-id 2`) with a `start-time` a few minutes in the future. Confirm that the key rolls over hitlessly: the BGP session stays up and the flap count does not increase.

5. Shut down vR1 `ge-0/0/8` and confirm that the authenticated session to vRR stays up over vR2.

> [!Verification]
```
show bgp neighbor | match "Authentication|State"
show bgp neighbor 172.16.0.1 | match "Authentication|State|Flap"
show security keychain detail
show system statistics tcp | match auth
```
> [!Tips]
> Junos key chain skeleton:
```
set security authentication-key-chains key-chain BGP-AO key 0 secret <secret>
set security authentication-key-chains key-chain BGP-AO key 0 start-time "2026-1-1.00:00:00 +0000"
set security authentication-key-chains key-chain BGP-AO key 0 algorithm ao
set security authentication-key-chains key-chain BGP-AO key 0 ao-attribute send-id 1 recv-id 1
set security authentication-key-chains key-chain BGP-AO key 0 ao-attribute tcp-ao-option enabled
set security authentication-key-chains key-chain BGP-AO key 0 ao-attribute cryptographic-algorithm aes-128-cmac-96
set protocols bgp group <group> authentication-algorithm ao
set protocols bgp group <group> authentication-key-chain BGP-AO
```