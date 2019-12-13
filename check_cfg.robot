*** Settings ***
Documentation  Check config file for MANRS standards compliance

Library  OperatingSystem
Library  String
Library  Collections
Library  ${CURDIR}/ManrsBatfish.py  test

*** Test Cases ***
Get active interfaces
#get all active interfaces in the snapshot
    @{active_interfaces}=  get interfaces  active=true
    ${length} =  get length  ${active_interfaces}
    log to console  Found ${length} active interfaces
    set global variable  @{active_interfaces}


ACLs being applied to single homed stub customers to prevent them from sending spoofed traffic - IPv4
#checking whether an input filter is applied on every interface
    @{ifaces_without_incoming_filter} =  Get Interfaces Without Incoming Filter  interfaces_to_consider=${active_interfaces}
    Length Should Be  ${ifaces_without_incoming_filter}  0


Are inbound routing advertisements from customers and peers secured by applying prefix-level filters?
#checking whether import policies are applied to each peer
    @{bgp_peers_without_import_policy} =  Get Bgp Peers Without Import Policy
    Length Should Be  ${bgp_peers_without_import_policy}  0
