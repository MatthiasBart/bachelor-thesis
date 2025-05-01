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
      key: "tcp", short: "TCP", long: "Transport Control Protocol", desc: [Transport Layer protocol used for reliable, ordered and error checked delivery.]
    ),
    (
      key: "tls", short: "TLS", long: "Transport Layer Security", desc: [Cryptographic protocol that provides communication security on top of the Transport Layer.]
    ), 
    (
      key: "udp", short: "UDP", long: "User Datagram Protocol", desc: [Connectionless Transport Layer protocol used to transfer data.]
    ),
    (
      key: "quic", short: "QUIC", desc: [Transport protocol built upon UDP that offers faster and more secure data transfers.]
    ),
    (
      key: "sdk", short: "SDK", long: "Software Development Kit", desc: [Collection of software tools developers use to create applications.]
    ), 
    (
      key: "nist", short: "NIST", long: "National Institute of Standards and Technology", desc: [Standardization Institute for the United States.]
    ), 
    (
      key: "iot", short: "IoT", long: "Internet of Things", desc: [Network of devices that communicate without active user interaction like sensors.]
    ),
    (
      key: "ip", short: "IP", long: "Internet Protocol", desc: [Numerical address used to route traffic in the internet.]
    ),
    (
      key: "ietf", short: "IETF", long: "Internet Engineering Task Force", desc: [Standardization Institute for the Internet Protocol Suite.]
    ), 
    (
      key: "ips", short: "IPS", long: "Internet Protocol Suite", desc: [Set of network communication protocols specified by the IETF.]
    ),
    (
      key: "psi", short: "PSI", long: "Private Set Intersection", desc: [Cryptographic technique to exchange the intersection of the datasets without revealing it to other parties.]
    ), 
    (
      key: "icann", short: "ICANN", long: "Internet Corporation for Assigned Names and Numbers", desc: [Non-profit organization that coordinates the Domain Name System and Internet Protocol address spaces.]
    ),
    (
      key: "iab", short: "IAB", long: "Internet Architecture Board", desc: [Committee of the IETF overseeing technical and standard development of the Internet.]
    ),
    (
      key: "ieee", short: "IEEE", long: "Institute of Electrical and Electronics Engineers", desc: [World's largest technical professional organization aiming to advance technology.]
    ), 
    (
      key: "uuid", short: "UUID", long: "Universal Unique Identifier", desc: [128-bit value used to uniquely identify information.]
    ), 
    (
      key: "ho", short: "HO", long: "Handoff", desc: [Apple feature that allows to seamlessly switch from one device to the other.]
    ), 
    (
      key: "uc", short: "UC", long: "Universal Clipboard", desc: [Apple feature that allows to share a clipboard between devices.]
    ), 
    (
      key: "wifi", short: "Wi-Fi", desc: [A trademark for wireless network protocols which are based on the IEEE 802.11.]
    ), 
    (
      key: "gsm", short: "GSM", long: "Global System for Mobile Communications ", desc: [Family of second generation digital cellular network standards.]
    ), 
    (
      key: "cdma", short: "CDMA", long: "Code Division Multiple Access", desc: [Channel method used to transmit data using the same frequency band.]
    ),
    (
      key: "pws", short: "PWS", long: "Password Sharing", desc: [Apple feature that allows to share the password for the current Wi-Fi with a known contact.]
    ), 
    (
      key: "isp", short: "ISP", long: "Internet Service Provider", desc: [Organizations that provide customers access to the internet.]
    ), 
    (
      key: "ios", short: "iOS", desc: [Moblie operating system developed by Apple primarily used on iPhones.]
    ), 
    (
      key: "ipados", short: "iPadOS", desc: [Moblie operating system developed by Apple primarily used on iPads.]
    ), 
    (
      key: "macos", short: "macOS", desc: [Operating system developed by Apple primarily used on Apple Computers.]
    ),
    (
      key: "caa", short: "CAA", long: "Congestive-Avoidance Algorithms", desc: [Algorithms preventing networks from becoming overloaded and leading to a congestion collapse.]
    ), 
    ( 
      key: "rfemf", short: "RF-EMF", long: "Radio Frequency Electro Magnetic Field", desc: [Radiation of electro magnetic spectrum between 100kHz and 300GHz.]
    ),
    (
      key: "mp3", short: "MP3", desc: [Coding format for digital audio.]
    ),
    (
      key: "sms", short: "SMS", long: "Short Message Service", desc: [Protocol for exchanging short messages over a cellular network.]
    ), 
    (
      key: "nfc", short: "NFC", long: "Near Field Communication", desc: [Short range wireless technology to communicate over very small distances.]
    ),
    (
      key: "uva", short: "UVA", long: "Unmanned Aerial Vehicles", desc: [Autonomously guided or remotely controlled military aircrafts.]
    ),
    ( 
      key: "v2x", short: "V2X", long: "Vehicle To Everything", desc: [Wireless communication between a vehicle surrounding entities which might interfere.]
    ),
    (
      key: "prose", short: "ProSe", long: "Proximity Services", desc: [3GPP specification that allows devices to detect and communicate to each other directly.]
    ),
    (
      key: "lte", short: "LTE", long: "Long Term Evolution", desc: [Wireless broadband technology used for cellular communication.]
    ), 
    (
      key: "5g", short: "5G", desc: [Successor of 4G and LTE.]
    ), 
    (
      key: "ble", short: "BLE", long: "Bluetooth Low Energy", desc: [Bluetooth specification designed to consume less power.]
    ),
    (
      key: "mitm", short: "MitM", long: "Man in the Middle", desc: [Man in the Middle Attack describes a cyberattack where an attacker intercepts a connection without the knowledge of the communicating parties.]
    ), 
    (
      key: "dos", short: "DoS", long: "Denial of Service", desc: [A cyberattack that makes the device under attack unavailable on the network.]
    ), 
    (
      key: "mac", short: "MAC", long: "Media Access Control", desc: [Unique address used for addressing on local networks.]
    ), 
    (
      key: "pc", short: "PC", long: "Personal Computer", desc: [Computer designed for an individual user.]
    ),
    (
      key: "poc", short: "PoC", long: "Proof of Concept", desc: [Outcome of a project or experiment which proofes the feasibility of a design.]
    ),
    (
      key: "of", short: "OF", long: "Offline Finding", desc: [Crowdsourced network that allows to find devices that are not connected to the internet.]
    ),
    (
      key: "rfc", short: "RFC", long: "Request For Comment", desc:  [Documents that contain technical specification for the Internet.]
    ), 
    (
      key: "uwb", short: "UWB", long: "Ultra Wide Band", desc: [Wireless communication technology that uses a wide frequency band but little power density, offering high precision locating.]
    ), 
    (
      key: "bsd", short: "BSD", long: "Berkley Software Distribution", desc: [Discontinued Unix operating system.]
    ),
    (
      key: "ide", short: "IDE", long: "Integrated Development Environment", desc: [An application that provides comprehensive facilities for software development.]
    ), 
    (
      key: "url", short: "URL", long: "Universal Resource Locator", desc: [Web address of a resource on the internet.]
    ), 
    (
      key: "mvvm", short: "MVVM", long: "Model View View Model", desc: [Software architectural pattern which is used for developing user facing applications.]
    ), 
    ( 
      key: "gui", short: "GUI", long: "Graphical User Interface", desc: [Visual way users can interact with software.]
    ),
    (
      key: "tvos", short: "tvOS", desc: [Operating system developed by Apple primarily used on Apple TVs.]
    ),
    (
      key: "wwdc", short: "WWDC", long: "World Wide Developer Conference", desc: [Conference held annually by Apple to share new technology.]
    ), 
    (
      key: "xcode", long: "XCode", desc: [Integrated development environment used to develop applications for the Apple ecosystem.]
    ), 
    (
      key: "swift", long: "Swift", docs: [General purpose language initially developed by Apple maintained by an open source community.]
    )
)

// Hints:
// * Usage within text will then be #gls(<key>) or plurals #glspl(<key>)
