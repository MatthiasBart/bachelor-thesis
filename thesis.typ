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
    #lorem(180)#v(0.5cm)
    // #todo(
    //   [TODO: Die Kurzfassung sollte das gesamte Werk enthalten, also das spannende
    //     Problem, den gewählten – neuartigen – Lösungsansatz und natürlich vor allem die
    //     erreichten Resultate.],
    // )
  ], abstract-en: [
    
    Modern mobile devices can make use of a wide variety of communication technologies. Besides having different applicabilities and protocols, standards like Bluetooth, WiFi or 5G need to be wireless to seamlessly transfer data. In resent years global economic demand has impacted research and development to vastly improve data transmission and hardware on smartphones. As of 2024 this led to over 4 billion smartphones users worldwide @Statista_Research_Department_2024. Unfortunately most of the communication methods used on smartphones all rely on mediators. Be it a router in a local network or a cell tower in a cellular network, without these nodes a connection between two peers can not be established, no matter how close neighboring devices may be. However in scenarios where the required infrastructure is not available or data needs to be handled sensitive, communication between two mobile devices can be established via Bluetooth or peer-to-peer WiFi since these do not required pre-existing infrastructure and purely rely on local radio broadcast, whereas the latter is recommended to use. Due to the latest advancements in these technologies and smartphone hardware, it is unclear how good direct #gls("ptp") networks work under certain conditions. This thesis tries to find and measure metrics that indicate the quality of direct #gls("ptp") connections on Apple's mobile devices. This can help to evaluate the feasibility of projects that are planning to build on these technologies. In particular the AWDL will be tested for its robustness considering metrics of quality in different scenarios and under different conditions measured from the application layer.
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

// #include "./chapters/acknowledgements.typ"
// #pagebreak()

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
