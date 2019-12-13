*** Settings ***
Documentation  Check config file for MANRS standards compliance

Library  OperatingSystem
Library  String
Library  Collections
Library  ${CURDIR}/ManrsBatfish.py  test

*** Variables ***
@{EMPTY LIST}

*** Test Cases ***
ACLs being applied to single homed stub customers to prevent them from sending spoofed traffic - IPv4
#checking whether an input filter is applied on every interface
    @{ifaces_without_incoming_filter} =  Get Interfaces Without Incoming Filter
    Log List  ${ifaces_without_incoming_filter}  WARN
    Lists Should Be Equal  ${ifaces_without_incoming_filter}  ${EMPTY LIST}  WARN


Are inbound routing advertisements from customers and peers secured by applying prefix-level filters?
#checking whether import policies are applied to each peer
    @{bgp_peers_without_import_policy} =  Get Bgp Peers Without Import Policy
    Log List  ${bgp_peers_without_import_policy}  WARN
    Lists Should Be Equal  ${bgp_peers_without_import_policy}  ${EMPTY LIST}  WARN
