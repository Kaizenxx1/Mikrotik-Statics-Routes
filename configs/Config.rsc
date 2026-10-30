# oct/30/2026 05:15:34 by RouterOS 6.49.20
# software id = 
#
#
#
/interface vlan
add interface=ether2 name=CCTV vlan-id=20
add interface=ether2 name=Datos vlan-id=10
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=10.10.10.10-10.10.10.250
add name=dhcp_pool1 ranges=10.20.20.20-10.20.20.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=Datos name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=CCTV name=dhcp2
/ip address
add address=10.10.10.1/24 interface=Datos network=10.10.10.0
add address=10.20.20.1/24 interface=CCTV network=10.20.20.0
/ip dhcp-client
add disabled=no interface=ether1 use-peer-dns=no
/ip dhcp-server network
add address=10.10.10.0/24 dns-server=1.1.1.1 gateway=10.10.10.1
add address=10.20.20.0/24 dns-server=1.1.1.1 gateway=10.20.20.1
/ip dns
set allow-remote-requests=yes servers=1.1.1.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add distance=1 dst-address=10.10.11.0/24 gateway=10.0.0.13
/system identity
set name=MikroTik-Site-A
