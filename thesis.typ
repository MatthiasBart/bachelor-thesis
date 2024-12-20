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
    
    #lorem(180)#v(0.5cm)
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
