#import "global.typ": *

= Implementation <implementation>

After discussing the broad approach to testing in @concept @fig:implementation_obfuscated nicely shows the things already covered. The following section tries to get more narrow on defining the tools used and the testing done to fill the below image with more information.

#figure(
  box(stroke: gray, inset: 1em,
    image("/figures/implementation_obfuscated.jpg", width: 75%)
  ),
  caption: [Abstract representation of testing concept without implementation details.]
)<fig:implementation_obfuscated>

== Prototype 

The application is written in #gls("swift") using the  #gls("ide") #gls("xcode"), which is the suggested way to build #gls("ios") application by Apple. The built artifact is distributed via TestFlight, an online service for installing and testing apps for Apple devices and can be downloaded via an #gls("url") or directly installed by the developer machine. The application is written using a modified version of the #gls("mvvm") #gls("gui") design pattern. The application must feature a mechanism to find local peers, connect them and intercept data transfer to measure metrics. The technologies used to achieve these features are described in the following sections. 

=== User Interface

The #gls("gui") is developed using SwiftUI #footnote("https://developer.apple.com/xcode/swiftui/"), a declarative way to build applications across all Apple platforms. Considering the aforementioned features the application is split into five different screens each one serving a specific purpose in the process of establishing the connection and transferring data. The screens are listed below in the order the user would walk through during a testing procedure and are called views to match terminology of the #gls("mvvm") pattern. 

==== Decision View

This view is the first a tester sees when opening the application and is responsible for configuring the next steps of testing. Depending on the decision the tester makes the application is initialized as a client that browses for nearby services or as a server that advertises a service to nearby clients. 

#figure(
  box(
    stroke: gray,
    height: 193pt,
    width: 20%,
    image("/figures/decision.PNG", width: 98%)
  ),
  caption: [Screenshot of decision screen to select server/client configuration.]
)<fig:decision_view>

==== Server View

The server views purpose is to present the user the state of each connection and the test results which were measured on the server. For this, the user has to tap the `Get Test Results` button in the right corner of the top tool bar. On the server view, the user can also tap the `Reload` button which aborts all ongoing connections, destructs the server objects and creates new ones which immediately start advertising again. 

#figure(
  image("/figures/server.PNG", width: 20%),
  caption: [Screenshot of server screen showing underlying protocols and associated metrics.]
)<fig:server_view>

==== Client Views

The client view is split into separate steps since the client needs to find nearby peers and connect to them. Only after a successful connection was established the testing can begin.

===== Browser View

The browser view lists all nearby servers found. Through a tap on an item the client tries to connect to the advertiser and navigates to the testing view.

#figure(
  image("/figures/browser.PNG", width: 20%),
  caption: [Screenshot of browser screen to select nearby advertisers.]
)<fig:browser_view>

===== Testing View

The testing views purpose is to present the user the state of each connection and the test results which were measured on the client. Furthermore the buttons `Start Test` initiate the sending of the test data for the associated connection. The testing view, as well as the server view features a `Reload` button that aborts all ongoing connections, destructs and reinitializes all client objects and navigates the user back to the browser view. There the user can select another server to connect to.

#figure(
  image("/figures/testing.PNG", width: 20%),
  caption: [Screenshot of testing screen to start testing and display associated information.]
)<fig:testing_view>

=== Networking Frameworks 

Apple provides different frameworks for #gls("ptp") connections using different layers of abstraction or different underlying technologies. One of these frameworks is called Multipeer Connectivity. Newport describes it as an implementation of the mobile telephone model #cite(<newport_gossip_2017>, form: "year") in his article about gossip in smartphone #gls("ptp") networks. Apple states, the framework "supports the discovery of services provided by nearby devices and supports communicating with those services through message-based data, streaming data, and resources (such as files). In #gls("ios"), the framework uses infrastructure #gls("wifi") networks, #gls("ptp") Wi-Fi, and Bluetooth personal area networks for the underlying transport. In #gls("macos") and #gls("tvos"), it uses infrastructure #gls("wifi"), #gls("ptp") #gls("wifi"), and Ethernet" #footnote("https://developer.apple.com/documentation/multipeerconnectivity"). Contrary to this excerpt of the documentation, tests and information gathered from Apple's developer forum conclude that Mulipeer Connectivty does not support Bluetooth for #gls("ptp") networking anymore and got disabled with the release of #gls("ios") 11 @quinn_the_eskimo_ios_2017. 

In an approach to give a brief overview about Apples networking #gls("api")s, Apple describes Multipeer Connectivity as a high-level interface to Apples #gls("ptp") #gls("wifi") support and also introduces the Network Framework, which is considered a low-level interface by Apple engineers @quinn_the_eskimo_network_2024. Apples Documentation states developers should use this framework when they need direct access to protocols like #gls("tls"), #gls("tcp"), and #gls("udp") for their custom application protocols. The Network framework features opt-in support for #gls("ptp") connection establishment via #gls("awdl") and also does not support connecting via Bluetooth, which is accessible through the Core Bluetooth Framework. @apple_inc_tn3151_2023

Nearby Interaction is yet another framework to establish #gls("ptp") connections. It uses the iPhones #gls("uwb") chip to "locate and interact with nearby devices using identifiers, distance, and direction" #footnote("https://developer.apple.com/nearby-interaction/"). These chips are usually used in smaller distances to precisely locate compatible hardware, so in examples from Apples #gls("wwdc") distances of one and a half to three meters are shown which does not meet the requirements for this experiments @apple_inc_explore_2021. However in Apples article about the advanced ranging capabilities of second generation UWB chips which are included in iPhone 15 and above they use a maximum distance of 50 meters @apple_inc_extending_2025. 

Nevertheless following Apples recommendations documented in a tech note about choosing the right networking #gls("api"), the Networking framework is suggested for establishing a connection and transferring data. @apple_inc_tn3151_2023

=== Configuration

Different transport protocols can be used to establish a connection. Following the single responsibility principle the transport protocols and their configurations are injected into the server and client implementations to create the corresponding connections. The selected transport protocols for which a server and client will be created are listed in a central singleton responsible for creating the server and client objects for each protocol which are injected to the view models. 

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/configuration.swift")),
    ),
    caption: flex-caption(
      [Configuration of transport protocols used while testing.], [Configuration of transport protocols.],
    ),
) <lst:configuration>

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/configuration_injection.swift")),
    ),
    caption: flex-caption(
      [Injection of configured servers to view models.], [Injection of configured servers.],
    ),
) <lst:configuration_injection>

The `TransportProtocol` itself is an enum, where each case is representing a transport protocol used while testing. The enumeration consists of #gls("tcp"), #gls("udp") and #gls("quic") cases and their configurations are accessed through the `parameters` and `type` computed properties. The `type` property delivers the local #gls("mdns") name used to advertise and browse for the service via Bonjour. The `parameter` property delivers the `NWParameters` configurations used in both `NWListener` and `NWBrowser` to configure the network stack for these objects. It is important to set the `includePeerToPeer` property to enable local #gls("awdl") broadcasting. 

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/configuration_transport_protocols.swift")),
    ),
    caption: flex-caption(
      [Configuration of transport protocol parameters that can be used for testing.], [Configuration of transport protocol parameters.],
    ),
) <lst:configuration_transport_protocols>

==== Secure Connection Establishment for #gls("quic")

Since #gls("quic") has built in support for secure connections and requires #gls("tls") v1.3 a secure identity composed of a certificate and a private key has been created and added to the applications bundle. 

After adding it to the bundle #footnote("https://developer.apple.com/documentation/foundation/bundle") the application must read the secure identity and add it to #gls("quic")'s `NWParameters`  `securityProtocolOptions` for client and server.

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/setting_local_identity_server.swift")),
    ),
    caption: flex-caption(
      [Setting the local identity used while #gls("tls") 1.3 handshake on server.], [Setting local identity on server.],
    ),
) <lst:local_identity>

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/setting_verify_block_client.swift")),
    ),
    caption: flex-caption(
      [Setting the verify block used while #gls("tls") 1.3 handshake on client.], [Setting verify block used on client.],
    ),
) <lst:verify_block>

This enables the application to establish a secure QUIC connection. 

=== Connection Establishment

Connection Establishment is done via Bonjour using the Network Framework. The servers register a listener using the `NWListener` class and the `NWParameters` and local #gls("mdns") record from the injected transport protocols to listen for incoming network connections to that service. Once an inbound connection is received the listener object calls the `newConnectionHandler` method previously set when configuring the listener object. When the method is invoked it cancels the previous connection, creates a new one and posts a message to the connection state subject, indicating that a connection has been established. When a listener object is created a service object which represents the Bonjour service to advertise the endpoint on the local network is initialized and passed to the listener. 

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/start_listener.swift")),
    ),
    caption: flex-caption(
      [Initialization and starting of network listener for injected transport protocol.], [Initialization and starting of network listener.],
    ),
) <lst:start_listener>

The clients instantiate a `NWBrowser` object used to browse for available network services. When the browser object finds new Bonjour services it calls the `browseResultsChangedHandler` method. This method is previously configured to write the results to `browserResults` subject which can be observed by the view model. Once the user selects a browser result in the `BrowserView` this instance is passed to the `createConnection` method which cancels the old connections, sets the new one for further use and reports an error in case the connection failed. 

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/start_connection_client.swift")),
    ),
    caption: flex-caption(
      [Initialization of connection on client using a browser result.], [Initialization of connection on client.],
    ),
) <lst:start_connection>

==== Adding local domains to Info.plist <adding_local_domains>

Bonjour services which are browsed for must be listed in the Info.plist using the `NSBonjourServices` key. The format is similar to the ones used to configure the `NWBrowser` and `NWListener` objects, composed of the application and transport protocol like "\_myservice.\_tcp". The Info.plist file is an information property list file that contains information and configuration about the application bundle #footnote("https://developer.apple.com/documentation/bundleresources/information-property-list"). 

In the case of the test application the aforementioned key contains the following entries.

- "\_txtchat.\_udp"
- "\_txtchat.\_tcp"
- "\_txtchatquic.\_udp"

One can notice that two entries using #gls("udp") as the transport protocol exist. This is because the application should advertise and browse for #gls("udp") and the #gls("udp") based #gls("quic") protocol simultaneously. Without using a second service entry Bonjour would automatically rename the service entry which would break the logic for displaying and selecting the browser results. 

==== Displaying and Selecting Advertisers

Local advertisers are displayed based on their human readable service instance name.

#figure(
  image("/figures/bonjour_naming.png", width: 75%),
  caption: [Graphic showing the Bonjour naming convention. @apple_inc_bonjour_2013]
)<fig:bonjour_naming>

In case of this test application the Bonjour service name od the server device is configured using the `UIDevice.current.name` which represents a generic device name like "iPad" or "iPhone" #footnote("https://developer.apple.com/documentation/uikit/uidevice/name"). This name is extracted from the Bonjour `NWEndpoint` on the client side and listed in the Browser View @fig:browser_view so the user can choose the server device he wants to test. 

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/network_browser_name.swift")),
    ),
    caption: flex-caption(
      [Extension for extracting the name of the Bonjour service string.], [Extension for extracting the name of the Bonjour service string.],
    ),
) <lst:network_browser_name>

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/listening_for_browser_result_changes.swift")),
    ),
    caption: flex-caption(
      [How the view model listens to the browser result changes of the client object.], [Listening to browser result changes.],
    ),
) <lst:listening_browser_result_changes>

Using the same service type like mentioned in the previous section @adding_local_domains Bonjour would automatically rename the service if it detects the same service on the local network @apple_inc_bonjour_2013.

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/duplicate_bonjour_names.txt")),
    ),
    caption: flex-caption(
      [Comparison of Bonjour services that tried to use the same name and transport protocol.], [Comparison of Bonjour services.],
    ),
) <lst:duplicate_bonjour_services>

The human readable service instance name is not identical and users could not choose a single testing server for all advertised transport services anymore.

#figure(
  image("/figures/bonjour_same_service_issue.PNG", width: 20%),
  caption: [Screenshot of #gls("udp") and #gls("quic") services using the same Bonjour service type.]
)<fig:bonjour_same_service_issue>

=== Measuring and Networking

Whenever a connection is ready a `DataTransferReport` is started which provides metrics about data being sent and received on a connection like data size in bytes, the number of #gls("ip") packages or #gls("rtt"). 

Besides that the application also measures the testing start and end time and implements an own approach to measure #gls("rtt") since `DataTransferReport` only takes #gls("tcp")'s control packages into account. Before the configured number of packages with the configured number of bytes are sent to measure transfer speed 1000 separate packages to measure #gls("rtt") and jitter are emitted. These packages contain the time the package was emitted and is recognized and sent back from the testing server. When received again on the testing client, the time in the package and the new local current time are compared and the difference is stored to later calculate the average #gls("rtt") and the Jitter. To get precise timing measurements the kernel function `mach_absolute_time` is used which returns current value of a clock that increments monotonically in tick units. This value needs to be converted to nanoseconds using a time base containing information about the duration of a tick.

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/duration_calculation.swift")),
    ),
    caption: flex-caption(
      [How the time span is precisely calculated using kernel functions that return tick count.], [How the time span is precisely calculated.],
    ),
) <lst:duplicate_bonjour_services>

To transfer testing data the `NWConnection` class and its synchronous `send` and `receive` methods are used. These methods are wrapped in an asynchronous `withCheckedContinuation` method to support Swift's `async await` concurrency. This testing application contains a wrapper class for the `NWConnection` which features an asynchronous `startTesting` that utilizes the aforementioned `send` method which is called from the client defining the number of packages to send and its size.

#figure(
    align(
      left,
      fhjcode(code: read("/code-snippets/startTesting_signature.swift")),
    ),
    caption: flex-caption(
      [Signature of the `startTesting` method that is provided by client objects.], [Signature of the startTesting methods.],
    ),
) <lst:startTesting_method>

== Testing 

Testing is done using an iPhone 12 mini and an iPhone 15 Pro both using the current #gls("ios") version 18.4.1. It is tested in various scenarios, which are defined below, using the iPhone 12 mini as sender/client and the iPhone 15 Pro as receiver/server.

=== Places 

Testing is done in four different places representing typical places for iPhone users. One testing environment will be an underground station which is dense in people on a small space. Another environment will be the inner city of vienna which is also dense in people but more open than the underground. The next environment will be a free field with perfect conditions for radio broadcasting since minimal other signals or objects like persons could disturb the signal. The last place that will be tested is the forest since it may have the same density of obstacles as the inner city or the underground but also like the field minimal in #gls("rfemf") disturbances that could negatively impact the connection. @loizeau_comparison_2023

=== Data sizes and distance <size_number>

Data size of the whole testing process is composed of the number of packages that are sent and the size of each package. Both can vary as well as the distance between the connected devices. Testing will be done with the following values each combined with all values of the other categories. 

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    table.header(
    [*Number of Packages*], [*Size of Package in Bytes*], [*Distance in Meters*]
    ),
    [100], [128], [1],
    [1 000], [4 096], [5],
    [10 000], [9 216], [10], 
  ), caption: [Definition of test scenarios.],
) 

=== Protocols and Metrics

Data transfer metrics of three different transport protocols will be tested. #gls("tcp"), #gls("udp") and #gls("quic") will be compared in the average #gls("rtt"), Jitter, data transfer speed. These metrics will be measured in all combinations of the above mentioned scenarios.  

#figure(
  table(
    columns: (auto, auto, auto, auto),
    inset: 10pt,
    [*Protocols*], [#gls("tcp")], [#gls("udp")], [#gls("quic")]
  ), caption: [Transport Protocols used for testing.],
) 

#gls("rtt") and Jitter are measured on the client and tested separately from the transfer speed. The variations listed in @size_number are only relevant for transfer speed since the other two metrics are tested before using 1000 distinct packages including the kernel time. The #gls("rtt") used to evaluate the findings will be the average #gls("rtt") of these 1000 packages that are sent per cycle.

#figure( 
  table(
    columns: (auto, auto), 
    inset: 10pt,
    table.header([*Metrics*], [*Calculation*]),
    [#gls("rtt") (ms)], [$overline(R T T) =  1 / N sum_(i=0)^N R T T_i$],
    [Jitter (ms)], [$J i t t e r = sqrt(1/N sum_(i=0)^N (R T T_i - overline(R T T))^2)$],
    [Data Rate (Mbps)], [$D a t a R a t e = (c o u n t * s i z e) / (d u r a t i o n)$]
  ),
  caption: [Metrics used to evaluate protocols.]
)

== Summary 

Testing is done using a prototype application written in SwiftUI enabling the user to browse and advertise nearby services via Bonjour and connect to them. Once two devices are connected testing can be started for each transport protocol (#gls("tcp"), #gls("udp") and #gls("quic")) and the metrics are displayed to the user ready for recording and saving as #gls("csv"). Testing will be done in four different scenarios each representing a typical place for iPhone users including the underground, the inner city of Vienna, a free field and the forest. Moreover different numbers of packages and package sizes will be sent in varying distances between the devices. For every combination of package size, number of packages, distance and transport protocol two distinct rounds will be done resulting in 162 individual tests per scenario. Before these tests to measure data transfer speed are executed #gls("rtt") and Jitter are tested 5 times with 1000 packages for each distance and transport protocol resulting in 45 individual tests per scenario.

#figure( 
  table(
    columns: (auto, auto, auto, auto, auto, auto), 
    inset: 10pt,
    table.header([*Metrics*], [*Scenarios*], [*Protocols*], [*Distances in Meters*], [*Number of Packages*], [*Package size in Bytes*]),
    [#gls("rtt")], [Underground], [#gls("tcp")], [1], [100], [128], 
    [Jitter], [Inner City],  [#gls("udp")], [5], [1 000], [4 096], 
    [Data Rate], [Free Field], [#gls("quic")], [10], [10 000], [9 216],
    [], [Forest], [], [], [], []
  ),
  caption: [Definition of testing scenarios and variations.]
)

After getting more precise on how testing will be done the aforementioned @fig:implementation_obfuscated can be filled out as follows adding the specific testing environments, measured data and protocol stack.

#figure(
  box(stroke: gray, inset: 1em,
    image("/figures/implementation.jpg", width: 75%)
  ),
  caption: flex-caption([Abstract representation of testing concept including implementation details and protocol stack.], [Abstract representation of testing concept including details.])
)<fig:implementation>

After collecting the described data like shown above they will be visualized and used to test the hypotheses in the following @evaluation.

//The QUIC protocol has significant advantages over #gls("tcp"). If you’re building a custom network protocol, consider using QUIC instead of #gls("tcp"). https://developer.apple.com/documentation/technotes/tn3151-choosing-the-right-networking-api

// === 
// general: QUIC, #gls("tcp"), #gls("udp")...
// The following builds upon the concepts described in the previous chapter but will describe further details and show code examples. The presentation of the inner workings of the application will be structured in the layers descirbed in the previous chapter, whereas the User Interface and the logic layers are outlined together to improve understanding of the connections of graphical layouts and corresponding logic. The measurement and networking layers are mentioned under the headings of the seperate screens where it is applicable. The Start screen for example, does not contain code for neither networking nor measurement. 
// 
// === Protocol 

// ==== Scenarios 

// what different combinations will be tested, 
// 100/1000/10_000/100_000 packages 
// 128/4096/16_384 byte per package
// 1m/10m/30m/maxm

// do every case 5 times, max meters are not done in every scenario, just how far it can go...

// ==== metrics

// which metrics will be measured 

// === Sceneries 
// which are representable for real life scenarios...
// underground 
// forrest 
// city
// field

// What do I want to achieve? 
// Test one time with bluetooth off and one time with bluetooth on since iPhones use the same antenna for both, which has already caused slow #gls("wifi") connections when peer to peer was enabled...
// Bluetooth doesnt turn off completely
// I want to test different scenarios, so I know which transport protocol performs best under certain circumstances and environments. I want to test different payload sizes, package count from perspective of !application level!. The metrics should be captured depending on distance and other environmental factors like obstacles. 

// capture:
// distance
// obstacles 
// outside temperature

// different scenarious: 
// underground 
// forrest 
// city
// field

// do these different scenarios with: 
// 100/1000/10_000/100_000 packages 
// 128/4096/16_384 byte per package
// 1m/10m/30m/maxm

// do every case 5 times, max meters are not done in every scenario, just how far it can go...

// also include seperately a comparison between #gls("tcp") options, noDelay and noPush

// done -> inPr -> notStarted
// code -> test -> write thesis 

// #([
//   == Backend <backend>

//   #lorem(35)#v(1.3cm)

//     *Hints for code listings in Typst*:

//   The way to include source code in your document is
//   discussed and shown in #link("https://typst.app/docs/reference/text/raw/").
//   For this template we provide a custom macro/function _fhjcode_ to support listings with
//   code pulled in from external files and with line numbering. For example:

//   *For example:* We implemented a minimal #emph[script] in Python to manage a secure `Message`s
//   in object oriented ways. See @lst:Message and @lst:SecureMessage for a minimal `SecureMessage` class.
//   ])

//   #figure(
//     align(
//       left,
//       // we use a custom template (style), defined in fh.typ
//       // the files are expected in subfolder "source"
//       // optionally, specify firstline/lastline
//       fhjcode(code: read("/code-snippets/msg.py"), lastline: 5),
//     ),
//     // we use a custom flex-caption), to allow long and short captions
//     // (the short one appears in the outline List of Figures).
//     // This is defined in `lib.typ`.
//     caption: flex-caption(
//       [Defining a base class in Python. Here, the base class is named _Message_.], [Base class _Message_.],
//     ),
//   ) <lst:Message>

//   #figure(
//     align(
//       left, fhjcode(code: read("/code-snippets/msg.py"), firstline: 7, lastline: 17),
//     ), caption: flex-caption(
//       [For inheritance we might define a specialised class based on another class.
//         Here, the specialised class _SecureMessage_ is based on the class _Message_.],
//       [Specialised class _SecureMessage_.],
//     ),
//   ) <lst:SecureMessage>

// #([
//   *For example:* As shown in @lst:SecureMessage the secure version of the class is just a
//   stub where further improvements and extensions have to be applied.
// ])

// #([

//   == Frontend <frontend>

//   #lorem(35)#v(1.3cm)

//   *Hints for abbreviations and glossary entries _gls(key)_ in Typst*:

//   Abbreviations should be written in full length on the first occurrence. Later
//   the short version can be used. Therefore, define glossary entries with a _key_ and
//   a _short_ as well as a _long_ description first (see file _glossary.typ_). In
//   the text you might use `#gls(<key>)` (and `#glspl(<key>)` for plural) usage of
//   an abbreviation. For example:

//   The system is using #gls("cow") for optimisation. The implementation of #gls("cow") can
//   be changed by ... Note the usage of the special configured #gls("gc"). We
//   compared many #glspl("gc") to find out .. ],
// )

// Great idea — splitting the experimental setup into **Concept** and **Implementation** makes your methodology clearer and more professional. Here’s how you can structure each:

// ---

// ## **4. Experimental Setup**

// ### **4.1 Concept**
// This section should explain the *what* and *why* of your experiment — your rationale and high-level design, without diving into exact tools or code yet.

// You could include:

// - **Objective of the Experiments**
//   - What are you trying to measure, observe, or prove? (e.g., how #gls("awdl") handles peer discovery, connection setup time, data throughput, etc.)
  
// - **Experimental Design**
//   - Types of scenarios you're testing (e.g., proximity, number of devices, interference).
//   - Whether you're testing static or dynamic conditions (e.g., walking with iPhones, varying network conditions).
  
// - **Role of Each Device**
//   - e.g., One iPhone as sender, one as receiver.
//   - MacBook with Wi-Fi adapter as sniffer.
  
// - **Assumptions and Constraints**
//   - No access to private APIs.
//   - Relying on reverse engineering and publicly observable behavior.
//   - Limited visibility into Apple’s internal workings of #gls("awdl").

// - **Metrics of Interest**
//   - Packet timing, latency, signal strength, peer discovery time, channel switching patterns.

// ---

// ### **4.2 Implementation**
// This section should go into the *how* — the actual setup, tools used, device configuration, and procedures followed.

// You could cover:

// - **Hardware**
//   - List of devices used (iPhone models, MacBooks, Wi-Fi dongles like Atheros-based cards).
//   - Placement and orientation if it’s relevant to signal behavior.

// - **Software and Tools**
//   - Wireshark with #gls("awdl") dissector.
//   - CoreCapture framework on macOS (for system-level logs).
//   - #gls("ios") tools (e.g., using Xcode instruments or jailbroken device tools like `#gls("tcp")dump` or `Frida`).
//   - Scripts or software for automating tests (e.g., file transfer over AirDrop).
  
// - **Configuration**
//   - How Wi-Fi interfaces were configured.
//   - How you ensured #gls("awdl") was active (AirDrop toggle, etc.).
//   - Log collection setup, file sizes transferred, test duration.

// - **Data Collection Process**
//   - Step-by-step on how you recorded each test.
//   - Any calibration or pre-test you did.
//   - Number of repetitions for statistical validity.

// - **Challenges Faced**
//   - Difficulty in consistent packet capturing.
//   - #gls("awdl")’s channel hopping causing capture issues.
//   - Limited visibility into handshake mechanisms.

// ---

// So it ends up looking like:

// ### **4. Experimental Setup**
// - **4.1 Concept** — What you planned to test and why.
// - **4.2 Implementation** — How you executed the plan, with tools, devices, and configuration.

// ---

// Would you like a sample write-up for one of those sections next?


// === Measurement

// what is measured, what is 

// kernel time what is measured, 
// mach_absolute_time

// === Measurement and Networking

// Before diving into the seperate screens and their underlying workings, this section will introduce to the frameworks used and the abstract design these layers tend to. 

// Browser Advertiser and Connection classes, as well as interfaces...

// === User Interface and Logic

// The user interface is implemented in SwiftUI, a descriptive framework used to build applications for the apple ecosystem. The application renounces optimizing the User interface and puts focus on reliability and flexibility, therefore consisting of only 3 screens and one sheet. 

// ==== Navigation Overview 

// This graphic represents how the user can navigate the application to reach different screens.

// ==== Start Screen 

// The start screen consists of two buttons that let the user choose if the underlying device should start the testing process as a client or a server, in particular browsing or advertising services respectively. Choosing to use the device as a server leads the user to the Testing Screen, choosing the client leads the user to the browsing screen.

// === Testing Screen

// The testing screen consists of a list which displays test results grouped into the underlying transport protocol and two buttons in the top bar which differ depending on the type chosen in the start screen. 

// ===== Client 

// The top bar of the client device features a reload button on the left side next to the back button and a settings button on the right side indicated by a gear icon. The reload button destructs all ongoing connections with a server and starts browsing again for nearby peers, which directs the user back to the browsing screen. 

// ====== Measurement and Networking 


// ===== Server

// The top bar of the server device features a reload button on the left side next to the back button, just like the client view and a get test results button on the right side. The reload button destructs all ongoing connections with a client and opens new ports to advertise the services. The get test results button actively calls the underlying layers to get the test results measured on the server side. This feature is needed because automatic solutions to indicate the end of testing would require more computational power when receiving data which could lead to delays that corrupt measurements. 

// ====== Measurement and Networking

// ==== Browsing Screen

// The browsing screen is only presented for client devices that want to connect to a nearby advertiser. 

// ===== Networking

// ==== Parameter Sheet

// The parameter sheet is only present on the testing client and lets the user change size parameters of the testing payload. The sheet consists fo two textfield. The first textfield represents the number of packages that will be sent during one duration of measurement, whereas the second textfield represents the number of bytes bundled in each package. 

// ===== Networking

// QUic advertised via Bonjour, not working? 

// use mach_absolute_time to measure the jitter, done 

// #figure(
//   align(
//     left,
//     // we use a custom template (style), defined in fh.typ
//     // the files are expected in subfolder "source"
//     // optionally, specify firstline/lastline
//     fhjcode(code: read("/code-snippets/save-task-reference.swift"), lastline: 7),
//   ),
//   // we use a custom flex-caption), to allow long and short captions
//   // (the short one appears in the outline List of Figures).
//   // This is defined in `lib.typ`.
//   caption: flex-caption(
//     [Saving the reference to the detached task, so it can be canceled when the viewmodel is dereferenced.], [Stored reference of detached task.],
//   ),
// ) <lst:StoredTaskReference>


// https://developer.apple.com/documentation/swift/calling-functions-with-pointer-parameters
// how to pass pointers to functions 


// #(
//   [ Describe what is relevant and special about your working prototype. State how
//   single features help to solve problem(s) at hand. You might implement only the
//   most relevant features. Features you select from your prioritised feature list
//   assembled in Chapter 4. Focus novel, difficult, or innovative aspects of your
//   prototype. Add visuals such as architectures, diagrams, flows, tables,
//   screenshots to illustrate your work. Select interesting code snippets, e.g. of
//   somewhat complicated algorithms, to present them as source code listings.

//   #v(1.4cm)
//   *For example*, you might explain your overall system, then the details of
//   the backend and frontend development in subsections as shown here:

//   == Overall System <architecture>

//   #lorem(35)#v(0.5cm)

//   *Hints for images in Typst*

//   Use vector graphic formats such as #gls("svg") for drawings and png for screenshots.
//   Using jpeg is only ok, if you need to show photographic images, such as a picture of a sunset.

//   For example, the following shows how an #gls("svg") image is references using the `image` Typst macro.
//   The image is furthermore embedded in a `figure` macro. The `flex-caption` allows to
//   include a full sentence as caption below the image and a short caption for the list of figures.
//   Also note the use of a label `<fig:companylogo>` which is later referenced with `@fig:companylogo`:

// ])


// #figure(
//     box(stroke: gray, inset: 1em,
//       image("/figures/logo.svg", width: 25%)
//     ),
//     caption: flex-caption(
//         [The logo of the FH JOANNEUM, the University of Applied Sciences.],
//         [Company icon provides _Home_ navigation]
//     )
//   )<fig:companylogo>

// #([
//   The application uses the logo of the company, see @fig:companylogo, in
//   the navigation bar to provide _home_ functionality.
// ])
