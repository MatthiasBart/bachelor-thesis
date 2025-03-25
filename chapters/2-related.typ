#import "global.typ": *

= Related Work<relatedwork>

The following is a non-comprehensive discussion of previous research in peer-to-peer technologies in the mobile context. After covering historic considerations of MANET research, a deeper introduction to Apples ecosystem and AWDL is given, where a lot is based on the OWL project from the TU Darmstadt.
Open it up again a bit for not only ios and then at the end going again deeper in the ios section with TU darmstadt 

Already back in 2001 the Proem project @Kortuem_Schneider_Preuitt_Thompson_Fickas_Segall_2002 examined different aspects of peer-to-peer applications for mobile ad hoc networks (MANET) to enable proximity-based collaboration. In particular, Proem was an approach to provide high-level support for mobile peer-to-peer application developers and was tested by students of the University of Oregon, whilst creating an MP3 file-sharing system. They already noticed the trend for an ever-larger becoming applicability of personal mobile devices for data sharing but listed resources of mobile devices among other possible limitations. This facet has vastly changed since then and several new ideas like ShAir @Dubois_Bando_Watanabe_Holtzman_2013, a middleware infrasructure for peer-to-peer sharing between mobile devices or mFerio @Balan_Ramasubbu_Prakobphol_Christin_Hong_2009, a peer-to-peer mobile payment system have emerged. In particular ShAir was a structured software engineering project developed in Java that used WiFi technology on Android devices to share data between them. While Wifi-direct and Bluetooth were also accessible to the developers, they decided to use a combination of WiFi AP mode and WiFi Client mode in a random fashion to create dynamic networks and discover nearby peers. They have tested the app by sharing pictures among 12 devices from several vendors using no fixed existing infrastructure. The applicabilities of this project strongly remind on AirDrop which has been released by Apple in 2011. Some years earlier in 2009, #cite(<Balan_Ramasubbu_Prakobphol_Christin_Hong_2009>, form: "author") working on mFerio already noticed the problem that mobile devices rely too heavily on static infrastructure. Back then cell phones have already become popular tools that combined calendars, address books, messaging or cameras. The increasing need to use them as a payment vehicle has become ever larger and the authors questioned the state of the art implemtations back then. In particular mobile payment solution constantly required stable connections via either SMS or GSM/CDMA based technologies which were connected to a backend payment server. The authors noticed that these implementation, which were to heavily relying on external systems could not replace cash based systems and aimed to develop a decentraliced approach based on NFC. The goal of their larger term project aimed to create a digital wallet for cellphones which would allow users to store everything on the device which was in their physical wallets, like credit cards, identification or tickets. This project also strongly reminds of an Apple propreitary software, the Apple Wallet, which was introduced in 2012, iOS 6 and also leverages NFC. Fortunately hardware of modern smartphones has matured and has gotten support for WiFi Direct which was used by #cite(<Newport_2017>, form: "author") in his approach to develop a new gossip algorithm for a local peer to peer communication system (#cite(<Newport_2017>, form: "year")). Though approaches existed to also introduce LTE-Direct, no support for this technology is given on mobile smartphones @Condoluci_Militano_Orsino_Alonso-Zarate_Araniti_2015. 

OpenHaystack here because it is Bluetooth

Focusing on the Apple ecosystem the Open Wireless Link (OWL) project form TU Darmstadt has made some important contributions to this research field. While reverse engineering the AWDL protocol and investigating Apples wireless ecosystem they found several security concerns and developed useful applications they published as open source software on GitHub. 

One of these applications is Open Wireless Link (OWL), an open source program that implements Apples AWDL. It originated from a paper where #cite(<owl_2018>, form: "author") reverse engineered AWDL through binary and runtime analysis. They reconstructed the daemons and frameworks involved in communicating via AWDL and found a security issue that allowed an attacker to access the macOS WiFi driver interface which could lead to DoS attacks.

A Billion Open Interfaces for Eve and Mallory: MitM, DoS, and Tracking Attacks on iOS and macOS Through Apple Wireless Direct Link. 2019

DEMO: AirCollect: Efficiently Recovering Hashed Phone Numbers Leaked via Apple AirDrop. 2021

Disrupting Continuity of Apple’s Wireless Ecosystem Security: New Tracking, DoS, and MitM Attacks on iOS and macOS Through Bluetooth Low Energy, AWDL, and Wi-Fi. 2021

PrivateDrop: Practical Privacy-Preserving Authentication for Apple AirDrop. 2021

Availability by Design: Practical Denial-of-Service-Resilient Distributed Wireless Networks Dissertation 2020


Welcome to the Open Wireless Link (OWL) project. We are researchers from the Secure Mobile Networking Lab at TU Darmstadt looking into Apple’s wireless ecosystem. Our goal is to assess security and privacy as well as enable cross-platform compatibility for next-generation wireless applications. We started by investigating the Apple Wireless Direct Link (AWDL) protocol and will go beyond. You can read our publications and use our open source code projects. If you have questions or would like to collaborate, feel free to contact us.

TODO: LTE Direct mystery and 5G NR sidelink mystery, why do mobile phones not have access to these technologies? at least the app developers do not have access to that most of this technology is used in vehicles and autonomous driving, C-V2X, seems like these direct communication technologies are not available on modern smartphones and mostly used in public safety or automotive applications, look for sources and write a paragraph about this and its use cases

TODO: write a paragraph about newer approaches about wifi direct or bluetooth on smartphones and mobile devices 

Open wireless link TU darmstadt

//This paragraph is just to showcase that i am capable of both including code listings in @implementation and also reference them correctly in other parts of the thesis. @lst:StoredTaskReference shows how important it is to be very alert when dealing with concurrency. 

// #todo(
//   [

//     Describe the work of other research teams and noteworthy approaches related to
//     your work. State what is different to your solution.

//     + Related literature might/should contain: theoretical foundations,
//       - definitions of key terms,
//       - technologies, techniques,
//       - and/or a literature review

//     + Note on the size and quality of your bibliography:
//       - BA about 30-40 references
//       - MA about 60-100 references

//     Furthermore, check: Are the reference (too) old? Did you include papers from
//     scientific databases, such as ACM or IEEE? Can the reader find your sources?
//     (e.g. check if you named the publisher for books, or specified DOIs for
//     scientific papers)

//     #v(1cm)
  //   *Citation hints when writing in Typst:*

  //   A single citation is possible with the \@Eco:2010 (i.e. using the _at_ sign),
  //   such as @Eco:2010. Find in #cite(<acm:diglibrary>) and/or #cite(<ieee:xplore>) the
  //   latest scientific findings. For citing multiple references, just name them one
  //   by one, such as #cite(<Alley:1998>) #cite(<Booth:2008>)
  //   @Batina:2011
  //   @Eco:2010
  //   @Fernandez-Mir:2011
  //   @Field:2003
  //   @Google:2016a @Google:2017a
  //   @Li:2008
  //   @Shaw:2002
  //   @Strunk:2000
  //   @Wisconsin:2004
  //   @Yin:2013
  //   @Zobel:2004
  //   and they will be listed within the _(_ _)_ round brackets separated by a _;_ semicolon.

  //   If we know where a text of relevance is presented inside an article, we might
  //   specify the page number also, see @Yin:2013[p.~7]. If you want to cite without
  //   parantheses, you specify _form_ as _prose_, as shown here with #cite(<Shaw:2002>, form: "prose").

  // ],
// )

// #todo([
//   #v(1.3cm)
//   *Hints for footnotes in Typst*:

//   As shown in #footnote[Visit https://typst.app/docs for more details on formatting the document using
//     typst. Note, _typst_ is written in the *Rust* programming language.] we might
//   discuss the alternatives.
// ])
