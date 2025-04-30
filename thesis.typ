// IIT Institute of Software Design and Security
// FH JOANNEUM (fhj)
// Template for a Bachelor's and Master's thesis

// central place where libraries are imported
// (or macros are defined)
// which are used within all the chapters:
#import "chapters/global.typ": *

// Definitions for the glossary must be defined (i.e. registered)
// before the main document is processed
#import "chapters/glossary-definitions.typ": gls-entries
#register-glossary(gls-entries)


#show: doc => thesis(
  // Logo should be ok for a thesis at IIT, the
  // Institute of Software Design and Security (see https://www.fh-joanneum.at/iit)
  logo: image("./figures/logo.svg", width: 32%),
  // Your study programme
  // Master:
  //   ims ... IT & Mobile Security (see https://www.fh-joanneum.at/ims)
  //   irm ... IT-Recht & Management (see https://www.fh-joanneum.at/irm)
  // Bachelor:
  //   swd ... Software Design & Cloud Computing (VZ) (see https://www.fh-joanneum.at/itm)
  //   swd ... Software Design & Cloud Computing (BB) (see https://www.fh-joanneum.at/swd)
  //   msd ... Mobile Software Development (see https://www.fh-joanneum.at/msd)
  study: "swd", // ims, irm, swd, msd
  // For study programme "ims" the language is required to be in English
  language: "en", // en, de
  title: "Direct Peer to Peer Communication on iOS Devices",
  // Optional subtitle. Set to none if you do not need a subtitle.
  subtitle: "When mediator based technology is not available", supervisor: "DI Johannes Feiner", author: "Matthias Bartholomäus",
  // E.g. "Dezember 2025" or "Dec / 2025"
  submission-date: "February 2025",
  // For study programme "IMS"
  // the German abstract is optional, i.e. set to none.
  abstract-ge: [
    Moderne Mobilgeräte können eine Vielzahl an Kommunikationstechnologien nutzen. Neben unterschiedlichen Anwendungsmöglichkeiten und Protokollen müssen Standards wie Bluetooth, WiFi oder 5G drahtlos sein, um Daten im modernen Kontext übertragen zu können. In den letzten Jahren hat sich die weltweite wirtschaftliche Nachfrage auf die Forschung und Entwicklung ausgewirkt, und so die Datenübertragung und die Hardware von Smartphones erheblich verbessert. Dies hat dazu geführt, dass im Jahr 2024 weltweit über 4 Milliarden Smartphones genutzt werden @statista_research_department_number_2024, 27 % davon unter iOS. Leider sind die meisten der auf Smartphones verwendeten Kommunikationsmethoden auf Infrastruktur angewiesen. Ein Router in einem lokalen Netz oder ein Sendemast in einem Mobilfunknetz, ohne diese Knoten kann keine Verbindung zwischen zwei Endgeräten hergestellt werden, egal wie nah diese sein mögen. In diesen Szenarien kann die Kommunikation zwischen zwei mobilen iOS-Geräten über Bluetooth oder Ad-hoc-WiFi hergestellt werden, da diese keine bereits vorhandene Infrastruktur benötigen und sich ausschließlich auf lokale Broadcasts stützen, wobei letztere Technologie empfohlen wird. Aufgrund der jüngsten Fortschritte bei diesen Technologien ist unklar, wie gut direkte #gls("ptp")-Netzwerke in verschiedenen Umgebungen funktionieren und wie die Wahl des Transportprotokolls die Verbindung beeinflusst. In dieser Arbeit wird ein iOS-Prototyp entwickelt, der zwei Endgeräte über Apple Wireless Direct Link (AWDL) verbindet und Metriken misst, die die Qualität der Verbindung beschreiben, wie Round Trip Time (RTT), Jitter, Datengeschwindigkeit und mehr. Die Ergebnisse zeigen, dass AWDL die besten Werte erzielt, wenn es in einer Umgebung mit geringer Funkfrequenzbelastung getestet wird. Messungen des Prototypen zeigen auch, dass UDP die schnellste Datenübertragungsrate erreicht, allerdings mit einem Kompromiss bei den Datenverlusten. Ein Resümee zeigt, dass AWDL auf iOS-Geräten noch nicht für die Weitbereichskommunikation oder den Aufbau zuverlässiger Mesh-Netzwerke geeignet ist, aber für Anwendungen mit geringer Entfernung eingesetzt werden kann.
  ], abstract-en: [
    Modern mobile devices can make use of a wide variety of communication technologies. Besides having different applicabilities and protocols, standards like Bluetooth, WiFi or 5G need to be wireless to seamlessly transfer data. In resent years global economic demand has impacted research and development to vastly improve data transmission and hardware on smartphones. As of 2024 this led to over 4 billion smartphones users worldwide @statista_research_department_number_2024, 27% covered by iOS. Unfortunately most of the communication methods used on smartphones all rely on mediators. Be it a router in a local network or a cell tower in a cellular network, without these nodes a connection between two peers can not be established, no matter how close neighboring devices may be. However in scenarios where the required infrastructure is not available, communication between two mobile iOS devices can be established via Bluetooth or ad hoc WiFi since these do not required pre-existing infrastructure and purely rely on local radio broadcast, whereas the latter is recommended to use. Due to the latest advancements in these technologies, it is unclear how good direct #gls("ptp") networks work under different surroundings and how the choice of the transport protocol affects the connection. In this thesis, an iOS prototype is developed, that connects two peers via Apple Wireless Direct Link (AWDL) and measures metrics that describe the quality of the connection like Round Trip Time (RTT), Jitter, data speed and more. The results show that AWDL achieves the best metrics when tested in surroundings with low radio frequency pollution. Prototype measurements also show that UDP achieves the fastest data rates, with a compromise on data loss. In consideration of the findings, it can be stated that AWDL on iOS devices is not yet ready for wide area communication or building reliable mesh networks, but can be utilized for low distance applications.
    // #todo(
    //   [TODO: Write the abstract in English and in German, called Kurzfassung. Describe
    //     in about 250 to 350 words the problem, the innovation, the method, the results
    //     and implications.],
    // )
  ],
  // Add some (3 to 7) keywords
  keywords: ("FHJ", "SWD", "iOS", "peer-to-peer", "ad-hoc", "smartphone", "Apple"),
  // Enable/disable outlines for "listings", "tables","equations", and/or "figures"
  show-list-of: ("listings", "tables", "figures"),
  // The *.bib file with the bibliography entries
  biblio: bibliography("biblio.bib", style: "./biblio.csl"),
  // Do not change this
  // Note: 'doc' stands for the rest of this file, the documement
  doc,
)

// Include as many chapters as you like
// e.g.:

#include "./chapters/acknowledgements.typ"
#pagebreak()

#include "./chapters/1-intro.typ"
#pagebreak()

#include "./chapters/2-related.typ"
#pagebreak()

#include "./chapters/3-background.typ"
#pagebreak()

#include "./chapters/4-concept.typ"
#pagebreak()

#include "./chapters/5-implementation.typ"
#pagebreak()

#include "./chapters/6-evaluation.typ"
#pagebreak()

#include "./chapters/7-conclusion.typ"
#pagebreak()

#include "./chapters/glossary.typ"
#pagebreak()

// = Theories and Sensitizing Concepts
// Already back 2001 the Proem project (Kortuem et al., 2001) examined different aspects of peer-to-peer (P2P) applications for ad hoc networks. They already noticed the trend for a ever larger becoming applicability of personal mobile devices for data sharing but listed resources of mobile devices among other possible limitations. This facet has fastly changed since then and several new ideas like ShAir (Dubois et al., 2013), a middleware infrasructure for P2P sharing between mobile devices or mFerio (Balan et al., 2009), a P2P mobile payment system have emerged. The working group of mFerio already noticed the problem that mobile devices rely too heavily on static infrastructure. Fortunately hardware of modern smartphones has matured and has gotten support for Bluetooth, WiFi Direct and Apple’s Multipeer Connectivity, which were used by Newport in his approach to develop a new gossip algorithm for a local P2P communication system (2017). Though approaches existed to also introduce LTE-Direct, no support for this technology is given on mobile smartphones (Gallo and Härri, 2013). This is why this thesis will focus on the available technologies WiFi-Direct and Bluetooth, which work under the hood of Apple’s Multipeer Connectivity.

// = Annotated bibliography

// == mFerio

// #par(hanging-indent: 1em)[
// Balan, R. K., Ramasubbu, N., Prakobphol, K., Christin, N., et al. (2009) mFerio: the design and evaluation of a peertopeer mobile payment system. In: Proceedings of the 7th International Conference on Mobile Systems, Applications, and Services. MobiSys '09. [Online]. 2009 Kraków, Poland, Association for Computing Machinery. pp. 291–304. DOI:10.1145/1555816.1555846.
// ]

// This study explores mFerio, an NFC-based mobile P2P payment app designed to replace cash transactions. The authors outline key payment system criteria and demonstrate how mFerio improves usability and security. A user study with 104 participants shows that mFerio is fast, accurate, and easier to use than cash, with lower cognitive load. This research is relevant to mobile payment development and usability studies.

// == ShAir

// #par(hanging-indent: 1em)[
// Dubois, D. J., Bando, Y., Watanabe, K. & Holtzman, H. (2013) ShAir: extensible middleware for mobile peertopeer resource sharing. In: Proceedings of the 2013 9th Joint Meeting on Foundations of Software Engineering. ESEC/FSE 2013. [Online]. 2013 Saint Petersburg, Russia, Association for Computing Machinery. pp. 687–690. DOI:10.1145/2491411.2494573.
// ]

// This paper presents ShAir, a middleware infrastructure enabling transparent resource sharing among mobile devices. ShAir abstracts the creation of delay-tolerant P2P networks, supports various hardware and protocols, and adapts dynamically at runtime. The authors discuss its design, extensibility, and application development potential, highlighting a file-sharing use case. This study is relevant to mobile P2P networking and resource-sharing research.

// == LTE-Direct

// #par(hanging-indent: 1em)[
// Gallo, L., Härri, J. (2013) Short paper: A LTEdirect broadcast mechanism for periodic vehicular safety communications. In: 2013 IEEE Vehicular Networking Conference. [Online]. 2013 pp. 166–169. DOI:10.1109/VNC.2013.6737604.
// ]

// This paper explores an extension of LTE-Direct for broadcast/multicast vehicular safety communications. The authors propose an eMBMS-inspired resource allocation mechanism that enables direct UE-to-UE communication without requiring connection procedures. They demonstrate its flexibility for broadcasting safety messages, positioning LTE-Direct as a complement to DSRC in vehicular networks. This study is relevant to researchers in wireless communication and intelligent transportation systems.

// == Proem

// #par(hanging-indent: 1em)[
// Kortuem, G., Schneider, J., Preuitt, D., Thompson, T., et al. (2001) When peertopeer comes facetoface: collaborative peertopeer computing in mobile adhoc networks. In: Proceedings First International Conference on Peer-to-Peer Computing. [Online]. 2001 pp. 75–91. DOI:10.1109/P2P.2001.990429.
// ]

// This paper introduces ad hoc mobile information systems, where autonomous mobile devices form decentralized, self-organizing P2P networks. The authors discuss application scenarios, technical challenges, and present Proem, a P2P system for mobile ad hoc applications. Proem has also been used as an instructional tool for peer-to-peer computing. This study is relevant to mobile networking and distributed system research.

// == Gossip 

// #par(hanging-indent: 1em)[
// Newport, C. (2017) Gossip in a Smartphone PeertoPeer Network. In: Proceedings of the ACM Symposium on Principles of Distributed Computing. PODC '17. [Online]. 2017 Washington, DC, USA, Association for Computing Machinery. pp. 43–52. DOI:10.1145/3087801.3087813.
// ]

// This paper examines gossip algorithms in the mobile telephone model, a variation of the classical telephone model tailored to P2P communication in smartphones. The authors analyze randomized gossip strategies under dynamic network conditions, demonstrating the impact of limited information exchange. They present solutions leveraging shared and pseudorandomness and explore performance improvements in stable topologies. These findings contribute to understanding efficient communication in mobile networks.
