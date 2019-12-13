####BATFISH FLATTENED JUNIPER CONFIG####
set version 14.1X53-D38
set groups TACACS system tacplus-server <*> secret <SCRUBBED>
set groups TACACS system tacplus-server <*> timeout 4
set groups TACACS system tacplus-server <*> source-address 10.88.253.23
set groups VRRP-COMMON interfaces <*> unit <*> family inet address <*> vrrp-group <*> accept-data
set groups VRRP-COMMON interfaces <*> unit <*> family inet address <*> vrrp-group <*> authentication-type md5
set groups VRRP-COMMON interfaces <*> unit <*> family inet address <*> vrrp-group <*> authentication-key 72f5042714948aad2e158c340d20b8a6
set groups VRRP-GR1 interfaces <*> unit <*> family inet address <*> vrrp-group <*> priority 120
set groups VRRP-GR1 interfaces <*> unit <*> family inet address <*> vrrp-group <*> preempt hold-time 60
set groups VRRP-GR2 interfaces <*> unit <*> family inet address <*> vrrp-group <*> priority 110
set groups MC-LAG-GENERIC-V2 interfaces "<ae[!0]*>" aggregated-ether-options lacp active
set groups MC-LAG-GENERIC-V2 interfaces "<ae[!0]*>" aggregated-ether-options lacp admin-key 1
set groups MC-LAG-GENERIC-V2 interfaces "<ae[!0]*>" aggregated-ether-options mc-ae mode active-active
set groups MC-LAG-GENERIC-V2 interfaces "<ae[!0]*>" aggregated-ether-options mc-ae init-delay-time 240
set groups MC-LAG-GENERIC-V2 interfaces "<ae[!0-2]*>" unit 0 family ethernet-switching interface-mode access
set groups MC-LAG-GENERIC-V2 interfaces <ae1*> unit 0 family ethernet-switching interface-mode access
set groups MC-LAG-GENERIC-V2 interfaces "<ae[12]>" aggregated-ether-options lacp system-id 00:01:02:03:04:05
set groups MC-LAG-GENERIC-V2 interfaces "<ae1[0-9][0-9]>" aggregated-ether-options lacp system-id 00:01:02:03:04:05
set groups MC-LAG-GENERIC-V2 interfaces "<ae2[0-9][0-9]>" aggregated-ether-options lacp system-id 10:11:12:13:14:16
set groups MC-LAG-A-V2 interfaces "<ae[!0]*>" aggregated-ether-options mc-ae chassis-id 0
set groups MC-LAG-A-V2 interfaces "<ae[!0]*>" aggregated-ether-options mc-ae status-control active
set groups MC-LAG-B-V2 interfaces "<ae[!0]*>" aggregated-ether-options mc-ae chassis-id 1
set groups MC-LAG-B-V2 interfaces "<ae[!0]*>" aggregated-ether-options mc-ae status-control standby
set groups OSPF protocols ospf reference-bandwidth 100g
set groups OSPF protocols ospf area <*> interface <*> authentication md5 1 key 72f5042714948aad2e158c340d20b8a6
set groups OSPF protocols ospf area <*> interface <*> bfd-liveness-detection minimum-interval 1000
set groups OSPF protocols ospf area <*> interface <*> bfd-liveness-detection multiplier 3
set groups IBGP   protocols bgp group <IBGP-*> type internal
set groups IBGP   protocols bgp group <IBGP-*> authentication-key 72f5042714948aad2e158c340d20b8a6
set groups IBGP   protocols bgp group <IBGP-*> bfd-liveness-detection minimum-interval 2000
set groups IBGP   protocols bgp group <IBGP-*> bfd-liveness-detection multiplier 6
set groups IBGP protocols bgp group <IBGP-*> type internal
set groups IBGP protocols bgp group <IBGP-*> authentication-key 72f5042714948aad2e158c340d20b8a6
set groups IBGP protocols bgp group <IBGP-*> bfd-liveness-detection minimum-interval 2000
set groups IBGP protocols bgp group <IBGP-*> bfd-liveness-detection multiplier 6
set system apply-groups TACACS
set system host-name HSW-003b.SEA3
set system domain-name test.com
set system time-zone UTC
set system authentication-order tacplus
set system authentication-order password
set system root-authentication encrypted-password <SCRUBBED>
set system name-server 10.248.3.11
set system name-server 10.248.2.11
set system tacplus-server 10.252.0.250
set system tacplus-server 10.252.16.230
set system accounting events login
set system accounting events change-log
set system accounting events interactive-commands
set system accounting destination tacplus
set system scripts commit file interface-descriptions.slax
set system scripts commit file static-arp.slax
set system scripts op file bgp-neigh.slax
set system scripts op file ospf-neigh.slax
set system login class MAINT idle-timeout 30
set system login class MAINT login-alarms
set system login class MAINT permissions maintenance
set system login user remote uid 2000
set system login user remote class MAINT
set system login user uhoh uid 2010
set system login user uhoh class superuser
set system login user uhoh authentication encrypted-password <SCRUBBED>
set system services ssh root-login deny
set system services netconf ssh
set system syslog user * any emergency
set system syslog host 10.252.80.130 any notice
set system syslog host 10.252.80.130 change-log any
set system syslog host 10.252.80.130 interactive-commands any
set system syslog host 10.252.80.130 port 5528
set system syslog host 10.65.14.20 any info
set system syslog host 10.65.14.20 change-log any
set system syslog file messages any notice
set system syslog file messages authorization info
set system syslog file messages archive size 1000000 files 20
set system syslog file interactive-commands interactive-commands any
set system syslog file interactive-commands archive size 1000000 files 20
set system syslog file default-log-messages any any
set system syslog file default-log-messages match "(requested 'commit' operation)|(copying configuration to juniper.save)|(commit complete)|ifAdminStatus|(FRU power)|(FRU removal)|(FRU insertion)|(link UP)|transitioned|Transferred|transfer-file|(license add)|(license delete)|(package -X update)|(package -X delete) | CFMD_CCM_DEFECT| LFMD_3AH | RPD_MPLS_PATH_BFD"
set system syslog file default-log-messages structured-data
set system syslog source-address 10.88.253.23
set system ntp server 10.255.0.10
set system ntp server 10.255.0.11
set chassis aggregated-devices ethernet device-count 300
set interfaces apply-groups MC-LAG-GENERIC-V2
set interfaces apply-groups MC-LAG-B-V2
set interfaces xe-0/0/0 description "[type=SER, ip=4]"
set interfaces xe-0/0/0 ether-options 802.3ad ae100
set interfaces xe-0/0/1 description "[type=SER, ip=4]"
set interfaces xe-0/0/1 ether-options 802.3ad ae101
set interfaces xe-0/0/2 description "[type=SER, ip=4]"
set interfaces xe-0/0/2 ether-options 802.3ad ae102
set interfaces xe-0/0/3 description "[type=SER, ip=4]"
set interfaces xe-0/0/3 ether-options 802.3ad ae103
set interfaces xe-0/0/4 description "[type=SER, ip=4]"
set interfaces xe-0/0/4 ether-options 802.3ad ae104
set interfaces xe-0/0/5 description "[type=SER, ip=4]"
set interfaces xe-0/0/5 ether-options 802.3ad ae105
set interfaces xe-0/0/6 description "[type=SER, ip=4]"
set interfaces xe-0/0/6 ether-options 802.3ad ae106
set interfaces xe-0/0/7 description "[type=SER, ip=4]"
set interfaces xe-0/0/7 ether-options 802.3ad ae107
set interfaces xe-0/0/8 description "[type=SER, ip=4]"
set interfaces xe-0/0/8 ether-options 802.3ad ae108
set interfaces xe-0/0/9 description "[type=SER, ip=4]"
set interfaces xe-0/0/9 ether-options 802.3ad ae109
set interfaces xe-0/0/10 description "[type=SER, ip=4]"
set interfaces xe-0/0/10 ether-options 802.3ad ae110
set interfaces et-0/0/100 description "[type=UL, nbr=SPN-001.SEA3:et-3/0/34, ip=4]"
set interfaces et-0/0/100 unit 0 description "[type=UL, nbr=SPN-001.SEA3:et-3/0/34, ip=4]"
set interfaces et-0/0/100 unit 0 family inet address 10.88.16.29/31
set interfaces et-0/0/101 description "[type=UL, nbr=SPN-002.SEA3:et-3/0/34, ip=4]"
set interfaces et-0/0/101 unit 0 description "[type=UL, nbr=SPN-002.SEA3:et-3/0/34, ip=4]"
set interfaces et-0/0/101 unit 0 family inet address 10.88.17.29/31
set interfaces et-0/0/102 description "[type=UL, nbr=SPN-003.SEA3:et-3/0/34, ip=4]"
set interfaces et-0/0/102 unit 0 description "[type=UL, nbr=SPN-003.SEA3:et-3/0/34, ip=4]"
set interfaces et-0/0/102 unit 0 family inet address 10.88.18.29/31
set interfaces et-0/0/103 description "[type=UL, nbr=SPN-004.SEA3:et-3/0/34, ip=4]"
set interfaces et-0/0/103 unit 0 description "[type=UL, nbr=SPN-004.SEA3:et-3/0/34, ip=4]"
set interfaces et-0/0/103 unit 0 family inet address 10.88.19.29/31
set interfaces xe-0/0/11 description "[type=SER, ip=4]"
set interfaces xe-0/0/11 ether-options 802.3ad ae111
set interfaces xe-0/0/12 description "[type=SER, ip=4]"
set interfaces xe-0/0/12 ether-options 802.3ad ae112
set interfaces xe-0/0/13 description "[type=SER, ip=4]"
set interfaces xe-0/0/13 ether-options 802.3ad ae113
set interfaces xe-0/0/14 description "[type=SER, ip=4]"
set interfaces xe-0/0/14 ether-options 802.3ad ae114
set interfaces xe-0/0/15 description "[type=SER, ip=4]"
set interfaces xe-0/0/15 ether-options 802.3ad ae115
set interfaces xe-0/0/16 description "[type=SER, ip=4]"
set interfaces xe-0/0/16 ether-options 802.3ad ae116
set interfaces xe-0/0/17 description "[type=SER, ip=4]"
set interfaces xe-0/0/17 ether-options 802.3ad ae117
set interfaces xe-0/0/18 description "[type=SER, ip=4]"
set interfaces xe-0/0/18 ether-options 802.3ad ae118
set interfaces xe-0/0/19 description "[type=SER, ip=4]"
set interfaces xe-0/0/19 ether-options 802.3ad ae119
set interfaces xe-0/0/20 description "[type=SER, ip=4]"
set interfaces xe-0/0/20 ether-options 802.3ad ae120
set interfaces xe-0/0/21 description "[type=SER, ip=4]"
set interfaces xe-0/0/21 ether-options 802.3ad ae121
set interfaces xe-0/0/22 description "[type=SER, ip=4]"
set interfaces xe-0/0/22 ether-options 802.3ad ae122
set interfaces xe-0/0/23 description "[type=SER, ip=4]"
set interfaces xe-0/0/23 ether-options 802.3ad ae123
set interfaces xe-0/0/24 description "[type=SER, ip=4]"
set interfaces xe-0/0/24 ether-options 802.3ad ae124
set interfaces xe-0/0/25 description "[type=SER, ip=4]"
set interfaces xe-0/0/25 ether-options 802.3ad ae125
set interfaces xe-0/0/26 description "[type=SER, ip=4]"
set interfaces xe-0/0/26 ether-options 802.3ad ae126
set interfaces xe-0/0/27 description "[type=SER, ip=4]"
set interfaces xe-0/0/27 ether-options 802.3ad ae127
set interfaces xe-0/0/28 description "[type=SER, ip=4]"
set interfaces xe-0/0/28 ether-options 802.3ad ae128
set interfaces xe-0/0/29 description "[type=SER, ip=4]"
set interfaces xe-0/0/29 ether-options 802.3ad ae129
set interfaces xe-0/0/30 description "[type=SER, ip=4]"
set interfaces xe-0/0/30 ether-options 802.3ad ae130
set interfaces xe-0/0/46 description "[type=UL, nbr=msw-007.SEA3:XE-0-2-1, ip=4]"
set interfaces xe-0/0/46 enable
set interfaces xe-0/0/46 ether-options 802.3ad ae1
set interfaces xe-0/0/48 description "[type=SER, ip=4]"
set interfaces xe-0/0/48 ether-options 802.3ad ae200
set interfaces xe-0/0/49 description "[type=SER, ip=4]"
set interfaces xe-0/0/49 ether-options 802.3ad ae201
set interfaces xe-0/0/50 description "[type=SER, ip=4]"
set interfaces xe-0/0/50 ether-options 802.3ad ae202
set interfaces xe-0/0/51 description "[type=SER, ip=4]"
set interfaces xe-0/0/51 ether-options 802.3ad ae203
set interfaces xe-0/0/52 description "[type=SER, ip=4]"
set interfaces xe-0/0/52 ether-options 802.3ad ae204
set interfaces xe-0/0/53 description "[type=SER, ip=4]"
set interfaces xe-0/0/53 ether-options 802.3ad ae205
set interfaces xe-0/0/54 description "[type=SER, ip=4]"
set interfaces xe-0/0/54 ether-options 802.3ad ae206
set interfaces xe-0/0/55 description "[type=SER, ip=4]"
set interfaces xe-0/0/55 ether-options 802.3ad ae207
set interfaces xe-0/0/56 description "[type=SER, ip=4]"
set interfaces xe-0/0/56 ether-options 802.3ad ae208
set interfaces xe-0/0/57 description "[type=SER, ip=4]"
set interfaces xe-0/0/57 ether-options 802.3ad ae209
set interfaces xe-0/0/58 description "[type=SER, ip=4]"
set interfaces xe-0/0/58 ether-options 802.3ad ae210
set interfaces xe-0/0/59 description "[type=SER, ip=4]"
set interfaces xe-0/0/59 ether-options 802.3ad ae211
set interfaces xe-0/0/60 description "[type=SER, ip=4]"
set interfaces xe-0/0/60 ether-options 802.3ad ae212
set interfaces xe-0/0/61 description "[type=SER, ip=4]"
set interfaces xe-0/0/61 ether-options 802.3ad ae213
set interfaces xe-0/0/62 description "[type=SER, ip=4]"
set interfaces xe-0/0/62 ether-options 802.3ad ae214
set interfaces xe-0/0/63 description "[type=SER, ip=4]"
set interfaces xe-0/0/63 ether-options 802.3ad ae215
set interfaces xe-0/0/64 description "[type=SER, ip=4]"
set interfaces xe-0/0/64 ether-options 802.3ad ae216
set interfaces xe-0/0/65 description "[type=SER, ip=4]"
set interfaces xe-0/0/65 ether-options 802.3ad ae217
set interfaces xe-0/0/66 description "[type=SER, ip=4]"
set interfaces xe-0/0/66 ether-options 802.3ad ae218
set interfaces xe-0/0/67 description "[type=SER, ip=4]"
set interfaces xe-0/0/67 ether-options 802.3ad ae219
set interfaces xe-0/0/68 description "[type=SER, ip=4]"
set interfaces xe-0/0/68 ether-options 802.3ad ae220
set interfaces xe-0/0/69 description "[type=SER, ip=4]"
set interfaces xe-0/0/69 ether-options 802.3ad ae221
set interfaces xe-0/0/70 description "[type=SER, ip=4]"
set interfaces xe-0/0/70 ether-options 802.3ad ae222
set interfaces xe-0/0/71 description "[type=SER, ip=4]"
set interfaces xe-0/0/71 ether-options 802.3ad ae223
set interfaces xe-0/0/72 description "[type=SER, ip=4]"
set interfaces xe-0/0/72 ether-options 802.3ad ae224
set interfaces xe-0/0/73 description "[type=SER, ip=4]"
set interfaces xe-0/0/73 ether-options 802.3ad ae225
set interfaces xe-0/0/74 description "[type=SER, ip=4]"
set interfaces xe-0/0/74 ether-options 802.3ad ae226
set interfaces xe-0/0/75 description "[type=SER, ip=4]"
set interfaces xe-0/0/75 ether-options 802.3ad ae227
set interfaces xe-0/0/76 description "[type=SER, ip=4]"
set interfaces xe-0/0/76 ether-options 802.3ad ae228
set interfaces xe-0/0/77 description "[type=SER, ip=4]"
set interfaces xe-0/0/77 ether-options 802.3ad ae229
set interfaces xe-0/0/78 description "[type=SER, ip=4]"
set interfaces xe-0/0/78 ether-options 802.3ad ae230
set interfaces et-0/0/96 description "[type=CL, nbr=hsw-003A.SEA3:ET-0-0-48, ip=4]"
set interfaces et-0/0/96 enable
set interfaces et-0/0/96 ether-options 802.3ad ae0
set interfaces et-0/0/97 description "[type=CL, nbr=hsw-003A.SEA3:ET-0-0-49, ip=4]"
set interfaces et-0/0/97 enable
set interfaces et-0/0/97 ether-options 802.3ad ae0
set interfaces et-0/0/98 description "[type=BU, ip=4] Flashblade"
set interfaces et-0/0/98 ether-options 802.3ad ae2
set interfaces et-0/0/99 description "[type=BU, ip=4] Flashblade"
set interfaces et-0/0/99 ether-options 802.3ad ae2
set interfaces ae0 apply-groups-except MC-LAG-GENERIC
set interfaces ae0 apply-groups-except MC-LAG-B
set interfaces ae0 description "[type=CL, nbr=hsw-003A.SEA3:XE-0-0-0, XE-0-0-1]"
set interfaces ae0 aggregated-ether-options minimum-links 1
set interfaces ae0 aggregated-ether-options lacp active
set interfaces ae0 aggregated-ether-options lacp periodic fast
set interfaces ae0 unit 0 description "[type=CL, nbr=hsw-003A.SEA3:XE-0-0-0, XE-0-0-1]"
set interfaces ae0 unit 0 family ethernet-switching interface-mode trunk
set interfaces ae0 unit 0 family ethernet-switching vlan members OSPF
set interfaces ae0 unit 0 family ethernet-switching vlan members OOB
set interfaces ae0 unit 0 family ethernet-switching vlan members DB
set interfaces ae0 unit 0 family ethernet-switching vlan members BU
set interfaces ae1 description "[type=UL, nbr=msw-007.SEA3:XE-0-2-1]"
set interfaces ae1 aggregated-ether-options mc-ae mc-ae-id 1
set interfaces ae1 unit 0 description "[type=UL, nbr=msw-007.SEA3:XE-0-2-1]"
set interfaces ae1 unit 0 family ethernet-switching interface-mode trunk
set interfaces ae1 unit 0 family ethernet-switching vlan members OOB
set interfaces ae2 description "[type=BU] Flashblade"
set interfaces ae2 aggregated-ether-options mc-ae mc-ae-id 2
set interfaces ae2 unit 0 description "[type=BU]"
set interfaces ae2 unit 0 family ethernet-switching interface-mode trunk
set interfaces ae2 unit 0 family ethernet-switching vlan members BU
set interfaces ae2 unit 0 family ethernet-switching vlan members OOB
set interfaces ae100 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae100 aggregated-ether-options mc-ae mc-ae-id 100
set interfaces ae100 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae100 unit 0 family ethernet-switching vlan members BU
set interfaces ae101 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae101 aggregated-ether-options mc-ae mc-ae-id 101
set interfaces ae101 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae101 unit 0 family ethernet-switching vlan members BU
set interfaces ae102 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae102 aggregated-ether-options mc-ae mc-ae-id 102
set interfaces ae102 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae102 unit 0 family ethernet-switching vlan members BU
set interfaces ae103 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae103 aggregated-ether-options mc-ae mc-ae-id 103
set interfaces ae103 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae103 unit 0 family ethernet-switching vlan members BU
set interfaces ae104 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae104 aggregated-ether-options mc-ae mc-ae-id 104
set interfaces ae104 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae104 unit 0 family ethernet-switching vlan members BU
set interfaces ae105 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae105 aggregated-ether-options mc-ae mc-ae-id 105
set interfaces ae105 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae105 unit 0 family ethernet-switching vlan members BU
set interfaces ae106 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae106 aggregated-ether-options mc-ae mc-ae-id 106
set interfaces ae106 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae106 unit 0 family ethernet-switching vlan members BU
set interfaces ae107 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae107 aggregated-ether-options mc-ae mc-ae-id 107
set interfaces ae107 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae107 unit 0 family ethernet-switching vlan members BU
set interfaces ae108 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae108 aggregated-ether-options mc-ae mc-ae-id 108
set interfaces ae108 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae108 unit 0 family ethernet-switching vlan members BU
set interfaces ae109 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae109 aggregated-ether-options mc-ae mc-ae-id 109
set interfaces ae109 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae109 unit 0 family ethernet-switching vlan members BU
set interfaces ae110 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae110 aggregated-ether-options mc-ae mc-ae-id 110
set interfaces ae110 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae110 unit 0 family ethernet-switching vlan members BU
set interfaces ae111 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae111 aggregated-ether-options mc-ae mc-ae-id 111
set interfaces ae111 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae111 unit 0 family ethernet-switching vlan members BU
set interfaces ae112 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae112 aggregated-ether-options mc-ae mc-ae-id 112
set interfaces ae112 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae112 unit 0 family ethernet-switching vlan members BU
set interfaces ae113 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae113 aggregated-ether-options mc-ae mc-ae-id 113
set interfaces ae113 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae113 unit 0 family ethernet-switching vlan members BU
set interfaces ae114 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae114 aggregated-ether-options mc-ae mc-ae-id 114
set interfaces ae114 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae114 unit 0 family ethernet-switching vlan members BU
set interfaces ae115 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae115 aggregated-ether-options mc-ae mc-ae-id 115
set interfaces ae115 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae115 unit 0 family ethernet-switching vlan members BU
set interfaces ae116 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae116 aggregated-ether-options mc-ae mc-ae-id 116
set interfaces ae116 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae116 unit 0 family ethernet-switching vlan members BU
set interfaces ae117 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae117 aggregated-ether-options mc-ae mc-ae-id 117
set interfaces ae117 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae117 unit 0 family ethernet-switching vlan members BU
set interfaces ae118 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae118 aggregated-ether-options mc-ae mc-ae-id 118
set interfaces ae118 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae118 unit 0 family ethernet-switching vlan members BU
set interfaces ae119 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae119 aggregated-ether-options mc-ae mc-ae-id 119
set interfaces ae119 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae119 unit 0 family ethernet-switching vlan members BU
set interfaces ae120 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae120 aggregated-ether-options mc-ae mc-ae-id 120
set interfaces ae120 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae120 unit 0 family ethernet-switching vlan members BU
set interfaces ae121 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae121 aggregated-ether-options mc-ae mc-ae-id 121
set interfaces ae121 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae121 unit 0 family ethernet-switching vlan members BU
set interfaces ae122 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae122 aggregated-ether-options mc-ae mc-ae-id 122
set interfaces ae122 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae122 unit 0 family ethernet-switching vlan members BU
set interfaces ae123 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae123 aggregated-ether-options mc-ae mc-ae-id 123
set interfaces ae123 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae123 unit 0 family ethernet-switching vlan members BU
set interfaces ae124 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae124 aggregated-ether-options mc-ae mc-ae-id 124
set interfaces ae124 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae124 unit 0 family ethernet-switching vlan members BU
set interfaces ae125 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae125 aggregated-ether-options mc-ae mc-ae-id 125
set interfaces ae125 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae125 unit 0 family ethernet-switching vlan members BU
set interfaces ae126 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae126 aggregated-ether-options mc-ae mc-ae-id 126
set interfaces ae126 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae126 unit 0 family ethernet-switching vlan members BU
set interfaces ae127 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae127 aggregated-ether-options mc-ae mc-ae-id 127
set interfaces ae127 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae127 unit 0 family ethernet-switching vlan members BU
set interfaces ae128 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae128 aggregated-ether-options mc-ae mc-ae-id 128
set interfaces ae128 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae128 unit 0 family ethernet-switching vlan members BU
set interfaces ae129 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae129 aggregated-ether-options mc-ae mc-ae-id 129
set interfaces ae129 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae129 unit 0 family ethernet-switching vlan members BU
set interfaces ae130 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae130 aggregated-ether-options mc-ae mc-ae-id 130
set interfaces ae130 unit 0 description "[type=SER, nbr=BUx.SEA3:GB1-2]"
set interfaces ae130 unit 0 family ethernet-switching vlan members BU
set interfaces ae200 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae200 aggregated-ether-options mc-ae mc-ae-id 200
set interfaces ae200 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae200 unit 0 family ethernet-switching vlan members DB
set interfaces ae201 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae201 aggregated-ether-options mc-ae mc-ae-id 201
set interfaces ae201 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae201 unit 0 family ethernet-switching vlan members DB
set interfaces ae202 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae202 aggregated-ether-options mc-ae mc-ae-id 202
set interfaces ae202 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae202 unit 0 family ethernet-switching vlan members DB
set interfaces ae203 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae203 aggregated-ether-options mc-ae mc-ae-id 203
set interfaces ae203 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae203 unit 0 family ethernet-switching vlan members DB
set interfaces ae204 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae204 aggregated-ether-options mc-ae mc-ae-id 204
set interfaces ae204 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae204 unit 0 family ethernet-switching vlan members DB
set interfaces ae205 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae205 aggregated-ether-options mc-ae mc-ae-id 205
set interfaces ae205 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae205 unit 0 family ethernet-switching vlan members DB
set interfaces ae206 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae206 aggregated-ether-options mc-ae mc-ae-id 206
set interfaces ae206 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae206 unit 0 family ethernet-switching vlan members DB
set interfaces ae207 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae207 aggregated-ether-options mc-ae mc-ae-id 207
set interfaces ae207 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae207 unit 0 family ethernet-switching vlan members DB
set interfaces ae208 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae208 aggregated-ether-options mc-ae mc-ae-id 208
set interfaces ae208 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae208 unit 0 family ethernet-switching vlan members DB
set interfaces ae209 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae209 aggregated-ether-options mc-ae mc-ae-id 209
set interfaces ae209 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae209 unit 0 family ethernet-switching vlan members DB
set interfaces ae210 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae210 aggregated-ether-options mc-ae mc-ae-id 210
set interfaces ae210 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae210 unit 0 family ethernet-switching vlan members DB
set interfaces ae211 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae211 aggregated-ether-options mc-ae mc-ae-id 211
set interfaces ae211 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae211 unit 0 family ethernet-switching vlan members DB
set interfaces ae212 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae212 aggregated-ether-options mc-ae mc-ae-id 212
set interfaces ae212 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae212 unit 0 family ethernet-switching vlan members DB
set interfaces ae213 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae213 aggregated-ether-options mc-ae mc-ae-id 213
set interfaces ae213 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae213 unit 0 family ethernet-switching vlan members DB
set interfaces ae214 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae214 aggregated-ether-options mc-ae mc-ae-id 214
set interfaces ae214 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae214 unit 0 family ethernet-switching vlan members DB
set interfaces ae215 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae215 aggregated-ether-options mc-ae mc-ae-id 215
set interfaces ae215 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae215 unit 0 family ethernet-switching vlan members DB
set interfaces ae216 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae216 aggregated-ether-options mc-ae mc-ae-id 216
set interfaces ae216 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae216 unit 0 family ethernet-switching vlan members DB
set interfaces ae217 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae217 aggregated-ether-options mc-ae mc-ae-id 217
set interfaces ae217 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae217 unit 0 family ethernet-switching vlan members DB
set interfaces ae218 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae218 aggregated-ether-options mc-ae mc-ae-id 218
set interfaces ae218 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae218 unit 0 family ethernet-switching vlan members DB
set interfaces ae219 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae219 aggregated-ether-options mc-ae mc-ae-id 219
set interfaces ae219 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae219 unit 0 family ethernet-switching vlan members DB
set interfaces ae220 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae220 aggregated-ether-options mc-ae mc-ae-id 220
set interfaces ae220 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae220 unit 0 family ethernet-switching vlan members DB
set interfaces ae221 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae221 aggregated-ether-options mc-ae mc-ae-id 221
set interfaces ae221 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae221 unit 0 family ethernet-switching vlan members DB
set interfaces ae222 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae222 aggregated-ether-options mc-ae mc-ae-id 222
set interfaces ae222 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae222 unit 0 family ethernet-switching vlan members DB
set interfaces ae223 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae223 aggregated-ether-options mc-ae mc-ae-id 223
set interfaces ae223 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae223 unit 0 family ethernet-switching vlan members DB
set interfaces ae224 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae224 aggregated-ether-options mc-ae mc-ae-id 224
set interfaces ae224 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae224 unit 0 family ethernet-switching vlan members DB
set interfaces ae225 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae225 aggregated-ether-options mc-ae mc-ae-id 225
set interfaces ae225 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae225 unit 0 family ethernet-switching vlan members DB
set interfaces ae226 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae226 aggregated-ether-options mc-ae mc-ae-id 226
set interfaces ae226 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae226 unit 0 family ethernet-switching vlan members DB
set interfaces ae227 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae227 aggregated-ether-options mc-ae mc-ae-id 227
set interfaces ae227 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae227 unit 0 family ethernet-switching vlan members DB
set interfaces ae228 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae228 aggregated-ether-options mc-ae mc-ae-id 228
set interfaces ae228 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae228 unit 0 family ethernet-switching vlan members DB
set interfaces ae229 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae229 aggregated-ether-options mc-ae mc-ae-id 229
set interfaces ae229 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae229 unit 0 family ethernet-switching vlan members DB
set interfaces ae230 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae230 aggregated-ether-options mc-ae mc-ae-id 230
set interfaces ae230 unit 0 description "[type=SER, nbr=BUx.SEA3:GB3-4]"
set interfaces ae230 unit 0 family ethernet-switching vlan members DB
set interfaces em0 unit 0 family inet address 172.22.5.3/25
set interfaces irb apply-groups VRRP-COMMON
set interfaces irb apply-groups VRRP-GR2
set interfaces irb unit 102 description "[type=SVI, ip=4, ospf=88] SEA-DB-VLAN"
set interfaces irb unit 102 family inet filter output SEA-DB-OUT
set interfaces irb unit 102 family inet address 10.88.161.3/25 arp 10.88.161.2 l2-interface ae0.0 mac d0:07:ca:45:b2:c0
set interfaces irb unit 102 family inet address 10.88.161.3/25 vrrp-group 102 virtual-address 10.88.161.1
set interfaces irb unit 103 description "[type=SVI,ip=4,ospf=88] SEA-Backup-VLAN"
set interfaces irb unit 103 family inet filter output SEA-BU-OUT
set interfaces irb unit 103 family inet address 10.88.193.3/25 arp 10.88.193.2 l2-interface ae0.0 mac d0:07:ca:45:b2:c0
set interfaces irb unit 103 family inet address 10.88.193.3/25 vrrp-group 103 virtual-address 10.88.193.1
set interfaces irb unit 401 description "[type=SVI, ip=4, ospf=88] SEA-TOR-P2P"
set interfaces irb unit 401 family inet address 10.88.20.15/31
set interfaces lo0 description "[type=LO, ospf=88]"
set interfaces lo0 unit 0 description "[type=LO, ospf=88]"
set interfaces lo0 unit 0 family inet address 10.88.253.23/32 primary
set interfaces lo0 unit 0 family inet address 10.88.253.23/32 preferred
set multi-chassis multi-chassis-protection 10.88.20.14 interface ae0
set snmp name HSW-003b.SEA3.test.com
set snmp location "[sn=VB3717350085, dc=SEA3, rack=SEA:C534:0523]"
set snmp trap-options source-address 10.88.253.23
set forwarding-options storm-control-profiles sc all
set forwarding-options dhcp-relay server-group DHCP-SERVERS 10.252.80.10
set forwarding-options dhcp-relay server-group DHCP-SERVERS 10.252.80.11
set forwarding-options dhcp-relay server-group DHCP-SERVERS 10.252.84.10
set forwarding-options dhcp-relay server-group DHCP-SERVERS 10.252.84.11
set forwarding-options dhcp-relay group DHCP active-server-group DHCP-SERVERS
set forwarding-options dhcp-relay group DHCP interface irb.102
set forwarding-options dhcp-relay group DHCP interface irb.103
set routing-options static route 0.0.0.0/0 next-hop 10.88.16.28
set routing-options static route 0.0.0.0/0 preference 250
set routing-options router-id 10.88.253.23
set protocols bgp apply-groups IBGP
set protocols bgp log-updown
set protocols bgp local-as 64523
set protocols bgp group IBGP-SPN import TOR-IMPORT-SPN
set protocols bgp group IBGP-SPN export TOR-EXPORT-SPN
set protocols bgp group IBGP-SPN multipath
set protocols bgp group IBGP-SPN neighbor 10.88.16.28 description SPN-001
set protocols bgp group IBGP-SPN neighbor 10.88.17.28 description SPN-002
set protocols bgp group IBGP-SPN neighbor 10.88.18.28 description SPN-003
set protocols bgp group IBGP-SPN neighbor 10.88.19.28 description SPN-004
set protocols ospf apply-groups OSPF
set protocols ospf export REDISTRIBUTE-INTO-OSPF
set protocols ospf area 0.0.0.88 stub
set protocols ospf area 0.0.0.88 interface lo0.0 apply-groups-except OSPF
set protocols ospf area 0.0.0.88 interface lo0.0 passive
set protocols ospf area 0.0.0.88 interface irb.401 interface-type p2p
set protocols ospf area 0.0.0.88 interface et-0/0/100.0 interface-type p2p
set protocols ospf area 0.0.0.88 interface et-0/0/101.0 interface-type p2p
set protocols ospf area 0.0.0.88 interface et-0/0/102.0 interface-type p2p
set protocols ospf area 0.0.0.88 interface et-0/0/103.0 interface-type p2p
set protocols iccp local-ip-addr 10.88.20.15
set protocols iccp peer 10.88.20.14 session-establishment-hold-time 50
set protocols iccp peer 10.88.20.14 backup-liveness-detection backup-peer-ip 172.22.5.2
set protocols iccp peer 10.88.20.14 liveness-detection minimum-receive-interval 1000
set protocols iccp peer 10.88.20.14 liveness-detection transmit-interval minimum-interval 1000
set protocols lldp port-id-subtype interface-name
set protocols lldp interface all
set protocols lldp-med interface all
set protocols igmp-snooping vlan all
set protocols rstp bridge-priority 8k
set protocols rstp interface ae100 edge
set protocols rstp interface ae101 edge
set protocols rstp interface ae102 edge
set protocols rstp interface ae103 edge
set protocols rstp interface ae104 edge
set protocols rstp interface ae105 edge
set protocols rstp interface ae106 edge
set protocols rstp interface ae107 edge
set protocols rstp interface ae108 edge
set protocols rstp interface ae109 edge
set protocols rstp interface ae110 edge
set protocols rstp interface ae111 edge
set protocols rstp interface ae112 edge
set protocols rstp interface ae113 edge
set protocols rstp interface ae114 edge
set protocols rstp interface ae115 edge
set protocols rstp interface ae116 edge
set protocols rstp interface ae117 edge
set protocols rstp interface ae118 edge
set protocols rstp interface ae119 edge
set protocols rstp interface ae120 edge
set protocols rstp interface ae121 edge
set protocols rstp interface ae122 edge
set protocols rstp interface ae123 edge
set protocols rstp interface ae124 edge
set protocols rstp interface ae125 edge
set protocols rstp interface ae126 edge
set protocols rstp interface ae127 edge
set protocols rstp interface ae128 edge
set protocols rstp interface ae129 edge
set protocols rstp interface ae130 edge
set protocols rstp interface ae200 edge
set protocols rstp interface ae201 edge
set protocols rstp interface ae202 edge
set protocols rstp interface ae203 edge
set protocols rstp interface ae204 edge
set protocols rstp interface ae205 edge
set protocols rstp interface ae206 edge
set protocols rstp interface ae207 edge
set protocols rstp interface ae208 edge
set protocols rstp interface ae209 edge
set protocols rstp interface ae210 edge
set protocols rstp interface ae211 edge
set protocols rstp interface ae212 edge
set protocols rstp interface ae213 edge
set protocols rstp interface ae214 edge
set protocols rstp interface ae215 edge
set protocols rstp interface ae216 edge
set protocols rstp interface ae217 edge
set protocols rstp interface ae218 edge
set protocols rstp interface ae219 edge
set protocols rstp interface ae220 edge
set protocols rstp interface ae221 edge
set protocols rstp interface ae222 edge
set protocols rstp interface ae223 edge
set protocols rstp interface ae224 edge
set protocols rstp interface ae225 edge
set protocols rstp interface ae226 edge
set protocols rstp interface ae227 edge
set protocols rstp interface ae228 edge
set protocols rstp interface ae229 edge
set protocols rstp interface ae230 edge
set protocols rstp bpdu-block-on-edge
set policy-options prefix-list BGP-IP4-PEERS apply-path "protocols bgp group <*> neighbor <*.*>"
set policy-options prefix-list NTP-SERVERS apply-path "system ntp server <*>"
set policy-options prefix-list DEFAULT-GATEWAY 0.0.0.0/0
set policy-options prefix-list DC-INFRA 10.251.0.0/16
set policy-options prefix-list DC-INFRA 10.252.0.0/16
set policy-options prefix-list DC-INFRA2 10.242.0.0/15
set policy-options prefix-list LOOPBACKS 10.250.0.0/16
set policy-options prefix-list OPS 10.4.250.75/32
set policy-options prefix-list OPS 10.16.14.110/32
set policy-options prefix-list OPS 10.64.14.37/32
set policy-options prefix-list OPS 10.64.14.238/32
set policy-options prefix-list OPS 10.65.14.162/32
set policy-options prefix-list OPS 10.201.15.29/32
set policy-options prefix-list OPS 10.202.14.36/32
set policy-options prefix-list OPS 10.252.0.49/32
set policy-options prefix-list INT-MGMT 10.251.0.0/16
set policy-options prefix-list SECUREVPN 10.255.16.0/20
set policy-options prefix-list SECUREVPN 199.91.137.248/32
set policy-options prefix-list SECUREVPN 199.91.139.248/32
set policy-options prefix-list SECUREVPN 199.91.141.248/32
set policy-options prefix-list MARTIANS 0.0.0.0/8
set policy-options prefix-list MARTIANS 127.0.0.0/8
set policy-options prefix-list MARTIANS 169.254.0.0/16
set policy-options prefix-list MARTIANS 192.0.2.0/24
set policy-options prefix-list MARTIANS 224.0.0.0/3
set policy-options prefix-list RFC1918 10.0.0.0/8
set policy-options prefix-list RFC1918 172.16.0.0/12
set policy-options prefix-list RFC1918 192.168.0.0/16
set policy-options prefix-list INT-MGMT 172.16.0.0/12
set policy-options prefix-list SPN-POD-SPACE 10.88.0.0/16
set policy-options policy-statement REDISTRIBUTE-INTO-OSPF term ACCEPT_STATIC_777 from protocol static
set policy-options policy-statement REDISTRIBUTE-INTO-OSPF term ACCEPT_STATIC_777 from tag 777
set policy-options policy-statement REDISTRIBUTE-INTO-OSPF term ACCEPT_STATIC_777 then accept
set policy-options policy-statement REDISTRIBUTE-INTO-OSPF term REJECT then reject
set policy-options policy-statement TOR-EXPORT-SPN term DIRECT from protocol direct
set policy-options policy-statement TOR-EXPORT-SPN term DIRECT from prefix-list-filter SPN-POD-SPACE orlonger
set policy-options policy-statement TOR-EXPORT-SPN term DIRECT then accept
set policy-options policy-statement TOR-EXPORT-SPN term REJECT then reject
set policy-options policy-statement TOR-IMPORT-SPN term DEFAULT from prefix-list DEFAULT-GATEWAY
set policy-options policy-statement TOR-IMPORT-SPN term DEFAULT then accept
set policy-options policy-statement TOR-IMPORT-SPN term REJECT then reject
set firewall family inet filter SEA-DB-OUT term ALLOW-ICMP from protocol icmp
set firewall family inet filter SEA-DB-OUT term ALLOW-ICMP from icmp-type echo-reply
set firewall family inet filter SEA-DB-OUT term ALLOW-ICMP from icmp-type echo-request
set firewall family inet filter SEA-DB-OUT term ALLOW-ICMP from icmp-type time-exceeded
set firewall family inet filter SEA-DB-OUT term ALLOW-ICMP from icmp-type unreachable
set firewall family inet filter SEA-DB-OUT term ALLOW-ICMP then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-OSPF from protocol ospf
set firewall family inet filter SEA-DB-OUT term ALLOW-OSPF then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-VRRP from protocol vrrp
set firewall family inet filter SEA-DB-OUT term ALLOW-VRRP then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-TCP-ESTAB from protocol tcp
set firewall family inet filter SEA-DB-OUT term ALLOW-TCP-ESTAB from tcp-established
set firewall family inet filter SEA-DB-OUT term ALLOW-TCP-ESTAB then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-DNS-RESPONSE from source-address 10.0.8.54/255.0.255.255
set firewall family inet filter SEA-DB-OUT term ALLOW-DNS-RESPONSE from source-address 10.248.0.11/255.254.0.255
set firewall family inet filter SEA-DB-OUT term ALLOW-DNS-RESPONSE from protocol udp
set firewall family inet filter SEA-DB-OUT term ALLOW-DNS-RESPONSE from source-port 53
set firewall family inet filter SEA-DB-OUT term ALLOW-DNS-RESPONSE then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-VPN-NETWORKS from source-prefix-list SECUREVPN
set firewall family inet filter SEA-DB-OUT term ALLOW-VPN-NETWORKS then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-NTP from source-prefix-list NTP-SERVERS
set firewall family inet filter SEA-DB-OUT term ALLOW-NTP from protocol udp
set firewall family inet filter SEA-DB-OUT term ALLOW-NTP from source-port 123
set firewall family inet filter SEA-DB-OUT term ALLOW-NTP then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-MGMT-FROM-INFRASTRUCTURE from source-address 10.0.14.0/255.0.254.0
set firewall family inet filter SEA-DB-OUT term ALLOW-MGMT-FROM-INFRASTRUCTURE from source-address 10.252.0.0/16
set firewall family inet filter SEA-DB-OUT term ALLOW-MGMT-FROM-INFRASTRUCTURE from source-address 10.242.0.0/15
set firewall family inet filter SEA-DB-OUT term ALLOW-MGMT-FROM-INFRASTRUCTURE then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-SECURITY from source-address 10.0.250.0/255.0.254.0
set firewall family inet filter SEA-DB-OUT term ALLOW-SECURITY then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from source-address 10.0.31.64/255.0.255.192
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from source-address 10.0.32.64/255.0.224.192
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from source-address 10.0.64.64/255.0.224.192
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from source-address 10.0.160.0/255.0.224.0
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from source-address 10.0.31.128/255.0.255.192
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from source-address 10.0.32.128/255.0.224.192
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from source-address 10.0.64.128/255.0.224.192
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from source-address 10.0.192.0/255.0.224.0
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from protocol tcp
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from destination-port 22
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH from destination-port 1022
set firewall family inet filter SEA-DB-OUT term ALLOW-SSH then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-1520-TO-1540 from source-address 10.0.31.0/255.0.255.128
set firewall family inet filter SEA-DB-OUT term ALLOW-1520-TO-1540 from source-address 10.0.32.0/255.0.224.128
set firewall family inet filter SEA-DB-OUT term ALLOW-1520-TO-1540 from source-address 10.0.64.0/255.0.224.128
set firewall family inet filter SEA-DB-OUT term ALLOW-1520-TO-1540 from source-address 10.0.128.0/255.0.192.0
set firewall family inet filter SEA-DB-OUT term ALLOW-1520-TO-1540 from source-address 10.0.248.64/255.0.255.192
set firewall family inet filter SEA-DB-OUT term ALLOW-1520-TO-1540 from protocol tcp
set firewall family inet filter SEA-DB-OUT term ALLOW-1520-TO-1540 from destination-port 1520-1540
set firewall family inet filter SEA-DB-OUT term ALLOW-1520-TO-1540 then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-STATD-FROM-NFS from source-address 10.0.31.128/255.0.255.192
set firewall family inet filter SEA-DB-OUT term ALLOW-STATD-FROM-NFS from source-address 10.0.32.128/255.0.224.192
set firewall family inet filter SEA-DB-OUT term ALLOW-STATD-FROM-NFS from source-address 10.0.64.128/255.0.224.192
set firewall family inet filter SEA-DB-OUT term ALLOW-STATD-FROM-NFS from source-address 10.0.192.0/19
set firewall family inet filter SEA-DB-OUT term ALLOW-STATD-FROM-NFS from protocol tcp
set firewall family inet filter SEA-DB-OUT term ALLOW-STATD-FROM-NFS from source-port 2020
set firewall family inet filter SEA-DB-OUT term ALLOW-STATD-FROM-NFS then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from source-address 10.0.31.0/255.0.255.128
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from source-address 10.0.32.0/255.0.224.128
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from source-address 10.0.64.0/255.0.224.128
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from source-address 10.0.128.0/255.0.192.0
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from source-address 10.0.248.64/255.0.255.192
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from protocol tcp
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from destination-port 2100
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from destination-port 2200
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX from destination-port 2300
set firewall family inet filter SEA-DB-OUT term ALLOW-ORACLE-SHAREPLEX then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-MONGODB from source-address 10.0.31.0/255.0.255.128
set firewall family inet filter SEA-DB-OUT term ALLOW-MONGODB from source-address 10.0.32.0/255.0.224.128
set firewall family inet filter SEA-DB-OUT term ALLOW-MONGODB from source-address 10.0.64.0/255.0.224.128
set firewall family inet filter SEA-DB-OUT term ALLOW-MONGODB from source-address 10.0.128.0/255.0.192.0
set firewall family inet filter SEA-DB-OUT term ALLOW-MONGODB from protocol tcp
set firewall family inet filter SEA-DB-OUT term ALLOW-MONGODB from destination-port 29900-29999
set firewall family inet filter SEA-DB-OUT term ALLOW-MONGODB from destination-port 30900-30999
set firewall family inet filter SEA-DB-OUT term ALLOW-MONGODB then accept
set firewall family inet filter SEA-DB-OUT term ALLOW-MYSQL from source-address 10.0.31.0/255.0.255.128
set firewall family inet filter SEA-DB-OUT term ALLOW-MYSQL from source-address 10.0.32.0/255.0.224.128
set firewall family inet filter SEA-DB-OUT term ALLOW-MYSQL from source-address 10.0.64.0/255.0.224.128
set firewall family inet filter SEA-DB-OUT term ALLOW-MYSQL from source-address 10.0.128.0/255.0.192.0
set firewall family inet filter SEA-DB-OUT term ALLOW-MYSQL from source-address 10.0.248.64/255.0.255.192
set firewall family inet filter SEA-DB-OUT term ALLOW-MYSQL from protocol tcp
set firewall family inet filter SEA-DB-OUT term ALLOW-MYSQL from destination-port 3300-3899
set firewall family inet filter SEA-DB-OUT term ALLOW-MYSQL then accept
set firewall family inet filter SEA-DB-OUT term REJECT then discard
set firewall family inet filter SEA-BU-OUT term ALLOW-ICMP from protocol icmp
set firewall family inet filter SEA-BU-OUT term ALLOW-ICMP from icmp-type echo-reply
set firewall family inet filter SEA-BU-OUT term ALLOW-ICMP from icmp-type echo-request
set firewall family inet filter SEA-BU-OUT term ALLOW-ICMP from icmp-type time-exceeded
set firewall family inet filter SEA-BU-OUT term ALLOW-ICMP from icmp-type unreachable
set firewall family inet filter SEA-BU-OUT term ALLOW-ICMP then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-OSPF from protocol ospf
set firewall family inet filter SEA-BU-OUT term ALLOW-OSPF then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-VRRP from protocol vrrp
set firewall family inet filter SEA-BU-OUT term ALLOW-VRRP then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-TCP-ESTAB from protocol tcp
set firewall family inet filter SEA-BU-OUT term ALLOW-TCP-ESTAB from tcp-established
set firewall family inet filter SEA-BU-OUT term ALLOW-TCP-ESTAB then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-DNS-RESPONSE from source-address 10.0.8.54/255.0.255.255
set firewall family inet filter SEA-BU-OUT term ALLOW-DNS-RESPONSE from source-address 10.248.0.11/255.254.0.255
set firewall family inet filter SEA-BU-OUT term ALLOW-DNS-RESPONSE from protocol udp
set firewall family inet filter SEA-BU-OUT term ALLOW-DNS-RESPONSE from source-port 53
set firewall family inet filter SEA-BU-OUT term ALLOW-DNS-RESPONSE then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-VPN-NETWORKS from source-prefix-list SECUREVPN
set firewall family inet filter SEA-BU-OUT term ALLOW-VPN-NETWORKS then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-NTP from source-prefix-list NTP-SERVERS
set firewall family inet filter SEA-BU-OUT term ALLOW-NTP from protocol udp
set firewall family inet filter SEA-BU-OUT term ALLOW-NTP from source-port 123
set firewall family inet filter SEA-BU-OUT term ALLOW-NTP then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-MGMT-FROM-INFRASTRUCTURE from source-address 10.0.14.0/255.0.254.0
set firewall family inet filter SEA-BU-OUT term ALLOW-MGMT-FROM-INFRASTRUCTURE from source-address 10.252.0.0/16
set firewall family inet filter SEA-BU-OUT term ALLOW-MGMT-FROM-INFRASTRUCTURE from source-address 10.242.0.0/15
set firewall family inet filter SEA-BU-OUT term ALLOW-MGMT-FROM-INFRASTRUCTURE then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-SECURITY from source-address 10.0.250.0/255.0.254.0
set firewall family inet filter SEA-BU-OUT term ALLOW-SECURITY then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from source-address 10.0.31.64/255.0.255.192
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from source-address 10.0.32.64/255.0.224.192
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from source-address 10.0.64.64/255.0.224.192
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from source-address 10.0.160.0/255.0.224.0
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from source-address 10.0.31.128/255.0.255.192
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from source-address 10.0.32.128/255.0.224.192
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from source-address 10.0.64.128/255.0.224.192
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from source-address 10.0.192.0/255.0.224.0
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from protocol tcp
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from destination-port 22
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH from destination-port 1022
set firewall family inet filter SEA-BU-OUT term ALLOW-SSH then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from source-address 10.0.31.64/255.0.255.192
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from source-address 10.0.32.64/255.0.224.192
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from source-address 10.0.64.64/255.0.224.192
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from source-address 10.0.160.0/255.0.224.0
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from source-address 10.0.192.0/255.0.224.0
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from protocol tcp
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from destination-port 2049
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from destination-port 111
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from destination-port 875
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from destination-port 892
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from destination-port 32803
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS from destination-port 662
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-TCP-PORTS then accept
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from source-address 10.0.31.64/255.0.255.192
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from source-address 10.0.32.64/255.0.224.192
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from source-address 10.0.64.64/255.0.224.192
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from source-address 10.0.160.0/255.0.224.0
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from source-address 10.0.192.0/255.0.224.0
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from protocol udp
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from destination-port 875
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from destination-port 32769
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from destination-port 892
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS from destination-port 662
set firewall family inet filter SEA-BU-OUT term ALLOW-ORACLE-TO-NFS-UDP-PORTS then accept
set firewall family inet filter SEA-BU-OUT term REJECT then discard
set switch-options service-id 10
set vlans BU vlan-id 103
set vlans BU l3-interface irb.103
set vlans DB vlan-id 102
set vlans DB l3-interface irb.102
set vlans DEAD_VLAN vlan-id 666
set vlans OOB vlan-id 104
set vlans OSPF vlan-id 401
set vlans OSPF l3-interface irb.401
