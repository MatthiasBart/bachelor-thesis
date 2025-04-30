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
    (
      key: "owl", short: "OWL", long: "Open Wireless Link", desc: [A project by students of TU Darmstadt studying Apple's wireless protocols.]
    ), 
    (
      key: "seemoo", short: "SEEMOO", long: "Secure Mobile Networking Lab", desc: [Part of CS Department at TU Darmstadt working on intersection of mobile and wireless communication and IT security.]
    ),
    ( 
      key: "sl", short: "SL", long: "Sidelink", desc: [A standardized 5G technology that enables direct device-to-device interaction without the need for a base station.]
    ), 
    (
      key: "nr", short: "NR", long: "New Radio", desc: [5G New Radio (NR) is the global standard for a unified more capable 5G wireless interface.]
    ),
    (
      key: "tcp", short: "TCP", long: "Transport Control Protocol", desc: []
    ),
    (
      key: "tls", short: "TLS", long: "Transport Layer Security", desc: []
    ), 
    (
      key: "udp", short: "UDP", long: "User Datagram Protocol", desc: []
    ),
    (
      key: "sdk", short: "SDK", long: "Software Development Kit", desc: []
    ), 
    (
      key: "nist", short: "NIST", long: "National Institute of Standards and Technology", desc: []
    ), 
    (
      key: "iot", short: "IoT", long: "Internet of Things", desc: []
    ),
    (
      key: "ip", short: "IP", long: "Internet Protocol", desc: []
    ),
    (
      key: "ietf", short: "IETF", long: "Internet Engineering Task Force", desc: []
    ), 
    (
      key: "ips", short: "IPS", long: "Internet Protocol Suite", desc: []
    ),
    (
      key: "psi", short: "PSI", long: "Private Set Interchange", desc: []
    ), 
    (
      key: "icann", short: "PSI", long: "Private Set Intersection", desc: []
    ),
    (
      key: "iab", short: "PSI", long: "Private Set Intersection", desc: []
    ),
    (
      key: "ieee", short: "IEEE", long: "I", desc: []
    ), 
    (
      key: "uuid", short: "UUID", long: "Universal Unique Identifier", desc: []
    ), 
    (
      key: "ho", short: "HO", long: "Handoff", desc: []
    ), 
    (
      key: "uc", short: "UC", long: "Universal Clipboard", desc: []
    ), 
    (
      key: "wifi", short: "Wi-Fi", desc: []
    ), 
    (
      key: "gsm", short: "GSM", long: "Global System for Mobile Communications ", desc: []
    ), 
    (
      key: "cdma", short: "CDMA", long: "Code Division Multiple Access", desc: []
    ),
    (
      key: "pws", short: "PWS", long: "Password Sharing", desc: []
    ), 
    (
      key: "isp", short: "ISP", long: "Internet Service Provider", desc: []
    ), 
    (
      key: "ios", short: "iOS", desc: []
    ), 
    (
      key: "ipados", short: "iPadOS", desc: []
    ), 
    (
      key: "macos", short: "macOS", desc: []
    ),
    (
      key: "caa", short: "CAA", long: "Congestive-Avoidance Algorithms", desc: []
    ), 
    ( 
      key: "rfemf", short: "RF-EMF", long: "Radio Frequency Electro Magnetic Field", desc: []
    ),
    (
      key: "mp3", short: "MP3", long: "", desc: []
    ),
    (
      key: "sms", short: "SMS", long: "", desc: []
    ), 
    (
      key: "nfc", short: "NFC", long: "Near g", desc: []
    ),
    (
      key: "uva", short: "UVA", long: "Unmanned Aerial Vehicles", desc: []
    ),
    ( 
      key: "v2x", short: "V2X", long: "Vehicle To Everything", desc: []
    ),
    (
      key: "prose", short: "ProSe", long: "Proximity Services", desc: []
    ),
    (
      key: "lte", short: "LTE", long: "Long Term Evolution", desc: []
    ), 
    (
      key: "5g", short: "5G", desc: []
    ), 
    (
      key: "ble", short: "BLE", long: "Bluetooth Low Energy", desc: []
    ),
    (
      key: "mitm", short: "MitM", long: "Man in the Middle", desc: []
    ), 
    (
      key: "dos", short: "DoS", long: "Denial of Service", desc: []
    ), 
    (
      key: "mac", short: "MAC", long: "Media Access Control", desc: []
    ), 
    (
      key: "pc", short: "PC", long: "Personal Computer", desc: []
    ),
    (
      key: "poc", short: "PoC", long: "Proof of Concept", desc: []
    ),
    (
      key: "of", short: "OF", long: "Offline Finding", desc: []
    ),
    (
      key: "rfc", short: "RFC", long: "Request For Comment", desc:  []
    ), 
    (
      key: "uwb", short: "UWB", long: "Ultra Wide Band", desc: []
    ), 
    (
      key: "bsd", short: "BSD", long: "Berkley Software Development", desc: []
    ),
    (
      key: "ide", short: "IDE", long: "Integrated Development Environment", desc: []
    ), 
    (
      key: "url", short: "URL", long: "Universal Resource Locator", desc: []
    ), 
    (
      key: "mvvm", short: "MVVM", long: "Model View View Model", desc: []
    ), 
    ( 
      key: "gui", short: "GUI", long: "Graphical User Interface", desc: []
    ),
    (
      key: "tvos", short: "tvOS", desc: []
    ),
    (
      key: "wwdc", short: "WWDC", long: "World Wide Developer Conference", desc: []
    )
)

// Hints:
// * Usage within text will then be #gls(<key>) or plurals #glspl(<key>)
