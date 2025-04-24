#import "global.typ": *

= Related Work<relatedwork>

The following is a non-comprehensive discussion covering previous research of peer-to-peer technologies in the mobile context. After covering historic considerations of mobile ad hoc networks (MANET) research and device to device D2D communication in cellular networks via standards like LTE-Direct or 5G New radio (NR) Sidelink (SL), a deeper introduction to Apples ecosystem and AWDL is given, where a lot is based on the open wireless link (OWL) project from the TU Darmstadt. While reverse engineered the AWDL protocol, the team found several security concerns in Apple's operating systems and developed some open source applications for public use which they shared on GitHub.

== History of MANET

Already back in 2001 the Proem project @Kortuem_Schneider_Preuitt_Thompson_Fickas_Segall_2002 examined different aspects of peer-to-peer applications for mobile ad hoc networks (MANET) to enable proximity-based collaboration. In particular, Proem was an approach to provide high-level support for mobile peer-to-peer application developers and was tested by students of the University of Oregon, whilst creating an MP3 file-sharing system. They already noticed the trend for an ever-larger becoming applicability of personal mobile devices for data sharing but listed resources of mobile devices among other possible limitations. This facet has vastly changed since then and several new ideas like ShAir @Dubois_Bando_Watanabe_Holtzman_2013, a middleware infrasructure for peer-to-peer sharing between mobile devices or mFerio @Balan_Ramasubbu_Prakobphol_Christin_Hong_2009, a peer-to-peer mobile payment system have emerged. 

#cite(<Balan_Ramasubbu_Prakobphol_Christin_Hong_2009>, form: "author") working on mFerio already noticed the problem that mobile devices rely too heavily on static infrastructure. Back then cell phones have already become popular tools that combined calendars, address books, messaging or cameras. The increasing need to use them as a payment vehicle has become ever larger and the authors questioned the state of the art implemtations back then. In particular mobile payment solution required constantly stable connections via either SMS or GSM/CDMA based technologies which were connected to a backend payment server. They noticed that these implementation, which were to heavily relying on external systems could not replace cash based systems and aimed to develop a decentraliced approach based on NFC. The goal of their larger term project aimed to create a digital wallet for cellphones which would allow users to store everything on the device which has previously been in their physical wallets, like credit cards, identification or tickets. The applicabilities of this project strongly remind of the Apple Wallet, which was introduced in iOS 6 in 2012 and also leverages NFC. 

//MARK: include image of shair application 
Some years later in 2013 ShAir was developed as by #cite(<Dubois_Bando_Watanabe_Holtzman_2013>, form: "author"), a structured software engineering project written in Java that used WiFi technology on Android devices to share data between them. While Wifi-direct and Bluetooth were also accessible to the developers, they decided to use a combination of WiFi AP mode and WiFi Client mode in a random fashion to create dynamic networks and discover nearby peers because devices would not allow the former without active user interaction. They tested the app by sharing pictures among 12 devices from several vendors using no fixed existing infrastructure. This project also strongly reminds on Apple propreitary software AirDrop which has been released by Apple in 2011.

Since then support for direct peer-to-peer connections has matured on various mobile operating systems, including iOS and its Multipeer Connectivity Framework which allows nodes to advertise itself, discover nearby advertisers and attempt to connect to detected nearby advertiser. The concept of that model motivated #cite(<Newport_2017>, form: "author") to develop a formal definition and comparison of gossip algorithms. He describes and analyses differences in algorithm parameters and how they influence data spreading in a MANET where the goal is that messages spread to the entire network (#cite(<Newport_2017>, form: "year")). The author claims that these algorithms can help to establish peer-to-peer meshes that support infrastructure-free networking and communication. He presents the discontinued FireChat application as an example which offered group chats using smartphone peer-to-peer services such as Bluetooth, WiFi and the Multipeer Connectivity Framework. According to the author this application has been adopted in multiple governmental protest or festivals that were located out of reach of cell towers, but unfortunately did not release a new version since 2018.

== D2D in cellular networks

Although a lot of research exists on D2D communication in cellular networks, most of it is done in a military use case @Gamboa_Ben_Mosbah_Garey_Liu_Rouil_2023, like unmanned aerial vehicles (UVA)  or public safety networks @Gamboa_Henderson_Garey_Liu_Rouil_2024, like vehicle to everything (V2X). Most of this research builds upon 5G New Radio (NR) Sidelink (SL) which has implemented protocol support for (V2X) and Proximity Services (ProSe) for public safety networks which allows user equipment (UE) to directly talk to each other without the interference of a base station (gNB).
//Mark cite qualcomm pdf 
//MARK: link https://developer.apple.com/forums/thread/97688?answerId=762404022#762404022 eskimo answer no direct access to cellular interface
Although approaches existed to also introduce D2D communication to the commercial markets back in 2014 by Qualcomm and #cite(<Condoluci_Militano_Orsino_Alonso-Zarate_Araniti_2015>, form: "author") back in 2015 proved that LTE-Direct, a predecessor of 5G SL, has some energy and scaling benefits over WiFi-Direct, according to Apple engineers no support for this technology is given on mobile smartphones for third party developers. This is also pointed out by the authors of this critical review of mobile device-to-device communications @Desauw_Luxey-Bitri_Raes_Rouvoy_Ruas_Rudametkin_2023.

== Apple Ecosystem and TU Darmstadt

//MARK: include nice graphic from the OWL project
From 2018 on the OWL project by Secure Mobile Networking Lab (SEEMOO) at TU darmstadt contributed several papers to research on Apple's wireless ecosystem @Stute_Kreitschmann_Hollick_2018a. Their goal was to assess security and privacy concerns as well as enable cross-platform compatibility with other vendors. They started to investigate AWDL in an approach to reverse engineere the 802.11 Wifi based protocol and developed an open source application that implements Apples AWDL. Along the way the authors stumbled across some security concerns which they focused on following papers until 2021. 

On the projects first conference the authors presented the operations of the undocumented AWDL protocol. They used binary and runtime analyses to reconstruct the daemons and frameworks involved in communicating via AWDL and found that each AWDL node announces a sequence of Availability Windows indicating that it is ready to communicate with other AWDL nodes. In the process they also detected that AWDL connections do not feature any security mechanisms leaving authentication or encryption to the transport and application layers, which the authors claim to be an informed decision @Stute_Kreitschmann_Hollick_2018b.

Following the initial findings on missing security considerations, the authors dedicated a separate paper on researching security and privacy issues in the AWDL protocol. The study uncovers multiple vulnerabilities related to both design flaws and implementation bugs. One of the major findings is the possibility of a man-in-the-middle (MitM) attack, which would allow an attacker to stealthily modify files transferred via AirDrop. Additionally, the study identifies denial-of-service (DoS) vulnerabilities that can disrupt communication or force the sudden crash of all nearby devices. The research also reveals privacy weaknesses that allow attackers to track users over extended periods, effectively bypassing MAC address randomization. The authors included a demonstration showing the feasibility of these attacks where the researchers developed proof-of-concept implementations using inexpensive hardware like a 20 dollar micro:bit device. Although following responsible disclosure Apple addressed one of the DoS attack vulnerabilities, the researchers also highlight that several of the identified security and privacy risks require fundamental redesigns of some of Apple’s services to be fully mitigated. Overall the study highlights critical security flaws in AWDL design and implementation demonstrating a potential impact on over a billion Apple devices and emphasizing the need for stronger security measures and protocol improvements. Onebillionopeninterfaces Disrupting continuity.

In 2020 Ian Beer a british computer securtiy expert and white hat hacker, inspired by the initial work of TU Darmstadt found another severe security issue in AWDL which could remotely trigger an unauthenticated kernel memory corruption that lead to all iOS devices in radio proximity to reboot. Further he describes how this issue could lead to a system state that lets an attacker run any code on nearby iOS devices and steal all user information. In his demos he forced the former flagship iPhone 11 Pro to activate the AWDL interface which is successfully exploited to steal sensitive information like emails, photos, message or even the keychain. atIanBeer_2020

// add private drop paper 

// add Disrupting Continuity paper 

// maybe add the end also add something about haystack
In 2021 the OWL project found that during the AirDrop authentication handshake with nearby devices, vulnerable hash values of the user's own phone number and email adresses are exchanged. The authors describe two theoretical attacks to exploit these vulnerabilities and propose an application named PrivateDrop to 

The study reveals a privacy vulnerability in Apple’s AirDrop file-sharing service, which leaks phone numbers and email addresses by exchanging hash values of a user’s contact information during the authentication handshake with nearby devices. These hashes are vulnerable to brute-force attacks, allowing attackers to retrieve the original contact details. In a paper presented at USENIX Security'21, researchers describe two attack methods to exploit these vulnerabilities and introduce "PrivateDrop", a privacy-focused alternative to AirDrop that uses private set intersection to enhance security. To demonstrate the severity of the issue, the researchers developed a proof-of-concept attack, showing that an attacker within Wi-Fi range and physical proximity can efficiently extract sensitive user information. The study highlights serious privacy and security implications, including the risk of spear phishing attacks and the ability to map contact identifiers to specific locations using multiple strategically placed “collector” devices. For their proof-of-concept, the researchers created a custom rainbow table that allows them to reverse SHA-256 hashes of phone numbers within milliseconds. They explore the trade-off between success rate and storage requirements for such attacks. After responsibly disclosing their findings to Apple, the team published their proof-of-concept tool, "AirCollect," on GitHub, demonstrating the feasibility of large-scale contact data collection. The findings underscore critical privacy risks in AirDrop, emphasizing the need for stronger security measures to prevent unauthorized access to user information.

// TODO: LTE Direct mystery and 5G NR sidelink mystery, why do mobile phones not have access to these technologies? at least the app developers do not have access to that most of this technology is used in vehicles and autonomous driving, C-V2X, seems like these direct communication technologies are not available on modern smartphones and mostly used in public safety or automotive applications, look for sources and write a paragraph about this and its use cases

// TODO: write a paragraph about newer approaches about wifi direct or bluetooth on smartphones and mobile devices 

== Summary

//One of these applications is Open Wireless Link (OWL), an open source program that implements Apples AWDL. It originated from a paper where #cite(<Stute_Kreitschmann_Hollick_2018a>, form: "author") reverse engineered AWDL through binary and runtime analysis. They reconstructed the daemons and frameworks involved in communicating via AWDL and found a security issue that allowed an attacker to access the macOS WiFi driver interface which could lead to DoS attacks.

//Welcome to the Open Wireless Link (OWL) project. We are researchers from the Secure Mobile Networking Lab at TU Darmstadt looking into Apple’s wireless ecosystem. Our goal is to assess security and privacy as well as enable cross-platform compatibility for next-generation wireless applications. We started by investigating the Apple Wireless Direct Link (AWDL) protocol and will go beyond. You can read our publications and use our open source code projects. If you have questions or would like to collaborate, feel free to contact us.

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
