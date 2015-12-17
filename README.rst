======
id-veth-peer.sh
======

Creating a veth pair makes two interfaces, but there is no simple way to identify which interface is paired with which other interface. This is a simple bash script to identify the peer interface of a given veth interface in a linux specified linux network namespace.

I found this helpful in understanding various openstack network configurations.

Run it, and it gives selections: 
::

    # ./id-veth-peer.sh 
    1) qrouter-88e3bd7f-793a-4d3f-8854-3b8f7942834a
    2) qdhcp-9fc1fb38-7139-4b4c-810d-36498079662c
    3) qdhcp-dbcb506b-10e4-4a63-9cf9-1c26114e4879
    Select a netns: 2
    1) ns-35a8b7a6-dd
    Select an interface: 1
    Peer: tap35a8b7a6-dd@if2



