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
  submission-date: "May 2025",
  // For study programme "IMS"
  // the German abstract is optional, i.e. set to none.
  abstract-ge: [
    Moderne Mobilgeräte können eine Vielzahl an Kommunikationstechnologien nutzen. Neben unterschiedlichen Anwendungsmöglichkeiten und Protokollen müssen Standards wie Bluetooth, #gls("wifi") oder #gls("5g") drahtlos sein, um Daten im modernen Kontext übertragen zu können. In den letzten Jahren hat sich die weltweite wirtschaftliche Nachfrage auf die Forschung und Entwicklung ausgewirkt, und so die Datenübertragung und die Hardware von Smartphones erheblich verbessert. Dies hat dazu geführt, dass im Jahr 2024 weltweit über 4 Milliarden Smartphones genutzt werden @statista_research_department_number_2024, 27 % davon unter #gls("ios"). Leider sind die meisten der auf Smartphones verwendeten Kommunikationsmethoden auf Infrastruktur angewiesen. Ein Router in einem lokalen Netz oder ein Sendemast in einem Mobilfunknetz, ohne diese Knoten kann keine Verbindung zwischen zwei Endgeräten hergestellt werden, egal wie nah diese sein mögen. In diesen Szenarien kann die Kommunikation zwischen zwei mobilen #gls("ios")-Geräten über Bluetooth oder ad-hoc #gls("wifi") hergestellt werden, da diese keine bereits vorhandene Infrastruktur benötigen und sich ausschließlich auf lokale Broadcasts stützen, wobei letztere Technologie empfohlen wird. Aufgrund der jüngsten Fortschritte bei diesen Technologien ist unklar, wie gut direkte #gls("ptp")-Netzwerke in verschiedenen Umgebungen funktionieren und wie die Wahl des Transportprotokolls die Verbindung beeinflusst. In dieser Arbeit wird ein #gls("ios")-Prototyp entwickelt, der zwei Endgeräte über #gls("awdl") verbindet und Metriken misst, die die Qualität der Verbindung beschreiben, wie #gls("rtt"), Jitter, Datengeschwindigkeit und mehr. Die Ergebnisse zeigen, dass #gls("awdl") die besten Werte erzielt, wenn es in einer Umgebung mit geringer Funkfrequenzbelastung getestet wird. Messungen des Prototypen zeigen auch, dass UDP die schnellste Datenübertragungsrate erreicht, allerdings mit einem Kompromiss bei den Datenverlusten. Ein Resümee zeigt, dass #gls("awdl") auf #gls("ios")-Geräten noch nicht für die Weitbereichskommunikation oder den Aufbau zuverlässiger Mesh-Netzwerke geeignet ist, aber für Anwendungen mit geringer Entfernung eingesetzt werden kann.
  ], abstract-en: [
    Modern mobile devices can make use of a wide variety of communication technologies. Besides having different applicabilities and protocols, standards like Bluetooth, #gls("wifi") or #gls("5g") need to be wireless to seamlessly transfer data. In resent years global economic demand has impacted research and development to vastly improve data transmission and hardware on smartphones. As of 2024 this led to over 4 billion smartphones users worldwide @statista_research_department_number_2024, 27% covered by #gls("ios"). Unfortunately most of the communication methods used on smartphones all rely on mediators. Be it a router in a local network or a cell tower in a cellular network, without these nodes a connection between two peers can not be established, no matter how close neighboring devices may be. However in scenarios where the required infrastructure is not available, communication between two mobile #gls("ios") devices can be established via Bluetooth or ad hoc #gls("wifi") since these do not required pre-existing infrastructure and purely rely on local radio broadcast, whereas the latter is recommended to use. Due to the latest advancements in these technologies, it is unclear how good direct #gls("ptp") networks work under different surroundings and how the choice of the transport protocol affects the connection. In this thesis, an #gls("ios") prototype is developed, that connects two peers via #gls("awdl") and measures metrics that describe the quality of the connection like #gls("rtt"), Jitter, data speed and more. The results show that #gls("awdl") achieves the best metrics when tested in surroundings with low radio frequency pollution. Prototype measurements also show that #gls("udp") achieves the fastest data rates, with a compromise on data loss. In consideration of the findings, it can be stated that #gls("awdl") on #gls("ios") devices is not yet ready for wide area communication or building reliable mesh networks, but can be utilized for low distance applications.
  ],
  // Add some (3 to 7) keywords
  keywords: ("FHJ", "SWD", "iOS", "peer-to-peer", "ad-hoc", "smartphone", "AWDL", "iPhone"),
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
#show heading.where(level: 5): set heading(numbering: none)
#show heading.where(level: 6): set heading(numbering: none)

#include "./chapters/acknowledgements.typ"
#pagebreak()

#include "./chapters/1-intro.typ"
#pagebreak()

#include "./chapters/2-background.typ"
#pagebreak()

#include "./chapters/3-related.typ"
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
