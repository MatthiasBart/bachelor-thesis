#import "global.typ": *

= Introduction<introduction>

//MARK: This tells why ad hoc is important
Nowadays communication between smartphones or tablets invariably relies on infrastructure. In most homes in developed countries one can find a local network advertised by WiFi technology and handled by a router. Being outside and not connected to a local network, mobile devices communicate with cellular towers that give access to a big underlying network managed by an ISP. Wherever we go, our mobile devices are connected, but relying on infrastructure that is not necessarily available all the time. Different reasons can lead to restricted or broken infrastructure which, in absence of ad-hoc technologies would break all communication. In countries with governmental protests cellular networks might be restricted or monitored, infrastructure could be overwhelmed, due to a high number of people trying to access the system simultaniously or environmental disasters could take down cellular towers or their power supply. In all these cases users would highly profit from ad-hoc networks, that do not merely rely on any external dependencies.

Nowadays many different technologies exist to gain access to wide area ad-hoc connections like LTE-Direct, 5G Sidelink (SL) or LoraWan. Unfortunately these technologies are not yet supported in smartphones and there is no guarantee that they will ever be. However modern smartphones improved support for local peer-to-peer (P2P) technologies in recent years, that allow devices to directly communicate via local radio link broadcasts. This could improve connectivity in the aforementioned cases or enable scenarios in which numerous end devices connect together, to form a wide spread mesh network. The first technology that comes to mind is Bluetooth. First introduced in 1998 has already been used in mobile computing the last decades, but due to limited data transfer rates a new approach started to enter the market. These days WiFi is predominantly used to facilitate local P2P connections between smartphones, whereby unfortunately every mobile operating system has created its own version which makes communication between different vendors complex. Furthermore, the extent to which these technologies can provide stable data transfer and the quality with which they can do so, remains unclear or poorly documented. Since this information is essential for a further evaluation of the feasibility of applications based on direct P2P connections, this thesis aims to address the existing uncertainty by measuring metrics that can assist the evaluation of analogous applications. 
// In the contemporary era, the utilisation of smartphones or tablets for communication invariably depends on the existence of infrastructure. In many developed countries, residential properties are equipped with local networks that utilise WiFi technology and are managed by routers. In the absence of a local network, mobile devices utilise cellular towers to access a vast underlying network, which is managed by an Internet Service Provider (ISP). This reliance on infrastructure, however, is not guaranteed, as it is subject to the availability of the necessary infrastructure. The presence of restricted or broken infrastructure can be attributed to various reasons, which, in the absence of ad-hoc technologies, would result in the cessation of all communication. In countries experiencing governmental unrest, cellular networks may be subject to restrictions or monitoring. A further reason for the failure of infrastructure networks could be overwhelming usage, where a high number of people attempt to use the same ISP tower, or environmental disasters which take down power supply or network nodes. In such circumstances, ad-hoc networks, which do not rely on external dependencies, become a highly advantageous solution for users. In recent years, there has been an enhancement in the support for local peer-to-peer technologies in modern smartphones, which facilitate direct communication via local radio link broadcasts. This technological benefit has the potential to facilitate scenarios where numerous end devices can connect and collaborate to form a wide-spread mesh network, or to enhance connectivity by bypassing the need for accessible infrastructure. It is evident that there is a plethora of technologies that facilitate wide-area ad hoc connections, including LTE-Direct and LoraWan. However, it is important to note that these technologies are not yet supported in smartphones and there is no guarantee that they will ever be. These days WiFi is predominantly used for the purpose of facilitating local peer-to-peer connectivity. However, it is important to note that each provider has developed its own unique version of this technology, which has the unfortunate consequence of complicating communication between smartphones that operate on divergent operating systems. Furthermore, the extent to which these technologies can facilitate data transfer, and the quality with which they can do so, remains to be ascertained. This is essential for the subsequent evaluation of the feasibility of applications based on direct peer-to-peer transfer. This thesis aims to address this existing uncertainty by measuring metrics that can assist in evaluating the feasibility of analogous applications.
// Change intro to describe in general the ptp connectivity not related to MC framework since this doesnt support Bluetooth, which was the only reason to use that framework... 



// #v(1em)
// #quote(
//   [Most smartphone communication leverages one hop radio links to cell towers or WiFi access points. In recent years, however, the major smartphone operating systems have included increasingly stable and useful support for local peer-to-peer communication that allows a device to talk directly to a nearby device (using local radio broadcast) while avoiding cellular and WiFi infrastructure. The ability to create these local links, combined with the ubiquity of smartphones, enables scenarios in which large groups of nearby smartphone users run applications that create peer-to-peer meshes supporting infrastructure-free networking. There are many possible motivations for these smartphone peer-to-peer networks. For example, they can support communication in settings where network infrastructure is censored (e.g., government protests), overwhelmed (e.g., a large festival or march), or unavailable (e.g., after a disaster or at a remote event). In addition, in developing countries, cellular data minutes are often bought in blocks and carefully conserved—increasing interest in networking operations that do not require cellular infrastructure.], [#cite(<Newport_2017>, form: "author"), #cite(<Newport_2017>, form: "year")],
// )
// #v(1em)
//MARK: This explains why i am using iOS and what I am using
// 27 % ios shar https://de.statista.com/statistik/daten/studie/203584/umfrage/absatz-von-apple-iphones-seit-dem-geschaeftsjahr-2007/
// Continuity https://support.apple.com/en-us/108046
// 
As of 2024 4 billion people worldwide are carrying smartphones @Statista_Research_Department_2024 with them. Twenty seven percent of them are developed and manufactured by one of the most valuable companies in the world. Since 2007, when the first iPhone was released on 27th of June Apple has sold more than 2.3 billion devices. This makes iOS one of the most used mobile operating systems worldwide with a current market share of 27%. iOS also utilizes its own implementation of a P2P WiFi protocol which is strongly used by Apples Continuity which bundles applications like AirDrop or AirPlay, Universal Clipboard, Handoff or WiFi password sharing for contacts that want to join your network. 

//MARK: source for 802.11 based, OWL paper
//MARK: https://developer.apple.com/documentation/multipeerconnectivity source for Multipeer Connectivity
//MARK: https://developer.apple.com/documentation/technotes/tn3151-choosing-the-right-networking-api#Peer-to-peer-alternatives
//MARK: https://developer.apple.com/forums/thread/107960?answerId=328875022#328875022 Bluetooth broken in Multipeer Connec
//MARK: https://developer.apple.com/forums/thread/38476?answerId=263873022#263873022 Bluetooth broken in MultiPeer Connectivity.
//MARK: https://developer.apple.com/forums/thread/757385?answerId=791547022#791547022 source for is considered low level at Networking API, i have read something like this on forums
//MARK: source for networking https://developer.apple.com/documentation/network
Apples P2P WiFi implementation is called Apple Wireless Direct Link (AWDL) and is an undocumented protocol that is based on the 802.11 ad-hoc WiFi standard which did not live up to its expectations. This protocol is not only used internally by Continuity but is also accessible to iOS application developers via various frameworks that operate on different layers of abstraction. 

//MARK: source for AWDL is recommended developer forums
Although Bluetooth is more versatile, compatible with devices from other vendors and has improved range and speed in mobile end devices in recent years, AWDL is the recommended technology to establish direct links between iOS devices.

//MARK: insert photo of tcp/ip stack 
//MARK: TCP/IP https://datatracker.ietf.org/doc/html/rfc1122
//MARK: TCP/IP https://datatracker.ietf.org/doc/html/rfc1123
Most of networking in mobile devices relies on the TCP/IP protocol suite. It splits transferring data into Application, Transport, Internet, and Network Layers, each playing a specific role in ensuring data transmission.

The Application Layer is responsible for encapsulating domain specific data and is the top most of layers, which passes data down to the Transport Layer. It ensures that data is transmitted reliably using protocols like TCP for error-checked delivery and congestions control via Congestive-Avoidance Algorithms (CAA) or UDP for faster and connectionless communication. This layer breaks the data into smaller segments and passes them to the Internet Layer, which is responsible for logical addressing and routing network traffic. In 2012 another Transport protocol was developed by engineers at Google called QUIC. It is built upon UDP and is supposed to obsolete TCP for applications that rely on ordered and error checked data because of its faster connection establishment and built in encryption. Apple added support for QUIC to the Networking Framework starting form iOS 15.

//MARK: why use different transport layer protcols and compare them 
After all the described aspects have been taken into consideration, the Networking Framework, included in the iOS SDK is used to establish and test the quality of P2P AWDL connections between iOS devices. The tests will alternate using TCP, UDP and QUIC in different surroundings that represent typical locations, varying in crowd density or general ambient radiofrequency electromagnetic field (RF-EMF) levels.

// This thesis analyses and measures the capabilities of the latest iOS devices to communicate via direct #gls("ptp") networks. Since most of current technology standards rely heavily on external infrastructure with powerful receiver antennas, direct #gls("ptp") communication is not yet wide spread third party applications or optimized to function over long distances. However it is unclear, where the boundaries of the current implementations lie and which type of applications could be implemented with direct #gls("ptp"). The results aim to help assess feasibility of different applications that build upon AWDL. Examples vary from secure communication applications to city wide mesh networks or improved reachability in dangerous situations where no cellular network is in reach.

== Research Definition

This research should help assess feasibility of applications that want to utilise AWDL. It will compare different transport layer protocols (TCP, UDP and QUIC) in different locations that represent common places (City, Underground, Field and Forrest) to cover various characteristics of real life scenarios. The tests will vary in distance, size of packages and number of packages. The Networking Framework is used to quantify the connection quality through metrics like RTT, jitter, package loss and data transfer speed.

*Research Questions*

Which aspects influence the P2P AWDL connection quality on iOS devices and how far can it reach?

*Hypothesis*

$H_1$

P2P AWDL connection quality on iOS devices depends on the surroundings and functions worse in crowded areas.

$H_2$

P2P AWDL connection quality on iOS devices depends on the transport layer protocol.

*Method*

To measure the stated connection metrics a prototype application will be developed for the iOS platform that will serve as a tool to measure the connection quality. The metrics will be precisely defined in the test protocol in @implementation after describing the implementation details of the prototype. Measurement of connection quality will be purely based on values captured through the Network Framework by the prototype app itself. The characteristics of the environment will be described based on human perceive and measured with suitable methods.

== Summary

Nowadays Smartphones mostly rely on infrastructure networks. As this is a strong dependency that could vastly limit access and advancements in P2P connection soft- and hardware have emerged in recent years it is unclear which connection qualities these methods can produce. Therefore a prototype application developed for the iOS platform serves as a utility for measuring  selected metrics.

// == Notice on terminology

// peer-to-peer, manet, wifi direct, awdl, ad-hoc, 

// iOS machines... iOS can be used on macOS or iPadOS and so on...
//Since the latest smartphones have improved hardware and operating system support for direct #gls("ptp"), it is unclear how well these technologies can currently serve direct communication under different conditions. Focusing on the Apple platform, an iOS application is developed, that serves as testing utility. After discussing related work that summarizes past attempts, considerations and benefits of direct communication in @relatedwork, @background will provide all required knowledge to understand the concepts of the design and decisions made to best answer if or when latest technology is/will be ready to rely on direct #gls("ptp") communication.

// #todo(
//   [
//     Describe your structured, academic approach to find — and evaluate — a solution.
//     When you needed (large) data sets for you work, explain how you collected and
//     filtered raw data. For the validation (see Section Evaluation 6) you want to
//     describe the criteria for objective measurement.
//   ],
// )

// #todo(
//   [
//     #v(3cm)
//     Note the so called "*Roter Faden*": At the end of one chapter you might sum up
//     the content. Then you give an outlook on the next chapter. For example, at the
//     end of the introduction you might start the text with:

//     _The remainder of the thesis is structured as follows:_
//     _The implementation is presented in @implementation (including the backend
//     @backend and the frontend @frontend). The evaluation ... ..._
//   ],
// )

//this is what i have already written and dont really need anymore
// == Motivation 
 
// *Motivation.* Modern mobile devices can make use of a wide variety of communication technologies. Besides having different applicabilities and protocols, standards like Bluetooth, WiFi or 5G need to be wireless to seamlessly transfer data. In resent years global economic demand has impacted research and development to vastly improve data transmission and hardware on smartphones. As of 2024 this led to over 4 billion smartphones users worldwide \Statista_2024. Unfortunately most of the communication methods used on smartphones all rely on mediators. Be it a router in a local network or a cell tower in a cellular network, without these nodes a connection between two peers can not be established, no matter how close neighboring devices may be. However in scenarios where the required infrastructure is not available or data needs to be handled sensitive, communication between two mobile devices can be established via Bluetooth or peer-to-peer WiFi since these do not required pre-existing infrastructure and purely rely on local radio broadcast, whereas the latter is recommended to use. Due to the latest advancements in these technologies and smartphone hardware, it is unclear how good direct #gls("ptp") networks work under certain conditions. This thesis tries to find and measure metrics that indicate the quality of direct #gls("ptp") connections on Apple's mobile devices. This can help to evaluate the feasibility of projects that are planning to build on these technologies. In particular the AWDL will be tested for its robustness considering metrics of quality in different scenarios and under different conditions measured from the application layer.

// *Use cases.* Like already mentioned in *Motivation*, direct #gls("ptp") technologies leverage ad-hoc networks to enable communication even when no infrastructure is available. Reasons can vary from environmental disasters to the lack of coverage in less developed countries or instances of governmental censorship. In addition to facilitating communication, this technology can also be employed in location based services.  For example, advertising based on proximity to an upcoming football match, or social media that could tell the user about nearby friends without the necessity to access GPS data. TODO...a bit MORE Usecases, because there are actually a lot. Moreover, confirming to a well defined protocol could also improve interoperability between apps, where social media applications could benefit from advertising proximity beacons of nearby independent shops. 

