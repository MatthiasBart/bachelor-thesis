#import "global.typ": *

= Related Work<relatedwork>

The following is a non-comprehensive discussion covering previous research of #gls("ptp") technologies in the mobile context. After covering historic considerations of #gls("manet") research and device to device #gls("d2d") communication in cellular networks via standards like #gls("lte")-Direct or 5G #gls("nr") #gls("sl"), a deeper introduction to Apples #gls("ptp") ecosystem and #gls("awdl") is given, where a lot is based on the #gls("owl") project from the TU Darmstadt. While reverse engineered the #gls("awdl") protocol, the team found several security concerns in Apple's operating systems and developed some open source applications for public use which they shared on GitHub.

== History of #gls("manet")

Already back in 2001 the Proem project @kortuem_when_2002 examined different aspects of peer-to-peer applications for #gls("manet") to enable proximity-based collaboration. In particular, Proem was an approach to provide high-level support for mobile peer-to-peer application developers and was tested by students of the University of Oregon, whilst creating an #gls("mp3") file-sharing system. They already noticed the trend for an ever-larger becoming applicability of personal mobile devices for data sharing but listed technical resources of mobile devices among other possible limitations. This facet has vastly changed since then and several new ideas like ShAir @dubois_shair_2013, a middleware infrastructure for peer-to-peer sharing between mobile devices or mFerio @balan_mferio_2009, a peer-to-peer mobile payment system have emerged. 

#cite(<balan_mferio_2009>, form: "author") working on mFerio already noticed the problem that mobile devices rely too heavily on static infrastructure. Back then cell phones have already become popular tools that combined calendars, address books, messaging or cameras. The increasing need to use them as a payment vehicle has become ever larger and the authors questioned the state of the art implementations back then. In particular mobile payment solution required constantly stable connections via either #gls("sms") or #gls("gsm")/#gls("cdma") based technologies which were connected to a backend payment server. They noticed that these implementation, which were just too heavily relying on external systems could not replace cash based systems and aimed to develop a decentralized approach based on #gls("nfc"). The goal of their larger term project aimed to create a digital wallet for cellphones which would allow users to store everything on the device which has previously been in their physical wallets, like credit cards, identification or tickets. The applicabilities of this project strongly remind of the Apple Wallet, which was introduced in #gls("ios") 6 in 2012 and also leverages #gls("nfc"). 

Some years later in 2013 ShAir was developed as by #cite(<dubois_shair_2013>, form: "author"), a structured software engineering project written in Java that used #gls("wifi") technology on Android devices to share data between them. While #gls("wifi")-Direct and Bluetooth were also accessible to the developers, they decided to use a combination of #gls("wifi") AP mode and #gls("wifi") Client mode in a random fashion to create dynamic networks and discover nearby peers because devices would not allow the former without active user interaction. They tested the application by sharing pictures among twelve devices from several vendors using no fixed existing infrastructure. This project also strongly reminds on Apple proprietary software AirDrop which has been released by Apple in 2011.

#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/shair.png", width: 75%)
    ),
    caption: [12 Devices sharing images using local radio broadcasting. @dubois_shair_2013]
  )<fig:shair>

Since then support for direct #gls("ptp") connections has matured on various mobile operating systems, including #gls("ios") and its Multipeer Connectivity Framework which allows nodes to advertise itself, discover nearby advertisers and attempt to connect to detected nearby advertiser. The concept of that model motivated #cite(<newport_gossip_2017>, form: "author") to develop a formal definition and comparison of gossip algorithms. He describes and analyses differences in algorithm parameters and how they influence data spreading in a #gls("manet") where the goal is that messages spread to the entire network (#cite(<newport_gossip_2017>, form: "year")). The author claims that these algorithms can help to establish peer-to-peer meshes that support infrastructure-free networking and communication. He presents the discontinued FireChat application as an example which offered group chats using smartphone peer-to-peer services such as Bluetooth, #gls("wifi") and the Multipeer Connectivity Framework. According to the author this application has been adopted in multiple governmental protest or festivals that were located out of reach of cell towers, but unfortunately did not release a new version since 2018.

== #gls("d2d") in Cellular Networks

Although a lot of research exists on #gls("d2d") communication in cellular networks, most of it is done in a military use case @gamboa_system-level_2023, like #gls("uva") or public safety networks @gamboa_towards_2024, like #gls("v2x"). Most of this research builds upon 5G #gls("nr") #gls("sl") which has implemented protocol support for #gls("v2x") and #gls("prose") for public safety networks which allows #gls("ue") to directly talk to each other without the interference of a #gls("gnb").

Although approaches existed to also introduce #gls("d2d") communication to the commercial markets back in 2014 by Qualcomm @qualcomm_technologies_inc_lte_2014 and #cite(<condoluci_lte-direct_2015>, form: "author") back in 2015 proved that #gls("lte")-Direct, a predecessor of 5G #gls("sl"), has some energy and scaling benefits over #gls("wifi")-Direct, according to Apple engineers no support for this technology is given on mobile smartphones for third party developers @eskimo1applecom_use_2023. This is also pointed out by the authors of this critical review of mobile #gls("d2d") communications @desauw_critical_2023.

== Apple Ecosystem and TU Darmstadt

From 2018 on the #gls("owl") project by #gls("seemoo") at TU Darmstadt contributed several papers to research on Apple's wireless ecosystem @stute_open_2018. Their goal was to assess security and privacy concerns as well as enable cross-platform compatibility with other vendors. They started to investigate #gls("awdl") which is heavily used in Apple's Continuity platform. While reverse engineering the 802.11 #gls("wifi") based protocol the authors stumbled across various security concerns which they mainly focused on next to Apple's #gls("ble") usage in following papers until 2021. 

#figure(
  image("/figures/owl.svg", width: 25%),
  caption: [Logo of the #gls("owl") project. @stute_open_2018]
)<fig:owl>

On the projects first conference the authors presented the operations of the undocumented #gls("awdl") protocol. They used binary and runtime analyses to reconstruct the daemons and frameworks involved in communicating via #gls("awdl") and found that each #gls("awdl") node announces a sequence of Availability Windows indicating that it is ready to communicate with other #gls("awdl") nodes. In the process they also detected that #gls("awdl") connections do not feature any security mechanisms leaving authentication or encryption to the transport and application layers, which the authors claim to be an informed decision by Apple @stute_one_2018.

Following the initial findings on missing security considerations by Apple, the authors dedicated a separate paper on researching security and privacy issues of the #gls("awdl") protocol. The study uncovers multiple vulnerabilities related to both design flaws and implementation bugs. One of the major findings is the possibility of a #gls("mitm") attack, which would allow an attacker to stealthily modify files transferred via AirDrop. Additionally, the study identifies #gls("dos") vulnerabilities that can disrupt communication or force the sudden crash of all nearby devices. The research also reveals privacy weaknesses that allow attackers to track users over extended periods, effectively bypassing #gls("mac") address randomization. The authors included a demonstration showing the feasibility of these attacks where the researchers developed proof-of-concept implementations using inexpensive hardware like a 20 dollar micro:bit device. Although following responsible disclosure Apple addressed one of the #gls("dos") attack vulnerabilities, however the researchers also highlight that several of the identified security and privacy risks require fundamental redesigns of some of Apple's services to be fully mitigated. Overall the study highlights critical security flaws in #gls("awdl") design and implementation demonstrating a potential impact on over a billion Apple devices and emphasizing the need for stronger security measures and protocol improvements @stute_billion_2019.

In 2020 Ian Beer a british computer security expert and white hat hacker, inspired by the initial work of TU Darmstadt found another severe security issue in #gls("awdl") which could remotely trigger an unauthenticated kernel memory corruption that lead to all #gls("ios") devices in radio proximity to reboot. Further he describes how this issue could lead to a system state that lets an attacker run any code on nearby #gls("ios") devices and steal all user information. In his demos he forced the former flagship iPhone 11 Pro to activate the #gls("awdl") interface which is then successfully exploited to steal sensitive information like emails, photos, message or even the keychain @ian_beer_ios_2020.

In 2021 the authors of the #gls("owl") project dedicated another paper to the analysis of Apple's offline file sharing service AirDrop which uses #gls("awdl") under the hood. The authors discovered two design flaws in the underlying protocol which would allow an attacker to sniff vulnerable hashes of contact information such as the phone number or email address. These hashes are particularly vulnerable to brute force attacks because of the small input number space. For example, phone numbers in Austria with exempt of the mobile operator prefix consist of only seven digits where a hash would be easily cracked within seconds on modern #gls("pc")s according to the authors. After presenting security issues and their effects the authors propose an optimized #gls("psi") based protocol called PrivateDrop that solves the problem of privacy preserving authentication between nearby offline devices. While preventing potential attackers to steal private user data, users still remain trackable via their #gls("uuid") in the #gls("tls") certificate used during the initial handshake. Finally, the authors also claim that their proposed approach is not limited to the Apple ecosystem and could help Google's similar platform "Nearby" for Android. They also open sourced this implementation as part of their #gls("owl") project @heinrich_privatedrop_2021. 

While focusing merely on AirDrop in the previous paper the authors of the #gls("owl") project dedicated another paper to a broader range of Apple's Continuity services. The authors described a guide to approach a structured analysis of the protocols involved in these services and developed a toolkit to automate parts of this mostly manual process. Based on the created tools the authors analyzed the full protocol stacks involved in various Continuity services like #gls("ho"), #gls("uc") and #gls("wifi") #gls("pws"). During this process they again found several security issues which could lead to possible #gls("dos") or #gls("mitm") attacks. To demonstrate their findings the authors implemented a #gls("poc") using an affordable off-the-shelf #gls("wifi") card and urge readers to share similar findings with Apple to help make widely used devices more secure @stute_disrupting_2021. 

In yet another paper about Apples local broadcasting platform the authors of the #gls("owl") project examine worlds biggest #gls("of") system. In short lost devices advertise rolling public keys via #gls("ble") that are captured by nearby "finder devices" and sent to an Apple server with the corresponding location of the finder device. The owner of the lost device can then query the Apple server for entries sent by these finder devices to get an estimated location of his/her lost device. While the authors claim that this design mostly achieves Apple's specific security goals they also share two distinct design and implementation faults. These would allow Apple to correlate different users location if their locations are reported by the same finder device to let Apple form social user graphs. Moreover a malicious macOS application could retrieve and decrypt location reports of the last week as the rolling advertisement keys are cached and stored on the filesystem as clear text @heinrich_who_2021. 

== Summary

Although considerations about ad-hoc networks were dealt with very early in the history of mobile computing, it has only been recently that widespread features using local radio broadcasting were adopted. With great power comes great responsibility which Apple tends to have underestimated with respect to the great work and great findings of the #gls("owl") project by #gls("seemoo") at TU Darmstadt. The group noticed the need for research on mobile local ad hoc networks since these have vastly improved and found several new applications over the last few years especially in the Apple ecosystem, but focused mainly on demystifying the underlying protocols and analyzing those with regard to security concerns. 

// wie unterscheidet sich meine arbeit zu dem oberen 


// : LTE Direct mystery and 5G NR sidelink mystery, why do mobile phones not have access to these technologies? at least the app developers do not have access to that most of this technology is used in vehicles and autonomous driving, C-V2X, seems like these direct communication technologies are not available on modern smartphones and mostly used in public safety or automotive applications, look for sources and write a paragraph about this and its use cases

// : write a paragraph about newer approaches about #gls("wifi") direct or bluetooth on smartphones and mobile devices 
// In 2021 the OWL project found that during the AirDrop authentication handshake with nearby devices, vulnerable hash values of the user's own phone number and email adresses are exchanged. The authors describe two theoretical attacks to exploit these vulnerabilities and propose an application named PrivateDrop to 

// The study reveals a privacy vulnerability in Apple’s AirDrop file-sharing service, which leaks phone numbers and email addresses by exchanging hash values of a user’s contact information during the authentication handshake with nearby devices. These hashes are vulnerable to brute-force attacks, allowing attackers to retrieve the original contact details. In a paper presented at USENIX Security'21, researchers describe two attack methods to exploit these vulnerabilities and introduce "PrivateDrop", a privacy-focused alternative to AirDrop that uses private set intersection to enhance security. To demonstrate the severity of the issue, the researchers developed a proof-of-concept attack, showing that an attacker within Wi-Fi range and physical proximity can efficiently extract sensitive user information. The study highlights serious privacy and security implications, including the risk of spear phishing attacks and the ability to map contact identifiers to specific locations using multiple strategically placed “collector” devices. For their proof-of-concept, the researchers created a custom rainbow table that allows them to reverse SHA-256 hashes of phone numbers within milliseconds. They explore the trade-off between success rate and storage requirements for such attacks. After responsibly disclosing their findings to Apple, the team published their proof-of-concept tool, "AirCollect," on GitHub, demonstrating the feasibility of large-scale contact data collection. The findings underscore critical privacy risks in AirDrop, emphasizing the need for stronger security measures to prevent unauthorized access to user information.
//One of these applications is Open Wireless Link (OWL), an open source program that implements Apples #gls("awdl"). It originated from a paper where #cite(<Stute_Kreitschmann_Hollick_2018a>, form: "author") reverse engineered #gls("awdl") through binary and runtime analysis. They reconstructed the daemons and frameworks involved in communicating via #gls("awdl") and found a security issue that allowed an attacker to access the macOS #gls("wifi") driver interface which could lead to DoS attacks.

//Welcome to the Open Wireless Link (OWL) project. We are researchers from the Secure Mobile Networking Lab at TU Darmstadt looking into Apple’s wireless ecosystem. Our goal is to assess security and privacy as well as enable cross-platform compatibility for next-generation wireless applications. We started by investigating the Apple Wireless Direct Link (#gls("awdl")) protocol and will go beyond. You can read our publications and use our open source code projects. If you have questions or would like to collaborate, feel free to contact us.

//This paragraph is just to showcase that i am capable of both including code listings in @implementation and also reference them correctly in other parts of the thesis. @lst:StoredTaskReference shows how important it is to be very alert when dealing with concurrency. 

// #(
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

// #([
//   #v(1.3cm)
//   *Hints for footnotes in Typst*:

//   As shown in #footnote[Visit https://typst.app/docs for more details on formatting the document using
//     typst. Note, _typst_ is written in the *Rust* programming language.] we might
//   discuss the alternatives.
// ])
