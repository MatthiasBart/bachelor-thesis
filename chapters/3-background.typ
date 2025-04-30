#import "global.typ": *

= Background<background>

This section tries to describe and familiarize with concepts of networking topologies for mobile devices. From an abstract perspective networking can be categorized into infrastructure and ad-hoc networks, one relying on mediators while the other works without intermediary infrastructure letting the participants itself form the network.

== Infrastructure Networks 

The national institute of standards and technology (NIST) defines infrastructure networks as "a wireless network that requires the use of an infrastructure device, such as an access point or a base station, to facilitate communication between client devices" @nist_infrastructure_nodate. Using underlying infrastructures that span over wide areas let users communicate to seemingly anywhere. This is achieved due to a widespread net of connected computers called the internet, which is defined by the internet engineering task force (IETF) as "the single, interconnected, worldwide system of commercial, governmental, educational, and other computer networks that share (a) the protocol suite specified by the IAB (RFC 2026) and (b) the name and address spaces managed by the ICANN" @shirey_internet_nodate. While the user is connected he can communicate to nearly anywhere but when out of reach of the next entry point the user can not even transfer data nearby device, no matter how close these might be. 

== Ad-hoc Networks

The NIST defines ad-hoc networks as "a wireless network that allows easy connection establishment between wireless client devices in the same physical area without the use of an infrastructure device, such as an access point or a base station" @nist_adhoc_nodate. Even when the next entry point to the internet is out of reach nearby devices can communicate with each other but are limited to the nodes that form this new separate network. 

== Satellite phones<satellite>

While satellite phones seemingly solve the mentioned problems they are not widely spread in the day-to-day use and mostly used for emergency services or roadside assistance in modern iPhones @apple_inc_connect_2025. Another problem that is increasingly present are space debris which have more than doubled since 2007 and is yet to increase with more and more space missions emerging. These junks of different parts of satellites or rockets can potentially destroy more satellites which again leads to more space debris or outages in GPS or satellite phoning services @european_space_agency_about_nodate. 

=== Starlink Direct to Cell<starlink>

While Starlink operates on similar ideas they offer multiple advantages over normal geostationary satellites. While geostationary satellites orbit at 35.786 kilometers starlink satellites orbit much closer at about 550 km from the Earth reducing latency and decreasing space traffic in the geostationary field. Starlink also claims that their satellites include a collision avoidance system which notices potential collisions and actively dodges the other object @starlink_satellite_nodate.

#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/starlink.png", width: 25%)
    ),
    caption: [Abstract structure of Starlink's network.]
  )<fig:starlink>



== Specific Ad-hoc technologies 

While <satellite> and <starlink> solve the issue of dead spots, they also rely on infrastructure. The following is an incomprehensive list of ad hoc technologies.

=== WiFi

WiFi is a trademark for IEEE wireless communication standard 802.11 based technologies which already exists for over two decades. The IEEE 802.11 standard defines the protocols that are used to establish a connection with current WiFi wireless nodes, including routers or access points whereas the correlating WiFi versions is just used for marketing purposes and matches an underlying 802.11 specification @wi-fi_alliance_discover_2023 @cisco_systems_inc_what_nodate.

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt, 
    table.header([*Generational name*], [*Technology supported*]), 
    [WiFi 7], [802.11be],
    [WiFi 6], [802.11ax],
    [WiFi 5], [802.11ac],
    [WiFi 4], [802.11n],
  ) 
)

The WiFi Direct trademark enables WiFi devices to connect directly without underlying infrastructure. However this specification has not been widely adopted because of high energy consumption and lack of performance where establishing a connection could take fro four to ten seconds @camps-mur_device--device_2013. WiFi Direct is not available in iPhones @quinn_the_eskimo_ios_2015.

=== Bluetooth

Bluetooth a short range wireless technology enables connection between two nearby devices without relying on supporting infrastructure very similar to WiFi Direct. The protocol operates on 2.4 GHz and is features two separate standards today, Bluetooth Classic and Bluetooth Low Energy which is optimized for low energy consumption. Today Bluetooth is mostly used to connect computers to external peripherals like mice, keyboards or headphones. Using Bluetooth for data transfer is not preferred since its data rate is limited to 2 Mbps @intel_corporation_what_2022 @cybersecurity__infrastructure_security_agency_understanding_2021. 

=== LoRaWan

LoRaWan specification is a Low Power, Wide Area networking specification created to connect IoT devices to the internet. The specification features key requirements for the IoT use such as bi-directional communication, end-to-end security or location services. It usually operates in unlicensed frequency bands and is capable of communicating up to 15 km in rural areas. While this key features would also perfectly suit iOS peer-to-peer communication no support for this technology is given on iPhones @lora_alliance_what_nodate.

#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/lorawan.png", width: 75%)
    ),
    caption: [Abstract structure of LoRaWan network.]
  )<fig:lorawan>
  //https://lora-alliance.org/wp-content/uploads/2021/10/LA-TC-Stack-01-1536x708.png

=== 5G Sidelink

5G Sidelink (SL) the successor of LTE-Direct is capable of connecting user equipments directly without an intermediate base station @vijitha_weerackody_who_2023. This is generally designed for public safety or military operations used for unmanned vehicles @barnes_how_2023 although approaches existed to introduce it into commercial markets @qualcomm_technologies_inc_lte_2014. Again iOS peer-to-peer communication would highly benefit from such technolgies but unfortunately no developer support for this technology is given @apple_inc_apple_2024. 
//https://www.comsoc.org/sites/default/files/styles/768wide/public/images/2023-2023-02/ctn-feb-2023-figure5.png?itok=GVi73s6A
#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/sidelink5g.png", width: 75%)
    ),
    caption: [Abstract structure of 5G SL network.]
  )<fig:sidelink>

=== NFC

Near Field Communication is a communication technology which operates at a base frequency of 13.56 Mhz. It can transfer data with a typical range of 2cm and data rates up to 1.7 Mbps. The technology is also used to connect to non powered peripherals such as bank cards @nfc_forum_nfc_nodate. Apple makes this technology also accessible to iOS and iPadOS developers but explicitely states that it is not supported in other Apple platforms @apple_inc_nfc_nodate. 

=== UWB

Apple allows developers to access their Ultra Wideband (UWB) interface on iPhones and Apple Watches through the Nearby Interaction framework @apple_inc_nearby_nodate which is built to locate nearby devices also using the distance and direction. UWB in general is a radio technology focused on precise ranging and locating using a low energy density over a large radio spectrum @android_developers_ultra-wideband_2025. In Apples article about the advanced ranging capabilities of second generation UWB chips which are included in iPhone 15 and above they use a maximum distance of 50 meters @apple_inc_extending_nodate. 

== iOS

The following part tries to familiarize with technologies used in the testing process of this thesis. 

=== Bonjour

Bonjour is a former proprietary zero-configuration network protocol suite over IP that Apple has submitted to the IETF. The proposed zero-configuration solutions covers IP addressing, name-to-address translation on local networks using #gls("mdns") and service discovery. Using Bonjour on Apple platforms is done via appropriate frameworks leaving the responding to #gls("mdns") queries to the mDNSResponder daemon @apple_inc_bonjour_2013. 

=== IPS

The Internet Protocol Suite (IPS) is a set of networking protocols specified by the IETF also often referred to as "TCP/IP" protocol stack. It is split into five protocol layers -- Application, Transport, Internet, Network Interface and Network Hardware --, however for this thesis only the first two are relevant and listed below @shirey_internet_nodate.

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/ips_layers.txt")),
    ),
    caption: flex-caption(
      [Textual graphic showing the defined layers of the Internet Protocol Suite.], [Layers of the Internet Protocol Suite.],
    ),
) <lst:ips_layers>

==== Application Layer

The Application Layer covers the data the application program run by the user wants to transmit and only interacts with the next lower Transport Layer. Based on the applications needs data can be transferred as a continuous stream or package based where the Transport Layer handles interaction with the next Internet Layer.

==== Transport Layer

The Transport Layer "divides application data into packets, adds a destination address to each, and communicates them end-to-end -- from one application program to another -- optionally regulating the flow and ensuring reliable (error-free and sequenced) delivery." 

===== Transport Control Protocol

TCP is an internet standard, Transport layer protocol that reliably transmit data in the same order it was sent utilizing congestion and error controlling. It can be directly accessed on Apple platforms using the C based BSDSockets or the Networking Framework @apple_inc_tn3151_2023.

====== Nagles Algorithm

Due to the 20 byte TCP header there has been a relatively high overhead when sending small packages which in worst case could lead to congestion collapse considering the error prevention of the TCP protocol. This algorithm inhibits the sending of new TCP segments as long as no previously transmitted data stays unacknowledged. This algorithm is enabled by default on iOS systems @apple_inc_network_nodate-1 and while testing the prototype has lead to highly reduced IP package number sent compared to the data slices sent from the Application Layer @nagle_congestion_1984. 

===== User Datagram Protocol

UDP is a Transport Layer protocol that implements the "fire-and-forget" concept. Packages are sent whenever data is received from the Application Layer without guarantee that they will be delivered or that they will be received in the same order they had been sent. 

===== QUIC

QUIC is a Transport Layer protocol that builds upon UDP and is oriented to replace TCP based applications since it also features congestion and error control features. Compared to UDP and TCP QUIC has built in TLS 1.3 support and does not allow non encrypted connections. 

=== #gls("awdl")

Apple Wireless Direct Link was developed by Apple due to concerns regarding WiFi Alliance's WiFi Direct specification and eventually got adopted by the WiFi Alliance as the basis for Neighbor Awareness Networking (NAN) @cheshire_proximity_2018. It is based on IEEE 802.11 ad hoc protocol and built to let mobile devices communicate directly with each other without utilizing an intermediary access point. It is heavily used in Apple's Continuity platform @stute_disrupting_2021. 

== Summary


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

// describe what was used on ios device what frameworks exist. how bluetooth was used and how wifi is now used for ptp connections