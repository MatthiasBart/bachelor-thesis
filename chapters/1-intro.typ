#import "global.typ": *

= Introduction

Nowadays communicating via smartphones or tablets always invariably on infrastructure. In most homes in developed countries one can find a local network advertised by WiFi technology and handled by a router. Being outside and not connected to a local network, mobile devices communicate with cellular towers that give access to a big underlying network managed by an ISP. Wherever we go, our mobile devices are connected, but relying on infrastructure that is not necessarily available all the time. Different reasons can lead to restricted or broken infrastructure which, in absence of ad-hoc technologies would break all communication. In countries with governmental protests cellular networks might be restricted or monitored. Another reason for disfunctioning infrastructure networks could be overwhelming usage, where a high number of people try to use the same cellular tower or environmental disasters which can take down power supply or network nodes itself. In all these cases users would highly profit from ad-hoc networks, that do not rely on any external dependencies.

In recent years support for local peer-to-peer technologies, that allow devices to directly communicate via local radio link broadcasts has improved in modern smartphones. This could enable scenarios in which numerous end devices connect together, to form a wide spread mesh network or gain better connectivity because needed infrastructure is out of reach. Nowadays many different technologies exist to gain access to wide area ad-hoc connections like LTE-Direct or LoraWan. However, it is important to note that these technologies are not yet supported in smartphones and there is no guarantee that they will ever be. These days WiFi is predominantly used to facilitate local peer-to-peer connectivity in smartphones, whereby unfortunately every mobile operating system has created its own version which makes communication between smartphones from different manufacturers complex. Furthermore, the extent to which these technologies can provide stable data transfer and the quality with which they can do so, remains unclear. This information is essential for a further evaluation of the feasibility of applications based on direct peer-to-peer connections. Therefore this thesis aims to address the existing uncertainty by measuring metrics that can assist this evaluation of analogous applications.
// In the contemporary era, the utilisation of smartphones or tablets for communication invariably depends on the existence of infrastructure. In many developed countries, residential properties are equipped with local networks that utilise WiFi technology and are managed by routers. In the absence of a local network, mobile devices utilise cellular towers to access a vast underlying network, which is managed by an Internet Service Provider (ISP). This reliance on infrastructure, however, is not guaranteed, as it is subject to the availability of the necessary infrastructure. The presence of restricted or broken infrastructure can be attributed to various reasons, which, in the absence of ad-hoc technologies, would result in the cessation of all communication. In countries experiencing governmental unrest, cellular networks may be subject to restrictions or monitoring. A further reason for the failure of infrastructure networks could be overwhelming usage, where a high number of people attempt to use the same ISP tower, or environmental disasters which take down power supply or network nodes. In such circumstances, ad-hoc networks, which do not rely on external dependencies, become a highly advantageous solution for users. In recent years, there has been an enhancement in the support for local peer-to-peer technologies in modern smartphones, which facilitate direct communication via local radio link broadcasts. This technological benefit has the potential to facilitate scenarios where numerous end devices can connect and collaborate to form a wide-spread mesh network, or to enhance connectivity by bypassing the need for accessible infrastructure. It is evident that there is a plethora of technologies that facilitate wide-area ad hoc connections, including LTE-Direct and LoraWan. However, it is important to note that these technologies are not yet supported in smartphones and there is no guarantee that they will ever be. These days WiFi is predominantly used for the purpose of facilitating local peer-to-peer connectivity. However, it is important to note that each provider has developed its own unique version of this technology, which has the unfortunate consequence of complicating communication between smartphones that operate on divergent operating systems. Furthermore, the extent to which these technologies can facilitate data transfer, and the quality with which they can do so, remains to be ascertained. This is essential for the subsequent evaluation of the feasibility of applications based on direct peer-to-peer transfer. This thesis aims to address this existing uncertainty by measuring metrics that can assist in evaluating the feasibility of analogous applications.
// Change intro to describe in general the ptp connectivity not related to MC framework since this doesnt support Bluetooth, which was the only reason to use that framework... 

"Latency and throughput in direct peer-to-peer mobile networks depend on the choice of transport protocol and the characteristics of AWDL."

"Direct peer-to-peer ad hoc networks can improve connectivity between mobile devices by reducing dependence on external infrastructure."
"Different transport protocols impact the efficiency and reliability of communication in mobile ad hoc networks."


#v(1em)
#quote(
  [Most smartphone communication leverages one hop radio links to cell towers or WiFi access points. In recent years, however, the major smartphone operating systems have included increasingly stable and useful support for local peer-to-peer communication that allows a device to talk directly to a nearby device (using local radio broadcast) while avoiding cellular and WiFi infrastructure. The ability to create these local links, combined with the ubiquity of smartphones, enables scenarios in which large groups of nearby smartphone users run applications that create peer-to-peer meshes supporting infrastructure-free networking. There are many possible motivations for these smartphone peer-to-peer networks. For example, they can support communication in settings where network infrastructure is censored (e.g., government protests), overwhelmed (e.g., a large festival or march), or unavailable (e.g., after a disaster or at a remote event). In addition, in developing countries, cellular data minutes are often bought in blocks and carefully conserved—increasing interest in networking operations that do not require cellular infrastructure.], [#cite(<Newport_2017>, form: "author"), #cite(<Newport_2017>, form: "year")],
)
#v(1em)

As of 2024 4 billion people worldwide are using smartphones @Statista_2024, 27% of them are using iOS. iOS is the operating system used on iPhones and developed by Apple. This operating system also utilizes its own implementation of an ad-hoc WiFi protocol which leads to an incompatibility with devices, not from the Apple ecosystem. In the Apple ecosystem however all devices suport

Apple Wireless Direct Link (AWDL) is Apple's implementation for direct one hop connections and is already used by Apple for applications like AirDrop, AirPlay or Gamekit. Until previously this has not been Apple's only option. Until iOS 11 the Multipeer Connectivity Framework also used Bluetooth on the physical layer, which was then removed and replaced by AWDL. Bluetooth can still be accessed by application developers, via the Bluetooth Core Framework, is more versatile and compatible also for non Apple devices. Although Bluetooth has improved range and speed in recent years, also for mobile end devices, AWDL is the recommended technology to establish direct links between iOS devices. Therefore the Networking Framework, included in the iOS SDK is used to establish and test the quality of connections between iOS devices, which exposes a transport layer interface to use and control protocols like UDP, TCP or QUIC. 

This thesis analyses and measures the capabilities of the latest iOS devices to communicate via direct #gls("ptp") networks. Since most of current technology standards rely heavily on external infrastructure with powerful receiver antennas, direct #gls("ptp") communication is not yet wide spread or optimized to function over long distances. However it is unclear, where the boundaries of the current implementations lie and therefore which type of applications could be implemented with direct #gls("ptp"). The results aim to help assess feasibility of different implementations. 
// Examples vary from secure communications inside a companies headquarter to city wide mesh networks or connectivity in dangerous situations where no cellular tower is in reach.

== Motivation 
 
*Motivation.* Modern mobile devices can make use of a wide variety of communication technologies. Besides having different applicabilities and protocols, standards like Bluetooth, WiFi or 5G need to be wireless to seamlessly transfer data. In resent years global economic demand has impacted research and development to vastly improve data transmission and hardware on smartphones. As of 2024 this led to over 4 billion smartphones users worldwide @Statista_2024. Unfortunately most of the communication methods used on smartphones all rely on mediators. Be it a router in a local network or a cell tower in a cellular network, without these nodes a connection between two peers can not be established, no matter how close neighboring devices may be. However in scenarios where the required infrastructure is not available or data needs to be handled sensitive, communication between two mobile devices can be established via Bluetooth or peer-to-peer WiFi since these do not required pre-existing infrastructure and purely rely on local radio broadcast. Due to the latest advancements in these technologies and smartphone hardware, it is unclear how good direct #gls("ptp") networks work under certain conditions. This thesis tries to find and measure metrics that indicate the quality of direct #gls("ptp") connections on Apple's mobile devices. This can help to evaluate the feasibility of projects that are planning to build on these technologies. In particular the Multipeer Connectivity Framework accessible from iOS 7.0+ will be tested for its robustness considering metrics of quality in different scenarios and under different conditions.

Direct peer to peer connectivity is used heavily in mobile computing, especially in the Apple ecosystem. Some examples of direct connections include the shared clipboard on apples devices as well as technologies such as Aridrop or Gamekit. 

// Examples could vary from wide spread mesh networks to company wide information transfer for sensitive data or applications that leverage nearby locations to advertise and interact with a smartphone user. 

*Use cases.* Like already mentioned in *Motivation*, direct #gls("ptp") technologies leverage ad-hoc networks to enable communication even when no infrastructure is available. Reasons can vary from environmental disasters to the lack of coverage in less developed countries or instances of governmental censorship. In addition to facilitating communication, this technology can also be employed in location based services.  For example, advertising based on proximity to an upcoming football match, or social media that could tell the user about nearby friends without the necessity to access GPS data. TODO...a bit MORE Usecases, because there are actually a lot. Moreover, confirming to a well defined protocol could also improve interoperability between apps, where social media applications could benefit from advertising proximity beacons of nearby independent shops. 

== Research Definition

*Research Questions*

This thesis tries to answer if direct #gls("ptp") connections between Apple devices can improve connectivity in contrast to commercial infrastructure technologies. This helps to answer if new forms of mobile connections can already be approached and if they should be further investigated and improved.

*Hypothesis*

$H_1$

Direct #gls("ptp") connections on Apple devices can enhance connectivity in different scenarios and therefore work as an alternative to mediator based communication technologies.

$H_2$

Direct #gls("ptp") connections on Apple devices have more bandwidth than the average bandwidth in modern 5G technologies.


// #todo(
//   [ State a hypothesis – a rough idea – of how you think a solution might look
//     like. Explain, how to possibly solve a given problem. ],
// )

*Method*

A prototype application will be developed that will serve as a tool to measure the quality of the connection. The metrics will be defined in the test protocol in @implementation. In addition, different testing scenarios, indicating various characteristics of real life scenarios will be tested to cover most areas of application. Measurement of connection quality will be purely based on values captured by the prototype app itself. The characteristics of the environment will be first described based on human perceive and depending on the environment measured with suitable methods. The distance between the devices will always be measured using...

== Summary

Since the latest smartphones have improved hardware and operating system support for direct #gls("ptp"), it is unclear how well these technologies can currently serve direct communication under different conditions. Focusing on the Apple platform, an iOS application is developed, that serves as testing utility. After discussing related work that summarizes past attempts, considerations and benefits of direct communication in @relatedwork, @background will provide all required knowledge to understand the concepts of the design and decisions made to best answer if or when latest technology is/will be ready to rely on direct #gls("ptp") communication.

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
