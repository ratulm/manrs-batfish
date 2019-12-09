*** Settings ***
Documentation  Check config file for MANRS standards compliance

Library  ManrsBatfish  test

*** Test Cases ***
Check for config file
    Check Interface Acl  ratul  good boy

