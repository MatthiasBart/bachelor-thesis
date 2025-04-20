#import "global.typ": *

//MARK: The QUIC protocol has significant advantages over TCP. If you’re building a custom network protocol, consider using QUIC instead of TCP. https://developer.apple.com/documentation/technotes/tn3151-choosing-the-right-networking-api
= Implementation <implementation>

#figure(
  box(stroke: gray, inset: 1em,
    image("/figures/implementation_obfuscated.jpg", width: 75%)
  ),
  caption: [Abstract representation of scientific concept]
)<fig:implementation_obfuscated>

== Prototype 

The application is written in `Swift` using the integrated development environment (IDE) `XCode`, which is the suggested way to build iOS application by Apple. The built artifact is distributed via TestFlight, an online service for installing and testing apps for Apple devices and can be downloaded via an URL or directly installed by the developer machine. The application is written using a modified version of the MVVM GUI design pattern. The application must feature a mechanism to find local peers, connect them and intercept data transfer to measure metrics. The technologies used to achieve these features are described in the following sections. 
// general: QUIC, TCP, UDP...
// The following builds upon the concepts described in the previous chapter but will describe further details and show code examples. The presentation of the inner workings of the application will be structured in the layers descirbed in the previous chapter, whereas the User Interface and the logic layers are outlined together to improve understanding of the connections of graphical layouts and corresponding logic. The measurement and networking layers are mentioned under the headings of the seperate screens where it is applicable. The Start screen for example, does not contain code for neither networking nor measurement. 

=== User Interface
//MARK: https://developer.apple.com/xcode/swiftui/
The User Interface (UI) is developed using SwiftUI, a declarative way to build applications across all Apple platforms. Considering the aforementioned features the application is split into five different screens each one serving a specific purpose in the process of establishing the connection and transferring data. The screens are listed below in the order the user would walk through during a testing procedure and are called views to match terminology of the MVVM pattern. 

==== Decision View

This view is the first a tester sees when opening the application and is responsible for configuring the next steps of testing. Depending on the decision the tester makes the application is initialized as a client that browses for nearby services or as a server that advertises a service to nearby clients. 

#figure(
  image("/figures/decision.PNG", width: 20%),
  caption: [Screenshot of decision screen.]
)<fig:decision_view>

==== Server View

The server views purpose is to present the user the state of each connection and the test results which were measured on the server. For this, the user has to tap the `Get Test Results` button in the right corner of the top tool bar. On the server view, the user can also tap the `Reload` button which aborts all ongoing connections, destructs the server objects and creates new ones which immediately start advertising again. 

#figure(
  image("/figures/server.PNG", width: 20%),
  caption: [Screenshot of server screen.]
)<fig:server_view>

==== Client Views

The client view is split into to seperate steps since the client needs to find nearby peers and connect to them. Only after a successful connection was established the testing can begin.

===== Browser View

The browser view lists all nearby servers found. Through a tap on an item the client tries to connect to the advertiser and navigates to the testing view.

#figure(
  image("/figures/browser.PNG", width: 20%),
  caption: [Screenshot of browser screen.]
)<fig:browser_view>

===== Testing View

The testing views purpose is to present the user the state of each connection and the test results which were measured on the client. Furthermore the buttons `Start Test` initiate the sending of the test data for the associated connection. The testing view, as well as the server view features a `Reload` button that aborts all ongoing connections, destructs and reintializes all client objects and navigates the user back to the browser view. There the user can select another server to connect to.

#figure(
  image("/figures/testing.PNG", width: 20%),
  caption: [Screenshot of testing screen.]
)<fig:testing_view>

=== Networking Frameworks 

Apple provides different frameworks for P2P connections using different layers of abstraction or different underlying technolgies. One of these frameworks is called Multipeer Connectivity. Newport describes it as an implementation of the mobile telephone model #cite(<Newport_2017>, form: "year") in his article about gossip in smartphone P2P networks. Apple states, the framework "supports the discovery of services provided by nearby devices and supports communicating with those services through message-based data, streaming data, and resources (such as files). In iOS, the framework uses infrastructure Wi-Fi networks, peer-to-peer Wi-Fi, and Bluetooth personal area networks for the underlying transport. In macOS and tvOS, it uses infrastructure Wi-Fi, peer-to-peer Wi-Fi, and Ethernet." Contrary to this excerpt of the documentation, tests and information gathered from Apple's developer forum conclude that Mulipeer Connectivty does not support Bluetooth for P2P networking anymore and got disabled with the release of iOS 11. 

In an approach to give a brief overview about Apples networking APIs, Apple describes Multipeer Connectivity as a high-level interface to Apples P2P WiFi support and also introduces the Network Framework, which is considered a low-level interface by Apple engineers. Apples Documentation states developers should use this framework when they need direct access to protocols like TLS, TCP, and UDP for their custom application protocols. The Network framework features opt-in support for P2P connection establishment via AWDL and also does not support connecting via Bluetooth, which is accessible through the Core Bluetooth Framework. 

//MARK: https://developer.apple.com/documentation/nearbyinteraction
//MARL: https://developer.apple.com/videos/play/wwdc2021/10165/?time=1249 distances in video 1.5m -3m 
// MARK: https://developer.apple.com/documentation/technotes/tn3151-choosing-the-right-networking-api#Peer-to-peer-alternatives peer to peer 
Nearby Interaction is yet another framework to establish P2P connections. It uses the iPhones ultra wideband (UWB) chip to "locate and interact with nearby devices using identifiers, distance, and direction." These chips are usually used in smaller distances to precisely locate compatible hardware, so in examples from Apples world wide developer conference (WWDC) distances of one and a half to three meters are shown which does not meet the requirements for this experiments.

Following Apples recommendations documented in a technote about choosing the right networking API, the Networking framework is used for establishing a connection and transferring data. 

=== Configuration

Different transport protocols can be used to establish a connection. Following the single responsibility principle the transport protocols and their configurations are injected into the server and client implementations to create the corresponding connections. The transport protocols for which a server and client will be created are listed in a central singleton responsible for creating the server and client objects for each protocol which are injected to the view models. 

```swift
struct Config {
    static let serviceProtocols: [TransportProtocol] = [.udp, .tcp, .quic]
    
    static var clients: [any Client] {
        serviceProtocols.map { ClientImpl<ConnectionImpl>(transportProtocol: $0) }
    }
    
    static var servers: [any Server] {
       serviceProtocols.compactMap { try? ServerImpl<ConnectionImpl>(transportProtocol: $0) }
    }
}
```

```swift
...
    init(state: State = .init(), servers: [any Server] = Config.servers) {
        self.state = state
        self.servers = servers
    }
...
```

The `TransportProtocol` itself is an enum, where each case is representing a transport protocol used while testing. The enumeration consists of TCP, UDP and QUIC cases and their configurations are accessed through the `parameters` and `type` computed properties. The `type` property delivers the local mDNS name used to advertise and browse for the service via Bonjour. The `parameter` property delivers the `NWParameters` configurations used both in `NWListener` and `NWBrowser` to configure the network stack for these objects. 

```swift 
   var parameters: NWParameters {
        switch self {
        case .udp:
            let udpOptions = NWProtocolUDP.Options()
            let parameters = NWParameters(dtls: nil, udp: udpOptions)
            parameters.includePeerToPeer = true
            return parameters
            
        case .tcp:
            let tcpOptions = NWProtocolTCP.Options()
            tcpOptions.enableKeepalive = true
            tcpOptions.keepaliveIdle = 2
            
            let parameters = NWParameters(tls: nil, tcp: tcpOptions)
            parameters.includePeerToPeer = true
            return parameters
            
        case .quic:
                    ...
        }
    }
    
    var type: String {
        switch self {
        case .udp:
            "_txtchat._udp"
        case .tcp:
            "_txtchat._tcp"
        case .quic:
            "_txtchatquic._udp"
        }
    }
```
==== Secure Connection Establishment for QUIC

describe what needed to be done for quic 

=== Connection Establishment

Connection Establishment is done via Bonjour using the Network Framework. The servers register a listener using the `NWListener` class and the `NWParameters` and local mDNS record from the injected transport protocols to listen for incoming network connections to that service. Once an inbound connection is received the listener object calls the `newConnectionHandler` method previously set when configuring the listener object. When the method is invoked it cancels the previous connection, creates a new one and posts a message to the connection state subject, indicating that a connection has been established. When a listener is created a service object which represents the Bonjour service to advertise the endpoint on the local network is initialized and passed to the listener. 

```swift 
    init(transportProtocol: TransportProtocol) throws {
        self.transportProtocol = transportProtocol
        
        listener = try NWListener(
            service: .init(
                name: UIDevice.current.name,
                type: transportProtocol.type,
                domain: nil
            ),
            using: transportProtocol.parameters
        )
    }
    
    func startAdvertising() {
        listener.newConnectionHandler = { [weak self] connection in
            self?.connection?.cancel()
            self?.connection = nil
            self?.connection = C(connection)
            self?.connectionStatus.value = "Connection established"
        }
        
        listener.stateUpdateHandler = { [weak self] state in
            self?.connectionStatus.value = "\(state)"
        }
        
        listener.start(queue: .global())
    }
```

The clients instantiate a `NWBrowser` object used to browse for available network services. When the browser object finds new Bonjour services it calls the `browseResultsChangedHandler` method. This method is previously configured to write the results to `browserResults` subject which can be observed by the view model. Once the user selects a browse result in the `BrowserView` this instanz is passed to the `createConnection` method which cancels the old connections, sets the new one for further use and reports an error in case the connection failed. 

```swift
    func createConnection(with browserResult: NWBrowser.Result) -> Error? {
        let nwConnection = NWConnection(to: browserResult.endpoint, using: transportProtocol.parameters)
        
        self.connection?.cancel()
        self.connection = nil
        self.connection = C(nwConnection)
        
        if case let .failed(error) = self.connection?.state {
            return error
        }
        return nil
    }
```
==== Injecting a concrete Implementation of a Protocol 

injecting ConnectionImpl to Client and serverimpl so i can create a new object inside
Bonjour, adding services to info.plist, adding two upd services for quic also

==== Adding local domains to Info.plist 

Bonjour services which are browsed for must be listed in the Info.plist using the `NSBonjourServices` key. The format is similar to the ones used to configure the `NWBrowser` and `NWListener` objects, composed of the application and transport protocol like "\_myservice.\_tcp". The Info.plist file is an information property list file that contains information and configuration about the application bundle. //https://developer.apple.com/documentation/bundleresources/information-property-list

In the case of the test application the aforementioned key contains the following entries.

- "\_txtchat.\_udp"
- "\_txtchat.\_tcp"
- "\_txtchatquic.\_udp"

One can notice that two entries using UDP as the transport protocol exist. This is because the application should advertise and browse for UDP and the UDP based QUIC protocol simultaniously. Without using a second service entry Bonjour would automatically rename the service entry which would break the logic for displaying and selecting the browser results. 

==== Displaying and Selecting Advertisers

Local advertisers are displayed based on their human readable service instance name.

#figure(
  image("/figures/bonjour_naming.png", width: 75%),
  caption: [Graphic showing the Bonjour naming convention.]
)<fig:bonjour_naming>

//https://developer.apple.com/documentation/uikit/uidevice/1620015-name
In case of this test application the Bonjour service name is configured using the `UIDevice.current.name` which represents a generic device name like "iPad" or "iPhone" which can be seen in Listing NWListener. This name is extracted from the bonjour `NWEndpoint` on the client side and listed in the Browser View @fig:browser_view. 

```swift
extension NWBrowser.Result {
    var name: String? {
        if case let NWEndpoint.service(name: name, type: _, domain: _, interface: _) = self.endpoint {
            return name
        }
        return nil
    }
}
```

```swift
                Task { @MainActor in
                    for await browseResults in client.browserResults.values {
                        state.advertiserNames.append(contentsOf: browseResults.compactMap { $0.name })
                        state.advertiserNames = state.advertiserNames.removingDuplicates()
                    }
                }
```
//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/NetServices/Articles/about.html#//apple_ref/doc/uid/TP40002458-TPXREF108
Using the same service type like mentioned in the previous Section, Bonjour would automatically rename the service. 
```
iPad\\032(2)._txtchat._udp.local.
iPad._txtchat._udp.local.
```
The human readable service instance name is not identical and users could not choose a single testing server for all advertised transport services anymore.

#figure(
  image("/figures/bonjour_same_service_issue.PNG", width: 20%),
  caption: [Screenshot of UDP and QUIC services using the same Bonjour service type.]
)<fig:bonjour_same_service_issue>

=== Measurement

kernel time what is measured, 
mach_absolute_time

=== Measurement and Networking

Before diving into the seperate screens and their underlying workings, this section will introduce to the frameworks used and the abstract design these layers tend to. 

Browser Advertiser and Connection classes, as well as interfaces...

=== User Interface and Logic

The user interface is implemented in SwiftUI, a descriptive framework used to build applications for the apple ecosystem. The application renounces optimizing the User interface and puts focus on reliability and flexibility, therefore consisting of only 3 screens and one sheet. 

==== Navigation Overview 

This graphic represents how the user can navigate the application to reach different screens.

==== Start Screen 

The start screen consists of two buttons that let the user choose if the underlying device should start the testing process as a client or a server, in particular browsing or advertising services respectively. Choosing to use the device as a server leads the user to the Testing Screen, choosing the client leads the user to the browsing screen.

=== Testing Screen

The testing screen consists of a list which displays test results grouped into the underlying transport protocol and two buttons in the top bar which differ depending on the type chosen in the start screen. 

===== Client 

The top bar of the client device features a reload button on the left side next to the back button and a settings button on the right side indicated by a gear icon. The reload button destructs all ongoing connections with a server and starts browsing again for nearby peers, which directs the user back to the browsing screen. 

====== Measurement and Networking 


===== Server

The top bar of the server device features a reload button on the left side next to the back button, just like the client view and a get test results button on the right side. The reload button destructs all ongoing connections with a client and opens new ports to advertise the services. The get test results button actively calls the underlying layers to get the test results measured on the server side. This feature is needed because automatic solutions to indicate the end of testing would require more computational power when receiving data which could lead to delays that corrupt measurements. 

====== Measurement and Networking

==== Browsing Screen

The browsing screen is only presented for client devices that want to connect to a nearby advertiser. 

===== Networking

==== Parameter Sheet

The parameter sheet is only present on the testing client and lets the user change size parameters of the testing payload. The sheet consists fo two textfield. The first textfield represents the number of packages that will be sent during one duration of measurement, whereas the second textfield represents the number of bytes bundled in each package. 

===== Networking



QUic advertised via Bonjour, not working? 

use mach_absolute_time to measure the jitter, done 

#figure(
  align(
    left,
    // we use a custom template (style), defined in fh.typ
    // the files are expected in subfolder "source"
    // optionally, specify firstline/lastline
    fhjcode(code: read("/code-snippets/save-task-reference.swift"), lastline: 7),
  ),
  // we use a custom flex-caption), to allow long and short captions
  // (the short one appears in the outline List of Figures).
  // This is defined in `lib.typ`.
  caption: flex-caption(
    [Saving the reference to the detached task, so it can be canceled when the viewmodel is dereferenced.], [Stored reference of detached task.],
  ),
) <lst:StoredTaskReference>


https://developer.apple.com/documentation/swift/calling-functions-with-pointer-parameters
how to pass pointers to functions 


#todo(
  [ Describe what is relevant and special about your working prototype. State how
  single features help to solve problem(s) at hand. You might implement only the
  most relevant features. Features you select from your prioritised feature list
  assembled in Chapter 4. Focus novel, difficult, or innovative aspects of your
  prototype. Add visuals such as architectures, diagrams, flows, tables,
  screenshots to illustrate your work. Select interesting code snippets, e.g. of
  somewhat complicated algorithms, to present them as source code listings.

  #v(1.4cm)
  *For example*, you might explain your overall system, then the details of
  the backend and frontend development in subsections as shown here:

  == Overall System <architecture>

  #lorem(35)#v(0.5cm)

  *Hints for images in Typst*

  Use vector graphic formats such as #gls("svg") for drawings and png for screenshots.
  Using jpeg is only ok, if you need to show photographic images, such as a picture of a sunset.

  For example, the following shows how an #gls("svg") image is references using the `image` Typst macro.
  The image is furthermore embedded in a `figure` macro. The `flex-caption` allows to
  include a full sentence as caption below the image and a short caption for the list of figures.
  Also note the use of a label `<fig:companylogo>` which is later referenced with `@fig:companylogo`:

])


#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/logo.svg", width: 25%)
    ),
    caption: flex-caption(
        [The logo of the FH JOANNEUM, the University of Applied Sciences.],
        [Company icon provides _Home_ navigation]
    )
  )<fig:companylogo>

#todo([
  The application uses the logo of the company, see @fig:companylogo, in
  the navigation bar to provide _home_ functionality.
])

== Testing 

As already 
After understanding how the prototype works and how the metrics are measured under 
important: make pictures of the scenery

=== Protocol 

==== Scenarios 

what different combinations will be tested, 
100/1000/10_000/100_000 packages 
128/4096/16_384 byte per package
1m/10m/30m/maxm

do every case 5 times, max meters are not done in every scenario, just how far it can go...

==== metrics

which metrics will be measured 

=== Sceneries 
which are representable for real life scenarios...
underground 
forrest 
city
field

What do I want to achieve? 
Test one time with bluetooth off and one time with bluetooth on since iPhones use the same antenna for both, which has already caused slow wifi connections when peer to peer was enabled...
Bluetooth doesnt turn off completely
I want to test different scenarios, so I know which transport protocol performs best under certain circumstances and environments. I want to test different payload sizes, package count from perspective of !application level!. The metrics should be captured depending on distance and other environmental factors like obstacles. 

capture:
distance
obstacles 
outside temperature

different scenarious: 
underground 
forrest 
city
field

do these different scenarios with: 
100/1000/10_000/100_000 packages 
128/4096/16_384 byte per package
1m/10m/30m/maxm

do every case 5 times, max meters are not done in every scenario, just how far it can go...

also include seperately a comparison between tcp options, noDelay and noPush

done -> inPr -> notStarted
code -> test -> write thesis 

#todo([
  == Backend <backend>

  #lorem(35)#v(1.3cm)

    *Hints for code listings in Typst*:

  The way to include source code in your document is
  discussed and shown in #link("https://typst.app/docs/reference/text/raw/").
  For this template we provide a custom macro/function _fhjcode_ to support listings with
  code pulled in from external files and with line numbering. For example:

  *For example:* We implemented a minimal #emph[script] in Python to manage a secure `Message`s
  in object oriented ways. See @lst:Message and @lst:SecureMessage for a minimal `SecureMessage` class.
  ])

  #figure(
    align(
      left,
      // we use a custom template (style), defined in fh.typ
      // the files are expected in subfolder "source"
      // optionally, specify firstline/lastline
      fhjcode(code: read("/code-snippets/msg.py"), lastline: 5),
    ),
    // we use a custom flex-caption), to allow long and short captions
    // (the short one appears in the outline List of Figures).
    // This is defined in `lib.typ`.
    caption: flex-caption(
      [Defining a base class in Python. Here, the base class is named _Message_.], [Base class _Message_.],
    ),
  ) <lst:Message>


  #figure(
    align(
      left, fhjcode(code: read("/code-snippets/msg.py"), firstline: 7, lastline: 17),
    ), caption: flex-caption(
      [For inheritance we might define a specialised class based on another class.
        Here, the specialised class _SecureMessage_ is based on the class _Message_.],
      [Specialised class _SecureMessage_.],
    ),
  ) <lst:SecureMessage>

#todo([
  *For example:* As shown in @lst:SecureMessage the secure version of the class is just a
  stub where further improvements and extensions have to be applied.
])


#todo([

  == Frontend <frontend>

  #lorem(35)#v(1.3cm)


  *Hints for abbreviations and glossary entries _gls(key)_ in Typst*:

  Abbreviations should be written in full length on the first occurrence. Later
  the short version can be used. Therefore, define glossary entries with a _key_ and
  a _short_ as well as a _long_ description first (see file _glossary.typ_). In
  the text you might use `#gls(<key>)` (and `#glspl(<key>)` for plural) usage of
  an abbreviation. For example:

  The system is using #gls("cow") for optimisation. The implementation of #gls("cow") can
  be changed by ... Note the usage of the special configured #gls("gc"). We
  compared many #glspl("gc") to find out .. ],
)

== Summary 

maybe also include detailed UML diagram of application. 

#figure(
  box(stroke: gray, inset: 1em,
    image("/figures/implementation.jpg", width: 75%)
  ),
  caption: [Abstract representation of scientific concept]
)<fig:implementation>

// Great idea — splitting the experimental setup into **Concept** and **Implementation** makes your methodology clearer and more professional. Here’s how you can structure each:

// ---

// ## **4. Experimental Setup**

// ### **4.1 Concept**
// This section should explain the *what* and *why* of your experiment — your rationale and high-level design, without diving into exact tools or code yet.

// You could include:

// - **Objective of the Experiments**
//   - What are you trying to measure, observe, or prove? (e.g., how AWDL handles peer discovery, connection setup time, data throughput, etc.)
  
// - **Experimental Design**
//   - Types of scenarios you're testing (e.g., proximity, number of devices, interference).
//   - Whether you're testing static or dynamic conditions (e.g., walking with iPhones, varying network conditions).
  
// - **Role of Each Device**
//   - e.g., One iPhone as sender, one as receiver.
//   - MacBook with Wi-Fi adapter as sniffer.
  
// - **Assumptions and Constraints**
//   - No access to private APIs.
//   - Relying on reverse engineering and publicly observable behavior.
//   - Limited visibility into Apple’s internal workings of AWDL.

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
//   - Wireshark with AWDL dissector.
//   - CoreCapture framework on macOS (for system-level logs).
//   - iOS tools (e.g., using Xcode instruments or jailbroken device tools like `tcpdump` or `Frida`).
//   - Scripts or software for automating tests (e.g., file transfer over AirDrop).
  
// - **Configuration**
//   - How Wi-Fi interfaces were configured.
//   - How you ensured AWDL was active (AirDrop toggle, etc.).
//   - Log collection setup, file sizes transferred, test duration.

// - **Data Collection Process**
//   - Step-by-step on how you recorded each test.
//   - Any calibration or pre-test you did.
//   - Number of repetitions for statistical validity.

// - **Challenges Faced**
//   - Difficulty in consistent packet capturing.
//   - AWDL’s channel hopping causing capture issues.
//   - Limited visibility into handshake mechanisms.

// ---

// So it ends up looking like:

// ### **4. Experimental Setup**
// - **4.1 Concept** — What you planned to test and why.
// - **4.2 Implementation** — How you executed the plan, with tools, devices, and configuration.

// ---

// Would you like a sample write-up for one of those sections next?