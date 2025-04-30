// * Add list of terms

#let gls-entries = (
    (
      key: "ptp", short: "P2P", long: "Peer to Peer", desc: [Peer to Peer is a term for direct communication between nodes, where no underlying infrastructure is needed.],
    ),
    (
      key: "rtt", short: "RTT", long: "Round Trip Time", desc: [A time measurement that indicates how long a package travels between sender, receiver and back to sender again.]
    ), 
    (
      key: "awdl", short: "AWDL", long: "Apple Wireless Direct Link", desc: [An Apple proprietary protocol used for peer-to-peer communication.]
    ), 
    (
      key: "api", short: "API", long: "Application Programming Interface", desc: [A defined interface used to plug software components/applications together.]
    ),
    (
      key: "mdns", short: "mDNS", long: "multicast Domain Name System", desc: [Network protocol to resolve hostnames wihin local network without relying on central DNS server.]
    ), 
    (
      key: "manet", short: "MANET", long: "Mobile Ad Hoc Networks", desc: [Decentralized type of a wireless network. Each node participates in routing.]
    ), 
    (
      key: "d2d", short: "D2D", long: "device-to-device", desc: [Used to describe communication between user equipments in cellular networks without using an intermediary base station.]
    ), 
    (
      key: "ue", short: "UE", long: "User Equipment", desc: [Any device used directly by an end user in cellular networks.]
    ), 
    (
      key: "gnb", short: "gNB", long: "Next Generation Node B", desc: [A base station in 5G networks.]
    ), 
)

// Hints:
// * Usage within text will then be #gls(<key>) or plurals #glspl(<key>)
