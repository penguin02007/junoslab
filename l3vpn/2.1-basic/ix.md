## Table of Contents
- [1. Overview](#1-overview)
- [2. Configuration](#2-configuration)
  - [2.1 Define Local Rib-In](#21-define-local-rib-in)
  - [2.2 Export Policies](#22-export-policies)
  - [2.3 eBGP Peer](#23-ebgp-peer)
 
## 1. Overview
This tutorial demonstrate how to construct a dedicated **Route Generator (Injector)** using Junos OS to broadcast an internet snapshot . This recreate attribute such as MED, mixed AS paths, and distinct BGP Origin.

## 2. Configuration
Define Local Rib-In.

### 2.1 Define Local Rib-In
```
top
edit routing-options static
set route 19.103.96.0/20 discard
set route 20.67.16.0/20 discard
set route 22.32.0.0/11 discard
set route 22.208.0.0/12 discard
set route 23.0.128.0/18 discard
set route 24.16.0.0/12 discard
set route 24.32.0.0/13 discard
set route 24.192.0.0/10 discard
set route 24.218.144.0/21 discard
set route 25.127.80.0/21 discard
set route 26.160.0.0/11 discard
set route 27.16.0.0/13 discard
set route 27.96.0.0/12 discard
set route 27.207.31.0/24 discard
set route 28.4.0.0/15 discard
set route 28.16.0.0/13 discard
set route 28.30.64.0/18 discard
set route 28.32.0.0/11 discard
set route 28.214.0.0/17 discard
set route 29.52.176.0/21 discard
set route 30.0.0.0/8 discard
set route 30.125.128.0/17 discard
set route 30.128.0.0/10 discard
set route 31.46.0.0/15 discard
set route 31.48.32.0/19 discard
set route 31.122.19.0/24 discard
set route 31.172.0.0/16 discard
set route 31.211.128.0/18 discard
set route 32.223.112.0/20 discard
set route 33.4.136.0/21 discard
set route 34.48.0.0/12 discard
set route 34.48.0.0/13 discard
set route 35.160.0.0/11 discard
set route 35.184.128.0/17 discard
set route 36.38.174.0/24 discard
set route 36.48.128.0/18 discard
set route 36.194.0.0/16 discard
set route 37.0.0.0/8 discard
set route 38.73.0.0/16 discard
set route 38.198.64.0/20 discard
set route 39.0.0.0/9 discard
set route 39.80.64.0/18 discard
set route 40.32.0.0/13 discard
set route 40.118.56.0/21 discard
set route 40.158.0.0/18 discard
set route 40.208.0.0/15 discard
set route 42.121.96.0/19 discard
set route 43.76.112.0/21 discard
set route 44.102.212.0/23 discard
set route 44.110.104.0/23 discard
set route 46.20.0.0/14 discard
set route 46.36.176.0/21 discard
set route 46.84.96.0/19 discard
set route 46.118.104.0/21 discard
set route 46.182.216.0/21 discard
set route 47.0.0.0/8 discard
set route 47.148.0.0/17 discard
set route 48.72.0.0/14 discard
set route 49.178.152.0/21 discard
set route 50.80.0.0/12 discard
set route 50.88.0.0/15 discard
set route 50.206.8.0/21 discard
set route 52.88.0.0/13 discard
set route 52.90.137.0/24 discard
set route 52.128.0.0/9 discard
set route 52.192.0.0/12 discard
set route 53.125.0.0/16 discard
set route 54.133.140.0/22 discard
set route 55.128.0.0/9 discard
set route 55.128.0.0/10 discard
set route 56.128.0.0/11 discard
set route 56.155.80.0/21 discard
set route 56.220.0.0/14 discard
set route 57.0.0.0/9 discard
set route 59.80.0.0/12 discard
set route 60.80.0.0/12 discard
set route 60.128.0.0/9 discard
set route 61.116.94.0/24 discard
set route 63.46.201.0/24 discard
set route 64.0.0.0/9 discard
set route 65.0.0.0/9 discard
set route 65.112.0.0/12 discard
set route 66.196.0.0/15 discard
set route 67.16.0.0/13 discard
set route 69.0.0.0/8 discard
set route 69.199.193.0/24 discard
set route 70.0.0.0/9 discard
set route 70.106.0.0/16 discard
set route 71.0.0.0/8 discard
set route 71.37.120.0/22 discard
set route 71.101.0.0/17 discard
set route 73.148.212.0/22 discard
set route 74.32.0.0/11 discard
set route 75.9.64.0/19 discard
set route 75.144.0.0/15 discard
set route 76.0.0.0/8 discard
set route 76.0.0.0/11 discard
set route 76.48.0.0/12 discard
set route 76.113.0.0/22 discard
set route 76.130.0.0/15 discard
set route 76.199.116.0/22 discard
set route 77.12.0.0/14 discard
set route 78.32.0.0/11 discard
set route 78.84.0.0/15 discard
set route 79.0.0.0/8 discard
set route 79.20.128.0/19 discard
set route 79.32.0.0/12 discard
set route 79.46.0.0/16 discard
set route 80.0.0.0/10 discard
set route 80.1.0.0/19 discard
set route 80.43.124.0/22 discard
set route 80.46.0.0/15 discard
set route 81.0.0.0/8 discard
set route 82.68.0.0/14 discard
set route 82.149.136.0/22 discard
set route 83.0.0.0/11 discard
set route 83.8.0.0/13 discard
set route 83.20.128.0/17 discard
set route 84.98.0.0/16 discard
set route 84.122.0.0/15 discard
set route 86.61.0.0/19 discard
set route 86.128.0.0/9 discard
set route 87.13.64.0/18 discard
set route 87.136.0.0/15 discard
set route 87.192.0.0/10 discard
set route 89.64.0.0/13 discard
set route 89.88.0.0/13 discard
set route 90.211.68.0/23 discard
set route 91.0.0.0/8 discard
set route 91.128.0.0/9 discard
set route 92.148.128.0/18 discard
set route 94.0.0.0/10 discard
set route 94.64.0.0/10 discard
set route 94.128.0.0/9 discard
set route 97.60.16.0/20 discard
set route 98.19.128.0/17 discard
set route 98.92.0.0/14 discard
set route 98.212.100.0/22 discard
set route 99.153.140.0/22 discard
set route 100.160.0.0/11 discard
set route 101.0.0.0/8 discard
set route 101.0.0.0/11 discard
set route 101.188.148.0/23 discard
set route 102.217.128.0/17 discard
set route 103.0.0.0/10 discard
set route 103.6.162.0/23 discard
set route 103.64.0.0/15 discard
set route 103.131.136.0/21 discard
set route 103.132.0.0/16 discard
set route 104.24.0.0/19 discard
set route 104.192.0.0/11 discard
set route 104.192.0.0/18 discard
set route 105.113.70.0/23 discard
set route 106.160.0.0/11 discard
set route 107.112.0.0/12 discard
set route 107.158.0.0/15 discard
set route 107.216.0.0/13 discard
set route 109.15.160.0/19 discard
set route 109.206.64.0/20 discard
set route 110.50.60.0/24 discard
set route 111.39.208.0/20 discard
set route 111.152.0.0/14 discard
set route 113.96.0.0/11 discard
set route 113.197.43.0/24 discard
set route 114.50.64.0/22 discard
set route 115.40.0.0/13 discard
set route 115.127.2.0/23 discard
set route 115.195.32.0/19 discard
set route 116.129.128.0/17 discard
set route 117.104.0.0/15 discard
set route 121.128.160.0/19 discard
set route 122.120.0.0/16 discard
set route 122.151.128.0/17 discard
set route 122.185.104.0/22 discard
set route 123.184.42.0/23 discard
set route 125.39.176.0/20 discard
set route 125.163.128.0/17 discard
set route 126.96.0.0/13 discard
set route 126.128.0.0/9 discard
set route 128.80.0.0/12 discard
set route 129.0.0.0/8 discard
set route 129.32.0.0/11 discard
set route 129.123.198.0/23 discard
set route 129.152.0.0/13 discard
set route 130.51.198.0/23 discard
set route 132.60.200.0/21 discard
set route 132.168.0.0/14 discard
set route 132.174.156.0/22 discard
set route 133.0.0.0/8 discard
set route 133.47.0.0/16 discard
set route 133.90.192.0/18 discard
set route 134.104.176.0/20 discard
set route 134.112.0.0/15 discard
set route 135.56.0.0/14 discard
set route 135.64.0.0/11 discard
set route 137.35.0.0/16 discard
set route 138.78.128.0/18 discard
set route 138.207.192.0/21 discard
set route 139.24.0.0/14 discard
set route 140.64.0.0/12 discard
set route 140.146.80.0/20 discard
set route 140.156.160.0/21 discard
set route 141.0.0.0/8 discard
set route 142.96.0.0/11 discard
set route 142.155.192.0/20 discard
set route 142.180.0.0/15 discard
set route 142.193.0.0/20 discard
set route 142.220.0.0/14 discard
set route 143.0.0.0/8 discard
set route 143.109.16.0/21 discard
set route 143.139.160.0/19 discard
set route 143.190.156.0/22 discard
set route 144.0.0.0/9 discard
set route 145.85.192.0/18 discard
set route 147.148.64.0/20 discard
set route 148.0.0.0/8 discard
set route 148.0.0.0/9 discard
set route 148.11.192.0/18 discard
set route 148.79.176.0/21 discard
set route 149.0.0.0/9 discard
set route 149.160.0.0/13 discard
set route 149.171.214.0/24 discard
set route 150.66.218.0/24 discard
set route 150.89.0.0/16 discard
set route 150.187.2.0/23 discard
set route 151.170.64.0/18 discard
set route 151.183.0.0/16 discard
set route 152.30.136.0/22 discard
set route 152.97.64.0/18 discard
set route 153.174.0.0/15 discard
set route 153.203.158.0/24 discard
set route 154.83.0.0/18 discard
set route 154.128.0.0/9 discard
set route 154.168.0.0/13 discard
set route 156.96.0.0/12 discard
set route 156.176.188.0/22 discard
set route 156.204.0.0/14 discard
set route 157.128.0.0/9 discard
set route 159.41.128.0/22 discard
set route 160.223.0.0/16 discard
set route 161.33.0.0/16 discard
set route 161.92.0.0/14 discard
set route 161.103.146.0/23 discard
set route 161.128.0.0/10 discard
set route 162.8.0.0/13 discard
set route 162.173.0.0/19 discard
set route 163.40.0.0/14 discard
set route 163.61.128.0/20 discard
set route 163.64.0.0/14 discard
set route 164.0.0.0/8 discard
set route 164.0.0.0/9 discard
set route 164.188.192.0/18 discard
set route 164.207.0.0/19 discard
set route 164.211.16.0/22 discard
set route 166.103.86.0/23 discard
set route 166.192.0.0/13 discard
set route 167.184.222.0/24 discard
set route 168.0.0.0/8 discard
set route 168.75.192.0/18 discard
set route 168.128.0.0/11 discard
set route 168.160.0.0/14 discard
set route 168.214.18.0/24 discard
set route 169.4.32.0/19 discard
set route 169.98.104.0/23 discard
set route 169.160.0.0/11 discard
set route 169.200.129.0/24 discard
set route 170.0.0.0/9 discard
set route 170.178.160.0/21 discard
set route 171.0.0.0/10 discard
set route 171.80.0.0/12 discard
set route 172.17.0.0/24 discard
set route 172.17.1.0/24 discard
set route 172.17.2.0/24 discard
set route 172.17.3.0/24 discard
set route 172.17.4.0/24 discard
set route 172.17.5.0/24 discard
set route 172.17.6.0/24 discard
set route 172.17.7.0/24 discard
set route 172.17.8.0/24 discard
set route 172.17.9.0/24 discard
set route 172.17.10.0/24 discard
set route 172.17.11.0/24 discard
set route 172.17.12.0/24 discard
set route 172.17.13.0/24 discard
set route 172.17.14.0/24 discard
set route 172.17.15.0/24 discard
set route 172.58.32.0/19 discard
set route 172.128.0.0/13 discard
set route 172.128.0.0/14 discard
set route 172.160.0.0/12 discard
set route 173.2.0.0/16 discard
set route 174.164.0.0/14 discard
set route 175.129.128.0/17 discard
set route 175.132.160.0/20 discard
set route 175.135.96.0/21 discard
set route 176.0.0.0/8 discard
set route 177.180.0.0/14 discard
set route 178.128.0.0/9 discard
set route 178.128.0.0/10 discard
set route 178.190.192.0/18 discard
set route 178.193.0.0/16 discard
set route 179.48.0.0/12 discard
set route 182.128.0.0/9 discard
set route 182.159.96.0/20 discard
set route 183.40.0.0/17 discard
set route 184.64.152.0/21 discard
set route 185.0.0.0/10 discard
set route 185.187.114.0/24 discard
set route 186.3.32.0/21 discard
set route 187.0.0.0/8 discard
set route 187.32.0.0/12 discard
set route 187.44.101.0/24 discard
set route 188.32.0.0/11 discard
set route 189.18.28.0/22 discard
set route 189.192.0.0/12 discard
set route 190.47.128.0/17 discard
set route 190.56.32.0/19 discard
set route 190.192.0.0/12 discard
set route 191.8.0.0/16 discard
set route 191.146.0.0/17 discard
set route 191.152.0.0/14 discard
set route 192.0.0.0/9 discard
set route 197.0.0.0/10 discard
set route 197.60.0.0/14 discard
set route 197.64.0.0/10 discard
set route 197.128.0.0/9 discard
set route 198.3.44.0/23 discard
set route 198.83.134.0/23 discard
set route 200.128.0.0/9 discard
set route 200.210.0.0/15 discard
set route 202.0.0.0/8 discard
set route 202.204.0.0/16 discard
set route 203.84.172.0/22 discard
set route 205.0.0.0/8 discard
set route 205.136.0.0/13 discard
set route 206.126.160.0/19 discard
set route 206.128.0.0/11 discard
set route 206.168.0.0/13 discard
set route 207.102.0.0/17 discard
set route 207.124.0.0/16 discard
set route 208.0.0.0/8 discard
set route 208.52.0.0/14 discard
set route 208.96.0.0/12 discard
set route 208.183.0.0/16 discard
set route 209.39.68.0/22 discard
set route 210.70.172.0/23 discard
set route 212.0.0.0/9 discard
set route 212.207.0.0/16 discard
set route 213.38.128.0/18 discard
set route 213.152.96.0/19 discard
set route 214.192.0.0/12 discard
set route 215.113.2.0/23 discard
set route 215.128.0.0/9 discard
set route 215.215.0.0/18 discard
set route 217.32.0.0/11 discard
set route 217.63.20.0/22 discard
set route 217.128.0.0/9 discard
set route 218.160.0.0/11 discard
set route 219.0.0.0/8 discard
set route 219.0.0.0/9 discard
set route 219.198.180.0/22 discard
set route 220.26.0.0/15 discard
set route 221.96.0.0/12 discard
set route 222.99.79.0/24 discard
set route 223.151.0.0/16 discard
set route 223.160.0.0/11 discard
```
### 2.2 Export policies
```
top
edit policy-options policy-statement INJECT_INTERNET
# Baseline rule: Match everything, set MED (Metric), set default origin code to IGP
set term BASELINE from protocol static
set term BASELINE then metric 1620
set term BASELINE then origin igp
set term BASELINE then next term

# Group A: Standard IGP paths with AS prepends
set term AS_19_103 from route-filter 19.103.96.0/20 exact
set term AS_19_103 then as-path-prepend "61671 5697 21326"
set term AS_19_103 then accept

set term AS_20_67 from route-filter 20.67.16.0/20 exact
set term AS_20_67 then as-path-prepend "33003 62186 17952 53145"
set term AS_20_67 then accept

set term AS_22_32 from route-filter 22.32.0.0/11 exact
set term AS_22_32 then as-path-prepend "33112"
set term AS_22_32 then accept

set term AS_22_208 from route-filter 22.208.0.0/12 exact
set term AS_22_208 then as-path-prepend "61671 62186 16731 58642 522"
set term AS_22_208 then accept

set term AS_23_0 from route-filter 23.0.128.0/18 exact
set term AS_23_0 then as-path-prepend "61671 49129 1712 40326 7733 17878 25030 58803"
set term AS_23_0 then accept

set term AS_24_16 from route-filter 24.16.0.0/12 exact
set term AS_24_16 then as-path-prepend "33003 52411 32845 32819 37602 4065"
set term AS_24_16 then accept

set term AS_24_32 from route-filter 24.32.0.0/13 exact
set term AS_24_32 then as-path-prepend "110047427 36024"
set term AS_24_32 then accept

set term AS_24_192 from route-filter 24.192.0.0/10 exact
set term AS_24_192 then as-path-prepend "61671 27075 24452 46474 59220 16466 31908"
set term AS_24_192 then accept

set term AS_24_218 from route-filter 24.218.144.0/21 exact
set term AS_24_218 then as-path-prepend "33112 52411 21239 29454 30608 14977"
set term AS_24_218 then accept

# Group B: Incomplete Origin Paths (?)
set term AS_25_127 from route-filter 25.127.80.0/21 exact
set term AS_25_127 then as-path-prepend "33003 49129"
set term AS_25_127 then origin incomplete
set term AS_25_127 then accept

set term AS_27_16 from route-filter 27.16.0.0/13 exact
set term AS_27_16 then as-path-prepend "33003 52411 9290 2732"
set term AS_27_16 then origin incomplete
set term AS_27_16 then accept

set term AS_27_96 from route-filter 27.96.0.0/12 exact
set term AS_27_96 then as-path-prepend "33112 28515 31772 30344 52514 11085 38470 51088"
set term AS_27_96 then origin incomplete
set term AS_27_96 then accept

set term AS_27_207 from route-filter 27.207.31.0/24 exact
set term AS_27_207 then as-path-prepend "33112 30404 3073 53716 6736"
set term AS_27_207 then origin incomplete
set term AS_27_207 then accept

set term AS_28_4 from route-filter 28.4.0.0/15 exact
set term AS_28_4 then as-path-prepend "33003"
set term AS_28_4 then origin incomplete
set term AS_28_4 then accept

set term AS_28_16 from route-filter 28.16.0.0/13 exact
set term AS_28_16 then as-path-prepend "33112 5697 16309 47366 9859 63454"
set term AS_28_16 then origin incomplete
set term AS_28_16 then accept

set term AS_28_30 from route-filter 28.30.64.0/18 exact
set term AS_28_30 then as-path-prepend "33003"
set term AS_28_30 then accept

set term AS_28_32 from route-filter 28.32.0.0/11 exact
set term AS_28_32 then as-path-prepend "33003 27075 28995 5160 53937 26028 52077"
set term AS_28_32 then accept

set term AS_28_214 from route-filter 28.214.0.0/17 exact
set term AS_28_214 then as-path-prepend "61671 60177 64382 20438 6292 3002 3676"
set term AS_28_214 then accept

set term AS_29_52 from route-filter 29.52.176.0/21 exact
set term AS_29_52 then as-path-prepend "110047427 36024 37067 44298"
set term AS_29_52 then accept

set term AS_30_0 from route-filter 30.0.0.0/8 exact
set term AS_30_0 then as-path-prepend "33112 5697 24614 21847"
set term AS_30_0 then accept

set term AS_30_125 from route-filter 30.125.128.0/17 exact
set term AS_30_125 then as-path-prepend "61671 30404"
set term AS_30_125 then accept

set term AS_30_128 from route-filter 30.128.0.0/10 exact
set term AS_30_128 then as-path-prepend "110047427 56422 37067 60268 48244 42901 7711 52092"
set term AS_30_128 then accept

set term AS_31_46 from route-filter 31.46.0.0/15 exact
set term AS_31_46 then as-path-prepend "61671 63164 41352"
set term AS_31_46 then accept

set term AS_31_48 from route-filter 31.48.32.0/19 exact
set term AS_31_48 then as-path-prepend "33003 28515"
set term AS_31_48 then accept

set term AS_31_122 from route-filter 31.122.19.0/24 exact
set term AS_31_122 then as-path-prepend "61671 28515 6385"
set term AS_31_122 then accept

set term AS_31_172 from route-filter 31.172.0.0/16 exact
set term AS_31_172 then as-path-prepend "33112 27075 27917 58105"
set term AS_31_172 then accept

set term AS_31_211 from route-filter 31.211.128.0/18 exact
set term AS_31_211 then as-path-prepend "61671 63164"
set term AS_31_211 then accept

set term AS_32_223 from route-filter 32.223.112.0/20 exact
set term AS_32_223 then as-path-prepend "33112 36621 16637 48886 6118 13375 3402 3035"
set term AS_32_223 then accept

set term AS_33_4 from route-filter 33.4.136.0/21 exact
set term AS_33_4 then as-path-prepend "33003 41164 35834 15077 23304"
set term AS_33_4 then accept

set term AS_34_48_12 from route-filter 34.48.0.0/12 exact
set term AS_34_48_12 then as-path-prepend "33112 41164 64358 32041 26374"
set term AS_34_48_12 then accept

set term AS_34_48_13 from route-filter 34.48.0.0/13 exact
set term AS_34_48_13 then as-path-prepend "110047427 56422 50292 54928 40494 51020 17650 16353"
set term AS_34_48_13 then origin incomplete
set term AS_34_48_13 then accept

set term AS_35_160 from route-filter 35.160.0.0/11 exact
set term AS_35_160 then as-path-prepend "33003 28515 13255 33039 28122 18057 20944"
set term AS_35_160 then accept

set term AS_35_184 from route-filter 35.184.128.0/17 exact
set term AS_35_184 then as-path-prepend "33003 49129 36217 33359 44994 52357"
set term AS_35_184 then accept

set term AS_36_38 from route-filter 36.38.174.0/24 exact
set term AS_36_38 then as-path-prepend "61671 60177 12070 55406 60096 29414"
set term AS_36_38 then accept

set term AS_36_48 from route-filter 36.48.128.0/18 exact
set term AS_36_48 then as-path-prepend "61671 52411"
set term AS_36_48 then accept

set term AS_36_194 from route-filter 36.194.0.0/16 exact
set term AS_36_194 then as-path-prepend "61671 52411 25561 53536"
set term AS_36_194 then accept

set term AS_37_0 from route-filter 37.0.0.0/8 exact
set term AS_37_0 then as-path-prepend "110047427 36024 47123 34660 10891 17102"
set term AS_37_0 then origin incomplete
set term AS_37_0 then accept

set term AS_38_73 from route-filter 38.73.0.0/16 exact
set term AS_38_73 then as-path-prepend "33112 63164 33651 29843 7939 39377 18658"
set term AS_38_73 then accept

set term AS_38_198 from route-filter 38.198.64.0/20 exact
set term AS_38_198 then as-path-prepend "33003 49129 51492 32856"
set term AS_38_198 then accept

set term AS_39_0 from route-filter 39.0.0.0/9 exact
set term AS_39_0 then as-path-prepend "33003 52411 25214 29611 21356 17104 27134 15287"
set term AS_39_0 then origin incomplete
set term AS_39_0 then accept

set term AS_39_80 from route-filter 39.80.64.0/18 exact
set term AS_39_80 then as-path-prepend "61671 63164 62006"
set term AS_39_80 then accept

set term AS_40_32 from route-filter 40.32.0.0/13 exact
set term AS_40_32 then as-path-prepend "33112 22508 53911"
set term AS_40_32 then accept

set term AS_40_118 from route-filter 40.118.56.0/21 exact
set term AS_40_118 then as-path-prepend "33003 41164 60535"
set term AS_40_118 then accept

set term AS_40_158 from route-filter 40.158.0.0/18 exact
set term AS_40_158 then as-path-prepend "110047427 56422 50292 35823 44473"
set term AS_40_158 then accept

set term AS_40_208 from route-filter 40.208.0.0/15 exact
set term AS_40_208 then as-path-prepend "33003 28515 49763 27898 47304 47538 26901 6086"
set term AS_40_208 then accept

set term AS_42_121 from route-filter 42.121.96.0/19 exact
set term AS_42_121 then as-path-prepend "33003 49129"
set term AS_42_121 then accept

set term AS_43_76 from route-filter 43.76.112.0/21 exact
set term AS_43_76 then as-path-prepend "33112 28515 30053 57115 31458 8340 60342"
set term AS_43_76 then accept

set term AS_44_102 from route-filter 44.102.212.0/23 exact
set term AS_44_102 then as-path-prepend "33003 27075 36887 8698 21242 16396"
set term AS_44_102 then accept

set term AS_44_110 from route-filter 44.110.104.0/23 exact
set term AS_44_110 then as-path-prepend "33003 60177"
set term AS_44_110 then accept

set term AS_46_20 from route-filter 46.20.0.0/14 exact
set term AS_46_20 then as-path-prepend "33112 49129 51521"
set term AS_46_20 then origin incomplete
set term AS_46_20 then accept

set term AS_46_36 from route-filter 46.36.176.0/21 exact
set term AS_46_36 then as-path-prepend "61671 52411 64333 44013 43197 43321 6648"
set term AS_46_36 then accept

set term AS_46_84 from route-filter 46.84.96.0/19 exact
set term AS_46_84 then as-path-prepend "33003 28515 38168 6965 25581 61442 5339"
set term AS_46_84 then accept

set term AS_46_118 from route-filter 46.118.104.0/21 exact
set term AS_46_118 then as-path-prepend "33003 52411"
set term AS_46_118 then origin incomplete
set term AS_46_118 then accept

set term AS_46_182 from route-filter 46.182.216.0/21 exact
set term AS_46_182 then as-path-prepend "110047427 56422 47123 34264 30006 56068 12628 57545 13379"
set term AS_46_182 then origin incomplete
set term AS_46_182 then accept

set term AS_47_0 from route-filter 47.0.0.0/8 exact
set term AS_47_0 then as-path-prepend "61671"
set term AS_47_0 then accept

set term AS_47_148 from route-filter 47.148.0.0/17 exact
set term AS_47_148 then as-path-prepend "61671 5697 34877 26290"
set term AS_47_148 then accept

set term AS_48_72 from route-filter 48.72.0.0/14 exact
set term AS_48_72 then as-path-prepend "33003 41164 64061 22465 53713 17343 5617"
set term AS_48_72 then accept

set term AS_49_178 from route-filter 49.178.152.0/21 exact
set term AS_49_178 then as-path-prepend "110047427 36024 50292 18566"
set term AS_49_178 then accept

set term AS_50_80 from route-filter 50.80.0.0/12 exact
set term AS_50_80 then as-path-prepend "33112 30404 61320 28432"
set term AS_50_80 then accept

set term AS_50_88 from route-filter 50.88.0.0/15 exact
set term AS_50_88 then as-path-prepend "61671 30404 42039 11931 43964 48898 62582"
set term AS_50_88 then accept

set term AS_50_206 from route-filter 50.206.8.0/21 exact
set term AS_50_206 then as-path-prepend "110047427 56422 50292 12096 37678"
set term AS_50_206 then accept

set term AS_52_88 from route-filter 52.88.0.0/13 exact
set term AS_52_88 then as-path-prepend "33003 60177 8283 30198 2621"
set term AS_52_88 then accept

set term AS_52_90 from route-filter 52.90.137.0/24 exact
set term AS_52_90 then origin incomplete
set term AS_52_90 then accept

set term AS_52_128 from route-filter 52.128.0.0/9 exact
set term AS_52_128 then as-path-prepend "61671 49129 29945 31710 49401 45588 43747 6634"
set term AS_52_128 then accept

set term AS_52_192 from route-filter 52.192.0.0/12 exact
set term AS_52_192 then as-path-prepend "61671 49129 52765 41865"
set term AS_52_192 then accept

set term AS_53_125 from route-filter 53.125.0.0/16 exact
set term AS_53_125 then as-path-prepend "33112 22508"
set term AS_53_125 then accept

set term AS_54_133 from route-filter 54.133.140.0/22 exact
set term AS_54_133 then as-path-prepend "33003 62186 24242"
set term AS_54_133 then origin incomplete
set term AS_54_133 then accept

set term AS_55_128_9 from route-filter 55.128.0.0/9 exact
set term AS_55_128_9 then as-path-prepend "33112 30404 27233 56342 31395"
set term AS_55_128_9 then accept

set term AS_55_128_10 from route-filter 55.128.0.0/10 exact
set term AS_55_128_10 then as-path-prepend "33003 36621 11550"
set term AS_55_128_10 then accept

set term AS_56_128 from route-filter 56.128.0.0/11 exact
set term AS_56_128 then as-path-prepend "110047427 36024 7923 57890 11603 60747 37602"
set term AS_56_128 then accept

set term AS_56_155 from route-filter 56.155.80.0/21 exact
set term AS_56_155 then as-path-prepend "110047427 36024 47123 6612 15655 30637"
set term AS_56_155 then accept

set term AS_56_220 from route-filter 56.220.0.0/14 exact
set term AS_56_220 then as-path-prepend "33112 52411 23618 16644"
set term AS_56_220 then accept

set term AS_57_0 from route-filter 57.0.0.0/9 exact
set term AS_57_0 then as-path-prepend "33003 27075 51537 53090 55749 414"
set term AS_57_0 then accept

set term AS_59_80 from route-filter 59.80.0.0/12 exact
set term AS_59_80 then as-path-prepend "61671 36621 27127 16104 22971 14669 26593"
set term AS_59_80 then accept

set term AS_60_80 from route-filter 60.80.0.0/12 exact
set term AS_60_80 then accept

set term AS_60_128 from route-filter 60.128.0.0/9 exact
set term AS_60_128 then as-path-prepend "110047427 56422 37067 50234"
set term AS_60_128 then accept

set term AS_61_116 from route-filter 61.116.94.0/24 exact
set term AS_61_116 then as-path-prepend "61671 63164 33776 14263 45355 14370"
set term AS_61_116 then accept

set term AS_63_46 from route-filter 63.46.201.0/24 exact
set term AS_63_46 then as-path-prepend "110047427 36024 235 29393 43839 9346"
set term AS_63_46 then accept

set term AS_64_0 from route-filter 64.0.0.0/9 exact
set term AS_64_0 then as-path-prepend "33003 27075 52437"
set term AS_64_0 then accept

set term AS_65_0 from route-filter 65.0.0.0/9 exact
set term AS_65_0 then as-path-prepend "61671 41164 11211 32523 34562 60886 19787 2175"
set term AS_65_0 then accept

set term AS_65_112 from route-filter 65.112.0.0/12 exact
set term AS_65_112 then as-path-prepend "33003 22508 2455 6621"
set term AS_65_112 then accept

set term AS_66_196 from route-filter 66.196.0.0/15 exact
set term AS_66_196 then as-path-prepend "110047427 36024"
set term AS_66_196 then accept

set term AS_67_16 from route-filter 67.16.0.0/13 exact
set term AS_67_16 then as-path-prepend "33003 41164 11385 8456 24246 32965 53700 6590"
set term AS_67_16 then accept

set term AS_69_0 from route-filter 69.0.0.0/8 exact
set term AS_69_0 then as-path-prepend "33003"
set term AS_69_0 then accept

set term AS_69_199 from route-filter 69.199.193.0/24 exact
set term AS_69_199 then as-path-prepend "61671 27075"
set term AS_69_199 then accept

set term AS_70_0 from route-filter 70.0.0.0/9 exact
set term AS_70_0 then as-path-prepend "110047427 56422 235 783 2249 58524 34502 41729 23590"
set term AS_70_0 then accept

set term AS_70_106 from route-filter 70.106.0.0/16 exact
set term AS_70_106 then as-path-prepend "110047427 56422 7923 61279 12558"
set term AS_70_106 then accept

set term AS_71_0 from route-filter 71.0.0.0/8 exact
set term AS_71_0 then as-path-prepend "110047427 56422"
set term AS_71_0 then accept

set term AS_71_37 from route-filter 71.37.120.0/22 exact
set term AS_71_37 then as-path-prepend "33003 5697 13908 45796 25366 45303 35621 47780"
set term AS_71_37 then accept

set term AS_71_101 from route-filter 71.101.0.0/17 exact
set term AS_71_101 then as-path-prepend "33112 52411 31063 34505 11347 60051"
set term AS_71_101 then accept

set term AS_73_148 from route-filter 73.148.212.0/22 exact
set term AS_73_148 then as-path-prepend "33003"
set term AS_73_148 then accept

set term AS_74_32 from route-filter 74.32.0.0/11 exact
set term AS_74_32 then as-path-prepend "33112 27075 54870 36773 794 10670"
set term AS_74_32 then origin incomplete
set term AS_74_32 then accept

set term AS_75_9 from route-filter 75.9.64.0/19 exact
set term AS_75_9 then as-path-prepend "33003 60177"
set term AS_75_9 then origin incomplete
set term AS_75_9 then accept

set term AS_75_144 from route-filter 75.144.0.0/15 exact
set term AS_75_144 then as-path-prepend "33112 5697 13607 51002 11508 54483"
set term AS_75_144 then accept

set term AS_76_0_8 from route-filter 76.0.0.0/8 exact
set term AS_76_0_8 then as-path-prepend "110047427 56422 235 49012 24118 50330 41594 26349 37726"
set term AS_76_0_8 then accept

set term AS_76_0_11 from route-filter 76.0.0.0/11 exact
set term AS_76_0_11 then as-path-prepend "110047427 56422 47123 64345 26818 33605"
set term AS_76_0_11 then accept

set term AS_76_48 from route-filter 76.48.0.0/12 exact
set term AS_76_48 then as-path-prepend "33112 60177 5037 32401 1078 9850 39463 42575"
set term AS_76_48 then accept

set term AS_76_113 from route-filter 76.113.0.0/22 exact
set term AS_76_113 then as-path-prepend "33003"
set term AS_76_113 then accept

set term AS_76_130 from route-filter 76.130.0.0/15 exact
set term AS_76_130 then as-path-prepend "110047427 56422 47123"
set term AS_76_130 then accept

set term AS_76_199 from route-filter 76.199.116.0/22 exact
set term AS_76_199 then as-path-prepend "61671 52411 37702 15779 5794 57696 4897"
set term AS_76_199 then accept

set term AS_77_12 from route-filter 77.12.0.0/14 exact
set term AS_77_12 then as-path-prepend "33112 22508 5649 26743 20483 62507 18234 2942"
set term AS_77_12 then accept

set term AS_78_32 from route-filter 78.32.0.0/11 exact
set term AS_78_32 then as-path-prepend "33003 30404 22770 40612"
set term AS_78_32 then accept

set term AS_78_84 from route-filter 78.84.0.0/15 exact
set term AS_78_84 then as-path-prepend "61671 5697 63155 32308"
set term AS_78_84 then accept

set term AS_79_0 from route-filter 79.0.0.0/8 exact
set term AS_79_0 then as-path-prepend "61671 62186 2911 48413"
set term AS_79_0 then origin incomplete
set term AS_79_0 then accept

set term AS_79_20 from route-filter 79.20.128.0/19 exact
set term AS_79_20 then accept

set term AS_79_32 from route-filter 79.32.0.0/12 exact
set term AS_79_32 then as-path-prepend "33003 49129 14822"
set term AS_79_32 then accept

set term AS_79_46 from route-filter 79.46.0.0/16 exact
set term AS_79_46 then as-path-prepend "33003 41164"
set term AS_79_46 then origin incomplete
set term AS_79_46 then accept

set term AS_80_0 from route-filter 80.0.0.0/10 exact
set term AS_80_0 then as-path-prepend "33112 30404 14529"
set term AS_80_0 then accept

set term AS_80_1 from route-filter 80.1.0.0/19 exact
set term AS_80_1 then as-path-prepend "33003 36621 37730 21432"
set term AS_80_1 then accept

set term AS_80_43 from route-filter 80.43.124.0/22 exact
set term AS_80_43 then as-path-prepend "33003 63164 51297 16415"
set term AS_80_43 then accept

set term AS_80_46 from route-filter 80.46.0.0/15 exact
set term AS_80_46 then as-path-prepend "33003 22508 39235 30993 45456"
set term AS_80_46 then origin incomplete
set term AS_80_46 then accept

set term AS_81_0 from route-filter 81.0.0.0/8 exact
set term AS_81_0 then as-path-prepend "33003 41164 49064 53199 63154 30767 47257"
set term AS_81_0 then origin incomplete
set term AS_81_0 then accept

set term AS_82_68 from route-filter 82.68.0.0/14 exact
set term AS_82_68 then as-path-prepend "33003 52411"
set term AS_82_68 then accept

set term AS_82_149 from route-filter 82.149.136.0/22 exact
set term AS_82_149 then as-path-prepend "33003 30404"
set term AS_82_149 then origin incomplete
set term AS_82_149 then accept

set term AS_83_0 from route-filter 83.0.0.0/11 exact
set term AS_83_0 then as-path-prepend "33112 63164 15698 64005"
set term AS_83_0 then accept

set term AS_83_8 from route-filter 83.8.0.0/13 exact
set term AS_83_8 then as-path-prepend "33112 62186 55461 47832 50767"
set term AS_83_8 then accept

set term AS_83_20 from route-filter 83.20.128.0/17 exact
set term AS_83_20 then as-path-prepend "33003 41164 14964"
set term AS_83_20 then accept

set term AS_84_98 from route-filter 84.98.0.0/16 exact
set term AS_84_98 then as-path-prepend "33112 62186 36570 2964"
set term AS_84_98 then accept

set term AS_84_122 from route-filter 84.122.0.0/15 exact
set term AS_84_122 then as-path-prepend "33003 52411 36409 7337 63627 10943 23941 40144"
set term AS_84_122 then origin incomplete
set term AS_84_122 then accept

set term AS_86_61 from route-filter 86.61.0.0/19 exact
set term AS_86_61 then as-path-prepend "33003 36621 32895 39595 17862"
set term AS_86_61 then accept

set term AS_86_128 from route-filter 86.128.0.0/9 exact
set term AS_86_128 then as-path-prepend "33112 41164 25588 51334 15139 40219 42827"
set term AS_86_128 then origin incomplete
set term AS_86_128 then accept

set term AS_87_13 from route-filter 87.13.64.0/18 exact
set term AS_87_13 then as-path-prepend "33112 36621 25733 44051 294"
set term AS_87_13 then accept

set term AS_87_136 from route-filter 87.136.0.0/15 exact
set term AS_87_136 then as-path-prepend "33112 27075 41533"
set term AS_87_136 then accept

set term AS_87_192 from route-filter 87.192.0.0/10 exact
set term AS_87_192 then as-path-prepend "33003 5697 50887 31606 26472 63669"
set term AS_87_192 then accept

set term AS_89_64 from route-filter 89.64.0.0/13 exact
set term AS_89_64 then as-path-prepend "33003 22508 11015 27841 12631 51216 64234 60715"
set term AS_89_64 then accept

set term AS_89_88 from route-filter 89.88.0.0/13 exact
set term AS_89_88 then as-path-prepend "33003 60177 28552"
set term AS_89_88 then accept

set term AS_90_211 from route-filter 90.211.68.0/23 exact
set term AS_90_211 then as-path-prepend "33112 60177 53943 58079"
set term AS_90_211 then accept

set term AS_91_0 from route-filter 91.0.0.0/8 exact
set term AS_91_0 then as-path-prepend "110047427 56422 13859 32708 63675 38559 52461"
set term AS_91_0 then accept

set term AS_91_128 from route-filter 91.128.0.0/9 exact
set term AS_91_128 then as-path-prepend "61671 30404 51636 45912 27531 13062 32540 63834"
set term AS_91_128 then accept

set term AS_92_148 from route-filter 92.148.128.0/18 exact
set term AS_92_148 then as-path-prepend "61671 62186 22760 38957 49559 27544 43411"
set term AS_92_148 then accept

set term AS_94_0 from route-filter 94.0.0.0/10 exact
set term AS_94_0 then as-path-prepend "33112 28515 33108 46559 62308 21075"
set term AS_94_0 then accept

set term AS_94_64 from route-filter 94.64.0.0/10 exact
set term AS_94_64 then as-path-prepend "61671 36621 50274 33207 50563 20738 1449 44929"
set term AS_94_64 then accept

set term AS_94_128 from route-filter 94.128.0.0/9 exact
set term AS_94_128 then as-path-prepend "61671 28515 4793 1559 31607 8470"
set term AS_94_128 then accept

set term AS_97_60 from route-filter 97.60.16.0/20 exact
set term AS_97_60 then as-path-prepend "33112 60177 1230 51283 33405 20965 47417"
set term AS_97_60 then accept

set term AS_98_19 from route-filter 98.19.128.0/17 exact
set term AS_98_19 then as-path-prepend "33112 30404 60236 40964"
set term AS_98_19 then origin incomplete
set term AS_98_19 then accept

set term AS_98_92 from route-filter 98.92.0.0/14 exact
set term AS_98_92 then accept

set term AS_98_212 from route-filter 98.212.100.0/22 exact
set term AS_98_212 then as-path-prepend "110047427 36024"
set term AS_98_212 then origin incomplete
set term AS_98_212 then accept

set term AS_99_153 from route-filter 99.153.140.0/22 exact
set term AS_99_153 then as-path-prepend "110047427 56422 47123 14937 62246 32171"
set term AS_99_153 then accept

set term AS_100_160 from route-filter 100.160.0.0/11 exact
set term AS_100_160 then as-path-prepend "33003 36621 849 10873 5067 53950"
set term AS_100_160 then accept

set term AS_101_0_8 from route-filter 101.0.0.0/8 exact
set term AS_101_0_8 then as-path-prepend "61671 63164 37810 12254 18421 44977"
set term AS_101_0_8 then accept

set term AS_101_0_11 from route-filter 101.0.0.0/11 exact
set term AS_101_0_11 then as-path-prepend "33003 27075 15311 11967"
set term AS_101_0_11 then accept

set term AS_101_188 from route-filter 101.188.148.0/23 exact
set term AS_101_188 then as-path-prepend "33112 41164 7408 19797"
set term AS_101_188 then accept

set term AS_102_217 from route-filter 102.217.128.0/17 exact
set term AS_102_217 then as-path-prepend "61671 41164 61968 30307 583"
set term AS_102_217 then accept

set term AS_103_0 from route-filter 103.0.0.0/10 exact
set term AS_103_0 then as-path-prepend "33003 52411 61239 60753 62053 46742 29648"
set term AS_103_0 then accept

set term AS_103_6 from route-filter 103.6.162.0/23 exact
set term AS_103_6 then as-path-prepend "110047427 56422 13859 18632"
set term AS_103_6 then origin incomplete
set term AS_103_6 then accept

set term AS_103_64 from route-filter 103.64.0.0/15 exact
set term AS_103_64 then as-path-prepend "33003 22508 17112 8124 42216 8142"
set term AS_103_64 then accept

set term AS_103_131 from route-filter 103.131.136.0/21 exact
set term AS_103_131 then as-path-prepend "110047427 56422 37067 32262 13997 24894"
set term AS_103_131 then accept

set term AS_103_132 from route-filter 103.132.0.0/16 exact
set term AS_103_132 then as-path-prepend "33003 22508"
set term AS_103_132 then accept

set term AS_104_24 from route-filter 104.24.0.0/19 exact
set term AS_104_24 then as-path-prepend "33003 5697 18695 40946"
set term AS_104_24 then origin incomplete
set term AS_104_24 then accept

set term AS_104_192_11 from route-filter 104.192.0.0/11 exact
set term AS_104_192_11 then as-path-prepend "33112 41164 1790 60467 10677"
set term AS_104_192_11 then origin incomplete
set term AS_104_192_11 then accept

set term AS_104_192_18 from route-filter 104.192.0.0/18 exact
set term AS_104_192_18 then as-path-prepend "33003 49129 49930 56894 44544 26964 57966"
set term AS_104_192_18 then origin incomplete
set term AS_104_192_18 then accept

set term AS_105_113 from route-filter 105.113.70.0/23 exact
set term AS_105_113 then as-path-prepend "33112 36621 40234 4610"
set term AS_105_113 then accept

set term AS_106_160 from route-filter 106.160.0.0/11 exact
set term AS_106_160 then accept

set term AS_107_112 from route-filter 107.112.0.0/12 exact
set term AS_107_112 then as-path-prepend "33003 5697 62483 55974 49605 17253 22486 27208"
set term AS_107_112 then accept

set term AS_107_158 from route-filter 107.158.0.0/15 exact
set term AS_107_158 then as-path-prepend "61671 41164 1039 32218"
set term AS_107_158 then accept

set term AS_107_216 from route-filter 107.216.0.0/13 exact
set term AS_107_216 then accept

set term AS_109_15 from route-filter 109.15.160.0/19 exact
set term AS_109_15 then as-path-prepend "33112 22508"
set term AS_109_15 then origin incomplete
set term AS_109_15 then accept

set term AS_109_206 from route-filter 109.206.64.0/20 exact
set term AS_109_206 then as-path-prepend "61671 60177 63887"
set term AS_109_206 then origin incomplete
set term AS_109_206 then accept

set term AS_110_50 from route-filter 110.50.60.0/24 exact
set term AS_110_50 then as-path-prepend "33003 41164 21121"
set term AS_110_50 then accept

set term AS_111_39 from route-filter 111.39.208.0/20 exact
set term AS_111_39 then as-path-prepend "61671 27075 9670 3626 25033 42989 31935 13258"
set term AS_111_39 then origin incomplete
set term AS_111_39 then accept

set term AS_111_152 from route-filter 111.152.0.0/14 exact
set term AS_111_152 then as-path-prepend "61671 41164 47758 54721 28763 45364"
set term AS_111_152 then origin incomplete
set term AS_111_152 then accept

set term AS_113_96 from route-filter 113.96.0.0/11 exact
set term AS_113_96 then as-path-prepend "33003 62186 7553 33806 1435 46859 32814 45561"
set term AS_113_96 then origin incomplete
set term AS_113_96 then accept

set term AS_113_197 from route-filter 113.197.43.0/24 exact
set term AS_113_197 then as-path-prepend "110047427 36024 37067 23000 38198 22531 9867 20967"
set term AS_113_197 then accept

set term AS_114_50 from route-filter 114.50.64.0/22 exact
set term AS_114_50 then as-path-prepend "110047427 56422 235 15947 30857 30646 3127 40093 2724"
set term AS_114_50 then accept

set term AS_115_40 from route-filter 115.40.0.0/13 exact
set term AS_115_40 then as-path-prepend "33112 60177 23789 9452 28275 31473"
set term AS_115_40 then accept

set term AS_115_127 from route-filter 115.127.2.0/23 exact
set term AS_115_127 then as-path-prepend "110047427 56422 235 18979 36652 49855 11804 27615"
set term AS_115_127 then accept

set term AS_115_195 from route-filter 115.195.32.0/19 exact
set term AS_115_195 then as-path-prepend "33003 30404 38727 1727 26141 28598"
set term AS_115_195 then accept

set term AS_116_129 from route-filter 116.129.128.0/17 exact
set term AS_116_129 then as-path-prepend "33003 52411 19579 6803"
set term AS_116_129 then accept

set term AS_117_104 from route-filter 117.104.0.0/15 exact
set term AS_117_104 then as-path-prepend "110047427 56422 235 36876 57002 33148 62767 17932"
set term AS_117_104 then origin incomplete
set term AS_117_104 then accept

set term AS_121_128 from route-filter 121.128.160.0/19 exact
set term AS_121_128 then as-path-prepend "61671 41164 40751"
set term AS_121_128 then accept

set term AS_122_120 from route-filter 122.120.0.0/16 exact
set term AS_122_120 then as-path-prepend "33003 60177"
set term AS_122_120 then accept

set term AS_122_151 from route-filter 122.151.128.0/17 exact
set term AS_122_151 then as-path-prepend "110047427 56422 7923 49911"
set term AS_122_151 then origin incomplete
set term AS_122_151 then accept

set term AS_122_185 from route-filter 122.185.104.0/22 exact
set term AS_122_185 then as-path-prepend "33003 52411 52184 47191 10213 4757"
set term AS_122_185 then accept

set term AS_123_184 from route-filter 123.184.42.0/23 exact
set term AS_123_184 then as-path-prepend "61671 30404"
set term AS_123_184 then accept

set term AS_125_39 from route-filter 125.39.176.0/20 exact
set term AS_125_39 then accept

set term AS_125_163 from route-filter 125.163.128.0/17 exact
set term AS_125_163 then accept

set term AS_126_96 from route-filter 126.96.0.0/13 exact
set term AS_126_96 then as-path-prepend "33112 52411 18546 714 58580 7676"
set term AS_126_96 then origin incomplete
set term AS_126_96 then accept

set term AS_126_128 from route-filter 126.128.0.0/9 exact
set term AS_126_128 then accept

set term AS_128_80 from route-filter 128.80.0.0/12 exact
set term AS_128_80 then as-path-prepend "110047427 36024 7923 62659 51538 62598 16594"
set term AS_128_80 then origin incomplete
set term AS_128_80 then accept

set term AS_129_0 from route-filter 129.0.0.0/8 exact
set term AS_129_0 then accept

set term AS_129_32 from route-filter 129.32.0.0/11 exact
set term AS_129_32 then accept

set term AS_129_123 from route-filter 129.123.198.0/23 exact
set term AS_129_123 then as-path-prepend "61671 28515 53058 38947 5888 31021"
set term AS_129_123 then accept

set term AS_129_152 from route-filter 129.152.0.0/13 exact
set term AS_129_152 then accept

set term AS_130_51 from route-filter 130.51.198.0/23 exact
set term AS_130_51 then as-path-prepend "110047427 56422 50292 4440 50102"
set term AS_130_51 then accept

set term AS_132_60 from route-filter 132.60.200.0/21 exact
set term AS_132_60 then as-path-prepend "33112 30404"
set term AS_132_60 then accept

set term AS_132_168 from route-filter 132.168.0.0/14 exact
set term AS_132_168 then accept

set term AS_132_174 from route-filter 132.174.156.0/22 exact
set term AS_132_174 then as-path-prepend "33003 28515"
set term AS_132_174 then accept

set term AS_133_0 from route-filter 133.0.0.0/8 exact
set term AS_133_0 then as-path-prepend "61671 5697 48948 28074"
set term AS_133_0 then origin incomplete
set term AS_133_0 then accept

set term AS_133_47 from route-filter 133.47.0.0/16 exact
set term AS_133_47 then as-path-prepend "33003 36621 14769 41551"
set term AS_133_47 then origin incomplete
set term AS_133_47 then accept

set term AS_133_90 from route-filter 133.90.192.0/18 exact
set term AS_133_90 then as-path-prepend "61671 49129 50097 48485"
set term AS_133_90 then accept

set term AS_134_104 from route-filter 134.104.176.0/20 exact
set term AS_134_104 then as-path-prepend "33112 52411 20379 56163 48283 52336"
set term AS_134_104 then accept

set term AS_134_112 from route-filter 134.112.0.0/15 exact
set term AS_134_112 then accept

set term AS_135_56 from route-filter 135.56.0.0/14 exact
set term AS_135_56 then as-path-prepend "61671 49129 20607 5632 60078 33320"
set term AS_135_56 then accept

set term AS_135_64 from route-filter 135.64.0.0/11 exact
set term AS_135_64 then as-path-prepend "33003 49129 31460 15417"
set term AS_135_64 then accept

set term AS_137_35 from route-filter 137.35.0.0/16 exact
set term AS_137_35 then accept

set term AS_138_78 from route-filter 138.78.128.0/18 exact
set term AS_138_78 then as-path-prepend "33003 52411 13924 73 21997 34519 21422 6363"
set term AS_138_78 then accept

set term AS_138_207 from route-filter 138.207.192.0/21 exact
set term AS_138_207 then as-path-prepend "110047427 36024 235 62341 3093 43266 4364 49429 33163"
set term AS_138_207 then accept

set term AS_139_24 from route-filter 139.24.0.0/14 exact
set term AS_139_24 then as-path-prepend "33112 22508 15729 44541 30690 11824 35154 53963"
set term AS_139_24 then origin incomplete
set term AS_139_24 then accept

set term AS_140_64 from route-filter 140.64.0.0/12 exact
set term AS_140_64 then as-path-prepend "33112 28515 41726"
set term AS_140_64 then accept

set term AS_140_146 from route-filter 140.146.80.0/20 exact
set term AS_140_146 then as-path-prepend "110047427 36024 7923 48281 25530 62345"
set term AS_140_146 then accept

set term AS_140_156 from route-filter 140.156.160.0/21 exact
set term AS_140_156 then as-path-prepend "33112 63164 19045 20058"
set term AS_140_156 then accept

set term AS_141_0 from route-filter 141.0.0.0/8 exact
set term AS_141_0 then as-path-prepend "61671 49129 36554 61841 4025 53486"
set term AS_141_0 then accept

set term AS_142_96 from route-filter 142.96.0.0/11 exact
set term AS_142_96 then as-path-prepend "61671 60177 47547 41479 13064"
set term AS_142_96 then origin incomplete
set term AS_142_96 then accept

set term AS_142_155 from route-filter 142.155.192.0/20 exact
set term AS_142_155 then as-path-prepend "33003 36621 25841 4974 17299 42045"
set term AS_142_155 then accept

set term AS_142_180 from route-filter 142.180.0.0/15 exact
set term AS_142_180 then as-path-prepend "33112 22508 22395 534 51038 38631"
set term AS_142_180 then accept

set term AS_142_193 from route-filter 142.193.0.0/20 exact
set term AS_142_193 then as-path-prepend "33112 60177 60637 30709 57763"
set term AS_142_193 then accept

set term AS_142_220 from route-filter 142.220.0.0/14 exact
set term AS_142_220 then as-path-prepend "33003 63164 43681 20231 3725 48480 43941"
set term AS_142_220 then accept

set term AS_143_0 from route-filter 143.0.0.0/8 exact
set term AS_143_0 then as-path-prepend "33112 30404 63975 14194 61799 38085 34598"
set term AS_143_0 then accept

set term AS_143_109 from route-filter 143.109.16.0/21 exact
set term AS_143_109 then as-path-prepend "61671 36621 38146 17610 25340 34498"
set term AS_143_109 then accept

set term AS_143_139 from route-filter 143.139.160.0/19 exact
set term AS_143_139 then as-path-prepend "33003 62186 51066 29886 29318"
set term AS_143_139 then accept

set term AS_143_190 from route-filter 143.190.156.0/22 exact
set term AS_143_190 then as-path-prepend "61671 30404 17752 34454"
set term AS_143_190 then origin incomplete
set term AS_143_190 then accept

set term AS_144_0 from route-filter 144.0.0.0/9 exact
set term AS_144_0 then as-path-prepend "33003 60177"
set term AS_144_0 then origin incomplete
set term AS_144_0 then accept

set term AS_145_85 from route-filter 145.85.192.0/18 exact
set term AS_145_85 then accept

set term AS_147_148 from route-filter 147.148.64.0/20 exact
set term AS_147_148 then accept

set term AS_148_0_8 from route-filter 148.0.0.0/8 exact
set term AS_148_0_8 then as-path-prepend "61671 60177 26793"
set term AS_148_0_8 then accept

set term AS_148_0_9 from route-filter 148.0.0.0/9 exact
set term AS_148_0_9 then as-path-prepend "61671 36621 34013 34704 17878 8729 53857"
set term AS_148_0_9 then accept

set term AS_148_11 from route-filter 148.11.192.0/18 exact
set term AS_148_11 then as-path-prepend "33003 41164 17205"
set term AS_148_11 then accept

set term AS_148_79 from route-filter 148.79.176.0/21 exact
set term AS_148_79 then as-path-prepend "110047427 36024 13859"
set term AS_148_79 then accept

set term AS_149_0 from route-filter 149.0.0.0/9 exact
set term AS_149_0 then as-path-prepend "61671 52411"
set term AS_149_0 then accept

set term AS_149_160 from route-filter 149.160.0.0/13 exact
set term AS_149_160 then as-path-prepend "33003 63164"
set term AS_149_160 then accept

set term AS_149_171 from route-filter 149.171.214.0/24 exact
set term AS_149_171 then as-path-prepend "61671 52411 5796 39911 12169 7245 53686 3874"
set term AS_149_171 then accept

set term AS_150_66 from route-filter 150.66.218.0/24 exact
set term AS_150_66 then as-path-prepend "33112 41164 9830"
set term AS_150_66 then accept

set term AS_150_89 from route-filter 150.89.0.0/16 exact
set term AS_150_89 then as-path-prepend "33112 5697 49634 59914 64074 46111 19282 21092"
set term AS_150_89 then accept

set term AS_150_187 from route-filter 150.187.2.0/23 exact
set term AS_150_187 then as-path-prepend "33112 22508 62298 40181 11997 46208 14074 15542"
set term AS_150_187 then origin incomplete
set term AS_150_187 then accept

set term AS_151_170 from route-filter 151.170.64.0/18 exact
set term AS_151_170 then as-path-prepend "61671 63164"
set term AS_151_170 then accept

set term AS_151_183 from route-filter 151.183.0.0/16 exact
set term AS_151_183 then as-path-prepend "33112 28515 39819"
set term AS_151_183 then accept

set term AS_152_30 from route-filter 152.30.136.0/22 exact
set term AS_152_30 then as-path-prepend "61671 28515 50419"
set term AS_152_30 then origin incomplete
set term AS_152_30 then accept

set term AS_152_97 from route-filter 152.97.64.0/18 exact
set term AS_152_97 then as-path-prepend "33003 28515 63280"
set term AS_152_97 then origin incomplete
set term AS_152_97 then accept

set term AS_153_174 from route-filter 153.174.0.0/15 exact
set term AS_153_174 then as-path-prepend "110047427 56422 235 61361"
set term AS_153_174 then accept

set term AS_153_203 from route-filter 153.203.158.0/24 exact
set term AS_153_203 then as-path-prepend "33003 30404 32291 28315 57922 13398"
set term AS_153_203 then accept

set term AS_154_83 from route-filter 154.83.0.0/18 exact
set term AS_154_83 then as-path-prepend "33112 41164 40522 38353 18424 60224 16486 11735"
set term AS_154_83 then accept

set term AS_154_128 from route-filter 154.128.0.0/9 exact
set term AS_154_128 then as-path-prepend "33112 5697 30284 25817 58254 24799"
set term AS_154_128 then origin incomplete
set term AS_154_128 then accept

set term AS_154_168 from route-filter 154.168.0.0/13 exact
set term AS_154_168 then as-path-prepend "33112 28515 15406"
set term AS_154_168 then accept

set term AS_156_96 from route-filter 156.96.0.0/12 exact
set term AS_156_96 then accept

set term AS_156_176 from route-filter 156.176.188.0/22 exact
set term AS_156_176 then as-path-prepend "33003 28515 7291 56647 1386 51234 57017"
set term AS_156_176 then accept

set term AS_156_204 from route-filter 156.204.0.0/14 exact
set term AS_156_204 then origin incomplete
set term AS_156_204 then accept

set term AS_157_128 from route-filter 157.128.0.0/9 exact
set term AS_157_128 then as-path-prepend "33003 41164 19496 41215 14145 56526 43199 29495"
set term AS_157_128 then accept

set term AS_159_41 from route-filter 159.41.128.0/22 exact
set term AS_159_41 then as-path-prepend "33003 36621 16950"
set term AS_159_41 then accept

set term AS_160_223 from route-filter 160.223.0.0/16 exact
set term AS_160_223 then as-path-prepend "33112 30404 18628 57847 40907 5470 50664 10670"
set term AS_160_223 then accept

set term AS_161_33 from route-filter 161.33.0.0/16 exact
set term AS_161_33 then as-path-prepend "33112 27075 35761 27725"
set term AS_161_33 then accept

set term AS_161_92 from route-filter 161.92.0.0/14 exact
set term AS_161_92 then as-path-prepend "61671 5697 44354 15751"
set term AS_161_92 then origin incomplete
set term AS_161_92 then accept

set term AS_161_103 from route-filter 161.103.146.0/23 exact
set term AS_161_103 then as-path-prepend "61671 41164 28389 7809 45703"
set term AS_161_103 then accept

set term AS_161_128 from route-filter 161.128.0.0/10 exact
set term AS_161_128 then accept

set term AS_162_8 from route-filter 162.8.0.0/13 exact
set term AS_162_8 then as-path-prepend "33112 41164 14896 38870 37501 33528"
set term AS_162_8 then accept

set term AS_162_173 from route-filter 162.173.0.0/19 exact
set term AS_162_173 then as-path-prepend "61671 52411 58446 57182 53912 40497 4811 51453"
set term AS_162_173 then origin incomplete
set term AS_162_173 then accept

set term AS_163_40 from route-filter 163.40.0.0/14 exact
set term AS_163_40 then as-path-prepend "110047427 56422 37067 19271 6047 3988 24686"
set term AS_163_40 then accept

set term AS_163_61 from route-filter 163.61.128.0/20 exact
set term AS_163_61 then as-path-prepend "33003 22508 12546 50996 56355"
set term AS_163_61 then accept

set term AS_163_64 from route-filter 163.64.0.0/14 exact
set term AS_163_64 then as-path-prepend "110047427 56422 50292 7211 60197"
set term AS_163_64 then accept

set term AS_164_0_8 from route-filter 164.0.0.0/8 exact
set term AS_164_0_8 then as-path-prepend "61671 36621 23946 54283 28069"
set term AS_164_0_8 then accept

set term AS_164_0_9 from route-filter 164.0.0.0/9 exact
set term AS_164_0_9 then as-path-prepend "33003 30404"
set term AS_164_0_9 then accept

set term AS_164_188 from route-filter 164.188.192.0/18 exact
set term AS_164_188 then as-path-prepend "33112 49129 36854"
set term AS_164_188 then accept

set term AS_164_207 from route-filter 164.207.0.0/19 exact
set term AS_164_207 then as-path-prepend "61671 49129 45730 24249 34070 11243 11147 56321"
set term AS_164_207 then accept

set term AS_164_211 from route-filter 164.211.16.0/22 exact
set term AS_164_211 then as-path-prepend "33112 36621 17287 42527 28240 41734"
set term AS_164_211 then accept

set term AS_166_103 from route-filter 166.103.86.0/23 exact
set term AS_166_103 then as-path-prepend "33003 63164 51521 34880"
set term AS_166_103 then accept

set term AS_166_192 from route-filter 166.192.0.0/13 exact
set term AS_166_192 then as-path-prepend "33003 52411 26586"
set term AS_166_192 then accept

set term AS_167_184 from route-filter 167.184.222.0/24 exact
set term AS_167_184 then as-path-prepend "110047427 36024 7923 4377"
set term AS_167_184 then accept

set term AS_168_0 from route-filter 168.0.0.0/8 exact
set term AS_168_0 then as-path-prepend "33112 22508 25782 4669"
set term AS_168_0 then accept

set term AS_168_75 from route-filter 168.75.192.0/18 exact
set term AS_168_75 then as-path-prepend "110047427 56422 47123 8247 50321 37419 20107 38013 50304"
set term AS_168_75 then accept

set term AS_168_128 from route-filter 168.128.0.0/11 exact
set term AS_168_128 then as-path-prepend "61671 63164 40969"
set term AS_168_128 then origin incomplete
set term AS_168_128 then accept

set term AS_168_160 from route-filter 168.160.0.0/14 exact
set term AS_168_160 then as-path-prepend "33003 27075 45948 15270"
set term AS_168_160 then accept

set term AS_168_214 from route-filter 168.214.18.0/24 exact
set term AS_168_214 then as-path-prepend "110047427 56422 47123 4322"
set term AS_168_214 then accept

set term AS_169_4 from route-filter 169.4.32.0/19 exact
set term AS_169_4 then as-path-prepend "110047427 36024"
set term AS_169_4 then origin incomplete
set term AS_169_4 then accept

set term AS_169_98 from route-filter 169.98.104.0/23 exact
set term AS_169_98 then accept

set term AS_169_160 from route-filter 169.160.0.0/11 exact
set term AS_169_160 then as-path-prepend "61671 27075 50192 2840"
set term AS_169_160 then accept

set term AS_169_200 from route-filter 169.200.129.0/24 exact
set term AS_169_200 then as-path-prepend "33003 62186 32404 18257 55781 1380 49393"
set term AS_169_200 then accept

set term AS_170_0 from route-filter 170.0.0.0/9 exact
set term AS_170_0 then as-path-prepend "110047427 56422 7923 12833 19022 5572 16367 19604 24527"
set term AS_170_0 then accept

set term AS_170_178 from route-filter 170.178.160.0/21 exact
set term AS_170_178 then as-path-prepend "33003 60177"
set term AS_170_178 then accept

set term AS_171_0 from route-filter 171.0.0.0/10 exact
set term AS_171_0 then as-path-prepend "33003 49129 22685"
set term AS_171_0 then accept

set term AS_171_80 from route-filter 171.80.0.0/12 exact
set term AS_171_80 then as-path-prepend "33003 28515"
set term AS_171_80 then accept

# Rule mapping for block 172.17.0.0/24 through 172.17.15.0/24 
set term AS_172_17 from route-filter 172.17.0.0/16 prefix-length-range /24-/24
set term AS_172_17 then accept

set term AS_172_58 from route-filter 172.58.32.0/19 exact
set term AS_172_58 then as-path-prepend "33003 41164 26562 33811 56478 28692"
set term AS_172_58 then accept

set term AS_172_128_13 from route-filter 172.128.0.0/13 exact
set term AS_172_128_13 then as-path-prepend "33112 62186 39639 33485 61605 7821"
set term AS_172_128_13 then origin incomplete
set term AS_172_128_13 then accept

set term AS_172_128_14 from route-filter 172.128.0.0/14 exact
set term AS_172_128_14 then as-path-prepend "110047427 36024 7923 58955 11842 62504 46312 45273 35248"
set term AS_172_128_14 then accept

set term AS_172_160 from route-filter 172.160.0.0/12 exact
set term AS_172_160 then as-path-prepend "61671 41164"
set term AS_172_160 then accept

set term AS_173_2 from route-filter 173.2.0.0/16 exact
set term AS_173_2 then as-path-prepend "33112 30404 61923 16566 26390 11325 28053"
set term AS_173_2 then origin incomplete
set term AS_173_2 then accept

set term AS_174_164 from route-filter 174.164.0.0/14 exact
set term AS_174_164 then as-path-prepend "61671 5697"
set term AS_174_164 then origin incomplete
set term AS_174_164 then accept

set term AS_175_129 from route-filter 175.129.128.0/17 exact
set term AS_175_129 then as-path-prepend "61671 22508 54232"
set term AS_175_129 then accept

set term AS_175_132 from route-filter 175.132.160.0/20 exact
set term AS_175_132 then as-path-prepend "33112 52411 27222 30448 13163 6317 23543"
set term AS_175_132 then accept

set term AS_175_135 from route-filter 175.135.96.0/21 exact
set term AS_175_135 then origin incomplete
set term AS_175_135 then accept

set term AS_176_0 from route-filter 176.0.0.0/8 exact
set term AS_176_0 then accept

set term AS_177_180 from route-filter 177.180.0.0/14 exact
set term AS_177_180 then as-path-prepend "61671 28515 12747 52294 44682 56636"
set term AS_177_180 then accept

set term AS_178_128_9 from route-filter 178.128.0.0/9 exact
set term AS_178_128_9 then as-path-prepend "33112 27075 12799 14321 46305 12432 13970"
set term AS_178_128_9 then accept

set term AS_178_128_10 from route-filter 178.128.0.0/10 exact
set term AS_178_128_10 then as-path-prepend "61671 22508 55936 34842 52154 41933"
set term AS_178_128_10 then accept

set term AS_178_190 from route-filter 178.190.192.0/18 exact
set term AS_178_190 then as-path-prepend "33003 52411 30659 7634 15884 30626 37002 31260"
set term AS_178_190 then accept

set term AS_178_193 from route-filter 178.193.0.0/16 exact
set term AS_178_193 then as-path-prepend "33003 5697 33952 5934 37561 18306 51885 48575"
set term AS_178_193 then origin incomplete
set term AS_178_193 then accept

set term AS_179_48 from route-filter 179.48.0.0/12 exact
set term AS_179_48 then as-path-prepend "61671 5697 55803 2942 10573"
set term AS_179_48 then accept

set term AS_182_128 from route-filter 182.128.0.0/9 exact
set term AS_182_128 then as-path-prepend "33112 28515 43545 1044 35728 19404 47209"
set term AS_182_128 then accept

set term AS_182_159 from route-filter 182.159.96.0/20 exact
set term AS_182_159 then as-path-prepend "110047427 56422 37067 30903 16076"
set term AS_182_159 then accept

set term AS_183_40 from route-filter 183.40.0.0/17 exact
set term AS_183_40 then as-path-prepend "33003 60177 16298 24761 43916 17401"
set term AS_183_40 then accept

set term AS_184_64 from route-filter 184.64.152.0/21 exact
set term AS_184_64 then as-path-prepend "33112 63164 37414 53415 32006 15944"
set term AS_184_64 then origin incomplete
set term AS_184_64 then accept

set term AS_185_0 from route-filter 185.0.0.0/10 exact
set term AS_185_0 then as-path-prepend "33112 62186 13238 4101 60484 56440"
set term AS_185_0 then origin incomplete
set term AS_185_0 then accept

set term AS_185_187 from route-filter 185.187.114.0/24 exact
set term AS_185_187 then accept

set term AS_186_3 from route-filter 186.3.32.0/21 exact
set term AS_186_3 then as-path-prepend "33112 41164 47078 15085"
set term AS_186_3 then accept

set term AS_187_0 from route-filter 187.0.0.0/8 exact
set term AS_187_0 then accept

set term AS_187_32 from route-filter 187.32.0.0/12 exact
set term AS_187_32 then as-path-prepend "110047427 56422 50292 19626 7864 27622 6918 4724"
set term AS_187_32 then origin incomplete
set term AS_187_32 then accept

set term AS_187_44 from route-filter 187.44.101.0/24 exact
set term AS_187_44 then accept

set term AS_188_32 from route-filter 188.32.0.0/11 exact
set term AS_188_32 then as-path-prepend "33003 63164 56345 48994 56097 22632 53000 9401"
set term AS_188_32 then accept

set term AS_189_18 from route-filter 189.18.28.0/22 exact
set term AS_189_18 then as-path-prepend "33112 63164 11993"
set term AS_189_18 then accept

set term AS_189_192 from route-filter 189.192.0.0/12 exact
set term AS_189_192 then as-path-prepend "61671 36621 50753 24739 26907 37744"
set term AS_189_192 then accept

set term AS_190_47 from route-filter 190.47.128.0/17 exact
set term AS_190_47 then as-path-prepend "33003 22508 47842 6191 40599 24177 47198"
set term AS_190_47 then accept

set term AS_190_56 from route-filter 190.56.32.0/19 exact
set term AS_190_56 then as-path-prepend "61671 30404 11114 53598 10591 4850 54617"
set term AS_190_56 then accept

set term AS_190_192 from route-filter 190.192.0.0/12 exact
set term AS_190_192 then as-path-prepend "33003 52411 13839 3913"
set term AS_190_192 then accept

set term AS_191_8 from route-filter 191.8.0.0/16 exact
set term AS_191_8 then as-path-prepend "33112 27075 1973 42864 26191"
set term AS_191_8 then accept

set term AS_191_146 from route-filter 191.146.0.0/17 exact
set term AS_191_146 then as-path-prepend "33112 28515 8897"
set term AS_191_146 then accept

set term AS_191_152 from route-filter 191.152.0.0/14 exact
set term AS_191_152 then as-path-prepend "61671 62186 62064 52989"
set term AS_191_152 then accept

set term AS_192_0 from route-filter 192.0.0.0/9 exact
set term AS_192_0 then as-path-prepend "61671 52411 7458 34476 10564 448 9806 63202"
set term AS_192_0 then accept

set term AS_197_0 from route-filter 197.0.0.0/10 exact
set term AS_197_0 then as-path-prepend "110047427 56422 13859 14435 27737 17525 43706 48942 57648"
set term AS_197_0 then accept

set term AS_197_60 from route-filter 197.60.0.0/14 exact
set term AS_197_60 then as-path-prepend "61671 27075 61786"
set term AS_197_60 then accept

set term AS_197_64 from route-filter 197.64.0.0/10 exact
set term AS_197_64 then as-path-prepend "33112 63164 46760 60776 53825"
set term AS_197_64 then origin incomplete
set term AS_197_64 then accept

set term AS_197_128 from route-filter 197.128.0.0/9 exact
set term AS_197_128 then accept

set term AS_198_3 from route-filter 198.3.44.0/23 exact
set term AS_198_3 then as-path-prepend "61671 22508 58224 46697 35789 16575"
set term AS_198_3 then accept

set term AS_198_83 from route-filter 198.83.134.0/23 exact
set term AS_198_83 then as-path-prepend "33112 49129"
set term AS_198_83 then accept

set term AS_200_128 from route-filter 200.128.0.0/9 exact
set term AS_200_128 then as-path-prepend "61671 22508"
set term AS_200_128 then accept

set term AS_200_210 from route-filter 200.210.0.0/15 exact
set term AS_200_210 then as-path-prepend "61671 60177 6738"
set term AS_200_210 then origin incomplete
set term AS_200_210 then accept

set term AS_202_0 from route-filter 202.0.0.0/8 exact
set term AS_202_0 then as-path-prepend "33003 36621 61615 4152 12775"
set term AS_202_0 then accept

set term AS_202_204 from route-filter 202.204.0.0/16 exact
set term AS_202_204 then as-path-prepend "33003 30404 22375 58348 45394 50899"
set term AS_202_204 then accept

set term AS_203_84 from route-filter 203.84.172.0/22 exact
set term AS_203_84 then accept

set term AS_205_0 from route-filter 205.0.0.0/8 exact
set term AS_205_0 then as-path-prepend "33003 36621 27322 53908 24551 57552 61778"
set term AS_205_0 then accept

set term AS_205_136 from route-filter 205.136.0.0/13 exact
set term AS_205_136 then as-path-prepend "61671 63164 5398 34525 25813 8456 31805"
set term AS_205_136 then accept

set term AS_206_126 from route-filter 206.126.160.0/19 exact
set term AS_206_126 then as-path-prepend "33003 60177 25709 34440 5040 59071 27550"
set term AS_206_126 then accept

set term AS_206_128 from route-filter 206.128.0.0/11 exact
set term AS_206_128 then as-path-prepend "33003 62186 52079 60381 61181"
set term AS_206_128 then accept

set term AS_206_168 from route-filter 206.168.0.0/13 exact
set term AS_206_168 then as-path-prepend "33112 22508 12715 22902 6883 34736"
set term AS_206_168 then accept

set term AS_207_102 from route-filter 207.102.0.0/17 exact
set term AS_207_102 then as-path-prepend "33112 62186 63370 56554 32164 55754"
set term AS_207_102 then accept

set term AS_207_124 from route-filter 207.124.0.0/16 exact
set term AS_207_124 then as-path-prepend "61671 52411 60496 36560 43253 29653"
set term AS_207_124 then accept

set term AS_208_0 from route-filter 208.0.0.0/8 exact
set term AS_208_0 then as-path-prepend "33112 36621"
set term AS_208_0 then accept

set term AS_208_52 from route-filter 208.52.0.0/14 exact
set term AS_208_52 then as-path-prepend "33112 27075 41681 15391 50769"
set term AS_208_52 then accept

set term AS_208_96 from route-filter 208.96.0.0/12 exact
set term AS_208_96 then as-path-prepend "61671 49129 21237 21256 8700 10795"
set term AS_208_96 then accept

set term AS_208_183 from route-filter 208.183.0.0/16 exact
set term AS_208_183 then origin incomplete
set term AS_208_183 then accept

set term AS_209_39 from route-filter 209.39.68.0/22 exact
set term AS_209_39 then as-path-prepend "33112 63164"
set term AS_209_39 then accept

set term AS_210_70 from route-filter 210.70.172.0/23 exact
set term AS_210_70 then as-path-prepend "33003 27075 1979 61685 47535 38871"
set term AS_210_70 then accept

set term AS_212_0 from route-filter 212.0.0.0/9 exact
set term AS_212_0 then accept

set term AS_212_207 from route-filter 212.207.0.0/16 exact
set term AS_212_207 then as-path-prepend "61671 63164 8199"
set term AS_212_207 then accept

set term AS_213_38 from route-filter 213.38.128.0/18 exact
set term AS_213_38 then as-path-prepend "110047427 56422 7923 26430 7291 9845 1017 38172"
set term AS_213_38 then accept

set term AS_213_152 from route-filter 213.152.96.0/19 exact
set term AS_213_152 then as-path-prepend "110047427 56422 13859 43560 51919 12792 56522"
set term AS_213_152 then accept

set term AS_214_192 from route-filter 214.192.0.0/12 exact
set term AS_214_192 then as-path-prepend "61671 22508 1413 23664"
set term AS_214_192 then accept

set term AS_215_113 from route-filter 215.113.2.0/23 exact
set term AS_215_113 then accept

set term AS_215_128 from route-filter 215.128.0.0/9 exact
set term AS_215_128 then as-path-prepend "33112 49129 2853 42465"
set term AS_215_128 then accept

set term AS_215_215 from route-filter 215.215.0.0/18 exact
set term AS_215_215 then as-path-prepend "110047427 56422 50292 36619 32644 985 32286 40981"
set term AS_215_215 then accept

set term AS_217_32 from route-filter 217.32.0.0/11 exact
set term AS_217_32 then as-path-prepend "110047427 56422 50292 61080"
set term AS_217_32 then origin incomplete
set term AS_217_32 then accept

set term AS_217_63 from route-filter 217.63.20.0/22 exact
set term AS_217_63 then as-path-prepend "61671 63164 25197 7581 12884 859 32212 43953"
set term AS_217_63 then accept

set term AS_217_128 from route-filter 217.128.0.0/9 exact
set term AS_217_128 then as-path-prepend "33112 22508 4819"
set term AS_217_128 then accept

set term AS_218_160 from route-filter 218.160.0.0/11 exact
set term AS_218_160 then as-path-prepend "33003 41164"
set term AS_218_160 then accept

set term AS_219_0_8 from route-filter 219.0.0.0/8 exact
set term AS_219_0_8 then as-path-prepend "33112 27075 14574 55821"
set term AS_219_0_8 then accept

set term AS_219_0_9 from route-filter 219.0.0.0/9 exact
set term AS_219_0_9 then as-path-prepend "61671 49129 16039 40701 15554 53242 19944 15326"
set term AS_219_0_9 then accept

set term AS_219_198 from route-filter 219.198.180.0/22 exact
set term AS_219_198 then as-path-prepend "110047427 56422 50292 40827 39310 44008 56173 4098 57983"
set term AS_219_198 then accept

set term AS_220_26 from route-filter 220.26.0.0/15 exact
set term AS_220_26 then as-path-prepend "61671 52411"
set term AS_220_26 then origin incomplete
set term AS_220_26 then accept

set term AS_221_96 from route-filter 221.96.0.0/12 exact
set term AS_221_96 then accept

set term AS_222_99 from route-filter 222.99.79.0/24 exact
set term AS_222_99 then as-path-prepend "33112 63164 62472 3395 14478 40355 50326"
set term AS_222_99 then accept

set term AS_223_151 from route-filter 223.151.0.0/16 exact
set term AS_223_151 then as-path-prepend "33112 41164 48535 19323 31570 51535"
set term AS_223_151 then accept

set term AS_223_160 from route-filter 223.160.0.0/11 exact
set term AS_223_160 then as-path-prepend "33003 5697 56469 27842 11580"
set term AS_223_160 then accept

set term DENY_REST then reject
```

### 2.3 ebgp peers
```
top
set routing-options autonomous-system 1620
set protocols bgp bgp group pe type external
set protocols bgp bgp group pe peer-as 54000
set protocols bgp bgp group pe neighbor 192.168.1.1 export INJECT_INTERNET
set protocols bgp bgp group pe neighbor 192.168.1.2 export INJECT_INTERNET
```
