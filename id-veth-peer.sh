#! /bin/bash

namespaces=()

while read namespace; do
    namespaces+=($namespace)
done <<<"$(ip netns | awk '{print $1}')"

PS3='Select a netns: '
select ns in "${namespaces[@]}"; do
    devs=()
    while read dev; do
        devs+=($dev)
    done <<<"$(ip netns exec $ns ip -o link | awk -F': ' '$2 !~ /lo/ {print $2}' | sed 's/@.*$//g')"
    PS3='Select an interface: '
    select dev in "${devs[@]}"; do
        peernum=$(ip netns exec $ns ethtool -S $dev | awk '/peer/{print $2}')
        peername=$(ip l | awk -v peernum="$peernum" '$0 ~ ("^"peernum":") {print substr($2, 1, length($2) - 1) }')
        break
    done
    echo 'name of peer interface in root netns: $peername'
    break
done
