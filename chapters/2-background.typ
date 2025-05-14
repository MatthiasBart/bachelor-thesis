#import "global.typ": *

= Background<background>

This section tries to describe and familiarize with concepts of networking topologies for mobile devices. From an abstract perspective networking can be categorized into infrastructure and ad-hoc networks, one relying on mediators while the other works without intermediary infrastructure letting the participants itself form the network. Other than that iOS technologies used in the process are described.

== Infrastructure Networks 

The #gls("nist") defines infrastructure networks as "a wireless network that requires the use of an infrastructure device, such as an access point or a base station, to facilitate communication between client devices" @nist_infrastructure_2018. Using underlying infrastructure that spans over wide areas let users communicate to seemingly anywhere. This is achieved due to a widespread net of connected computers called the internet, which is defined by the #gls("ietf") as "the single, interconnected, worldwide system of commercial, governmental, educational, and other computer networks that share (a) the protocol suite specified by the #gls("iab") (#gls("rfc", long: true) 2026) and (b) the name and address spaces managed by the #gls("icann") @shirey_internet_2007. While the user is connected he can communicate to nearly anywhere but when out of reach of the next entry point the user can not even transfer data to nearby device, no matter how close these might be. 

== Ad-hoc Networks

The #gls("nist") defines ad-hoc networks as "a wireless network that allows easy connection establishment between wireless client devices in the same physical area without the use of an infrastructure device, such as an access point or a base station" @nist_adhoc_2022. Even when the next entry point to the internet is out of reach nearby devices can communicate with each other but are limited to the nodes that form this new separate network. 

== Satellite phones<satellite>

While satellite phones seemingly solve the mentioned problems they are not widely spread in the day-to-day use and only used for emergency services or roadside assistance in modern iPhones @apple_inc_connect_2025. Another problem that is increasingly present is space debris which has more than doubled since 2007 and is yet to increase with more and more space missions emerging. These junks of different parts of satellites or rockets can potentially destroy more satellites which again leads to more space debris or outages in GPS or satellite phoning services @european_space_agency_about_2017. 

=== Starlink Direct to Cell<starlink>

While Starlink operates on similar ideas they offer multiple advantages over normal geostationary satellites. While geostationary satellites orbit at 35.786 kilometers Starlink satellites orbit much closer at about 550 kilometers from the Earth reducing latency and decreasing space traffic in the geostationary field. Starlink also claims that their satellites include a collision avoidance system which notices potential collisions and actively dodges the other object @starlink_satellite_2025.

#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/starlink.png", width: 55%)
    ),
    caption: [Abstract structure of Starlink's network. @starlink_satellite_2025]
  )<fig:starlink>


== Specific Ad-hoc technologies 

While <satellite> and <starlink> solve the issue of dead spots, they also rely on infrastructure which needs to be taken care of or can be damaged. The following is an incomprehensive list of ad hoc technologies.

=== #gls("wifi")

#gls("wifi") is a trademark for #gls("ieee") wireless communication standard 802.11 based technologies which already exists for over two decades. The #gls("ieee") 802.11 standard defines the protocols that are used to establish a connection with current #gls("wifi") wireless nodes, including routers or access points whereas the correlating #gls("wifi") versions is just used for marketing purposes and matches an underlying 802.11 specification @wi-fi_alliance_discover_2023 @cisco_systems_inc_what_2025.

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt, 
    table.header([*Generational name*], [*Technology supported*]), 
    [#gls("wifi") 7], [802.11be],
    [#gls("wifi") 6], [802.11ax],
    [#gls("wifi") 5], [802.11ac],
    [#gls("wifi") 4], [802.11n],
  ), caption: [#gls("wifi") versions and the correlating #gls("ieee") 802.11 standards.]
)

The #gls("wifi") Direct trademark enables #gls("wifi") devices to connect directly without underlying infrastructure. However this specification has not been widely adopted because of high energy consumption and lack of performance where establishing a connection could take four to ten seconds @camps-mur_device--device_2013. #gls("wifi") Direct is not available in iPhones @quinn_the_eskimo_ios_2015.

=== Bluetooth

Bluetooth a short range wireless technology enables connection between two nearby devices without relying on supporting infrastructure very similar to #gls("wifi") Direct. The protocol operates on 2.4 GHz and it features two separate standards today, Bluetooth Classic and #gls("ble", long: true) which is optimized for low energy consumption. Today Bluetooth is mostly used to connect computers to external peripherals like mice, keyboards or headphones. Using Bluetooth for data transfer is not preferred since its data rate is very limited. @intel_corporation_what_2022 @cybersecurity__infrastructure_security_agency_understanding_2021. The benefit of using Bluetooth is its wide spread and compatibility between different vendors. 

=== LoRaWan

LoRaWan specification is a Low Power, Wide Area networking specification created to connect #gls("iot") devices to the internet. The specification features key requirements for the #gls("iot") use such as bi-directional communication, end-to-end security or location services. Also this specification is optimized to use little energy consumption since LoRaWan usually target #gls("iot") devices that are far away and not connected to any cables. It normally operates in unlicensed frequency bands and is capable of communicating up to 15 kilometers in rural areas. While this key features would also perfectly suit #gls("ios") #gls("ptp") communication no support for this technology is given on iPhones @lora_alliance_what_2024.

#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/lorawan.png", width: 75%)
    ),
    caption: [Abstract structure of LoRaWan network. @lora_alliance_lorawan_2021]
  )<fig:lorawan>

=== #gls("5g") #gls("sl")

#gls("5g") #gls("sl") the successor of #gls("lte")-Direct is capable of connecting #gls("ue")s directly without an intermediate base station but also to act as a relay for #gls("ue")s toor far away of the next #gls("gnb") @vijitha_weerackody_who_2023. This is generally designed for public safety or military operations used for #gls("uva")s @barnes_how_2023 although approaches existed to introduce it into commercial markets @qualcomm_technologies_inc_lte_2014. Again #gls("ios") peer-to-peer communication would highly benefit from such technologies but unfortunately no developer support for this technology is given @apple_inc_apple_2024. 

#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/sidelink5g.png", width: 75%)
    ),
    caption: [Abstract structure of 5G #gls("sl") network. @ieee_communication_society_5g_2023]
  )<fig:sidelink>

=== #gls("nfc")

#gls("nfc") is a communication technology which operates at a base frequency of 13.56 Mhz. It can transfer data with a typical range of 2cm and data rates up to 1.7 Mbps. The technology is also used to connect to non powered peripherals such as bank cards @nfc_forum_nfc_2025. Apple makes this technology also accessible to #gls("ios") and #gls("ipados") developers but explicitely states that it is not supported in other Apple platforms @apple_inc_nfc_2025. 

=== #gls("uwb")

#gls("uwb") in general is a radio technology focused on precise ranging and locating using a low energy density over a large radio spectrum @android_developers_ultra-wideband_2025. Apple allows developers to access their #gls("uwb") interface on iPhones and Apple Watches through the Nearby Interaction framework @apple_inc_nearby_2025 which is built to locate nearby devices also using the distance and direction.

== #gls("ios")

The following part tries to familiarize with technologies used in the testing process of this thesis. 

=== Bonjour

Bonjour is a former proprietary zero-configuration network protocol suite over #gls("ip") that Apple has submitted to the #gls("ietf"). The proposed zero-configuration solutions covers #gls("ip") addressing, name-to-address translation on local networks using #gls("mdns") and service discovery. Using Bonjour on Apple platforms is done via appropriate frameworks leaving the responding of #gls("mdns") queries to the #gls("mdns")Responder daemon @apple_inc_bonjour_2013. 

=== #gls("ips")

Most of networking in mobile devices relies on the #gls("tcp")/#gls("ip") protocol suite also called #gls("ips"). The #gls("ips") is a set of networking protocols specified by the #gls("ietf") also often referred to as "#gls("tcp")/#gls("ip")" protocol stack. It is split into five protocol layers -- Application, Transport, Internet, Network Interface and Network Hardware --, however for this thesis only the first two are relevant and listed below @shirey_internet_2007.

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/ips_layers.txt")),
    ),
    caption: flex-caption(
      [Textual graphic showing the defined layers of the #gls("ips") @shirey_internet_2007.], [Layers of the #gls("ips") @shirey_internet_2007.],
    ),
) <lst:ips_layers>

==== Application Layer

The Application Layer covers the data the application program run by the user wants to transmit and only interacts with the next lower Transport Layer. Based on the applications needs data can be transferred as a continuous stream or package based where the Transport Layer handles interaction with the next Internet Layer @network_working_group_requirements_1989.

==== Transport Layer

The Transport Layer "divides application data into packets, adds a destination address to each, and communicates them end-to-end -- from one application program to another -- optionally regulating the flow and ensuring reliable (error-free and sequenced) delivery" @shirey_internet_2007. 

===== #gls("tcp")

#gls("tcp") is an internet standard, transport layer protocol that reliably transmits data in the same order via error checked delivery and congestion control via #gls("caa"). It can be directly accessed on Apple platforms using the C based #gls("bsd", long: false)Sockets or the Network Framework @apple_inc_tn3151_2023.

====== Nagles Algorithm

Due to the 20 byte #gls("tcp") header there has been a relatively high overhead when sending small packages which in worst case could lead to congestion collapse considering the error prevention of the #gls("tcp") protocol. This algorithm therefore inhibits the sending of new #gls("tcp") segments as long as no previously transmitted data stays unacknowledged. This algorithm is enabled by default on #gls("ios") systems @apple_inc_network_2025-1 and while testing the prototype has lead to highly reduced #gls("ip") package number sent compared to the data slices sent from the Application Layer @nagle_congestion_1984. 

===== #gls("udp")

#gls("udp") is a Transport Layer protocol that implements the "fire-and-forget" concept. Packages are sent whenever data is received from the Application Layer without guarantee that they will be delivered or that they will be received in the same order they had been sent. 

===== #gls("quic")

In 2012 another transport protocol was developed by engineers at Google called #gls("quic"). #gls("quic") builds upon #gls("udp") and is oriented to replace #gls("tcp") based applications since it also features congestion and error control features. Compared to #gls("udp") and #gls("tcp") #gls("quic") has built in #gls("tls") 1.3 support and does not allow non encrypted connections. 

=== #gls("awdl")

#gls("awdl") was developed by Apple due to concerns regarding #gls("wifi") Alliance's #gls("wifi") Direct specification and eventually got adopted by the #gls("wifi") Alliance as the basis for Neighbor Awareness Networking (NAN) @cheshire_proximity_2018. It is undocumented @stute_open_2018, based on IEEE 802.11 ad hoc protocol and built to let mobile devices communicate directly with each other without utilizing an intermediary access point. It is heavily used in Apple's Continuity platform @stute_disrupting_2021. 

== Summary

Although all wireless communication technologies serve the same purpose a lot of variants have emerged that are fine tuned for more precise use cases. Since infrastructure networking has nowadays proved its worth upcoming ad-hoc solutions tend to be compatible with the overlaying #gls("ips") like #gls("awdl"). 

// #(
//   [
//   In the background section you might give explanations which are necessary to
//   read the remainder of the thesis. For example define and/or explain the terms
//   used. Optionally, you might provide a glossary (index of terms used with/without
//   explanations).

//   *Hints for equations in Typst*:

//   Mathematical formulas are (embedded in `$`) in Typst. For example:

//   The notation used for #textbf([calculating]) of #textit([code performance]) might
//   typically look like shown in @eq:performance, i.e. the first one for *slow* in
//   @slow and the other one for *very slow* in @veryslow.

//   ])

//   #figure(
//     kind: math.equation, align(left, [
//       #set math.equation(numbering: "(I)", supplement: [Eq.])
//       $ O(n) = n^2 $ <slow>
//       $ O(n) = 2^n $ <veryslow>
//     ]), caption: flex-caption([Equations calculate the performance.], [Performance.]),
//   ) <eq:performance>

//   #figure(
//     kind: math.equation, align(
//       left, [
//         In the text we refer multiple times to $phi.alt$. We define it to be calcultated
//         as shown here:
//         #set math.equation(numbering: "(I)", supplement: [Eq.])
//         $ d &= 24 -10 - 7 - sqrt(3) \
//           d &= 14 - 7 - sqrt(3) \
//           d &= 7 - sqrt(3) $ <diff>
//         $ phi.alt := d / 3 $ <ratio>
//       ],
//     ), caption: flex-caption(
//       [A custom definition of $phi.alt$ allows to shorten upcoming equations.], [Phi defined in two steps.],
//     ),
//   ) <eq:phidef>


// #([
//   The @eq:phidef explains (for the single steps see @diff and @ratio) how the
//   overall $phi.alt$ is calculated to be used in the upcoming formulas of this
//   thesis.

//   ],
// )

// Describe that all of mobile connections use mediators and why this happend like it and why it is beneficial (bigger antennas that can handle weaker signals and send stronger signals) 
// describe what has changes in the last years on apples platform and why non-mediator communication got so important for apples ecosystem, apple watch pairing, clone app to mac (when opened on iphone, eg. calendar), cmd+c and cmd+v via across iphone and mac
// what is lorawan and how could it be used one day in smartphones and mobile computing
// describe why peertopeer wlan or bluetooth is not yet suitable for long distance communications, 
// also mention the longest wlan connection, 273km with bigger antennas

// describe what was used on ios device what frameworks exist. how bluetooth was used and how #gls("wifi") is now used for ptp connections