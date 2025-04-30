#import "global.typ": *

= Concept 

The following introduces the abstract design of how direct #gls("ptp") communication between iOS devices is tested and measured for evaluation in this thesis. The measurement setup should try to systematically quantify how the performance of #gls("ptp") iOS connection is and how it changes under different surroundings. Different approaches to solve this problem do exist, which are briefly evaluated and compared among each other. 

== Approaches

=== Continuity Black Box Testing

Using Apple's Continuity features to send and receive data on different iOS devices could be tested and analysed. In the simplest form this would involve selecting a particular file with a particular size and measuring the time it takes to transport this file from one device to another. The data transfer speed could be approximated using the file size and the time it took to transfer the file. Another approach to this black box testing could involve using a network sniffer to monitor connection establishment like local #gls("mdns") and security handshakes including recording and analysing the transmission process like congestion control and packet loss recovery. This could further be applied on different abstraction layers like measuring the physical radio frequency energy used or how many IP packages needed to be sent. 

=== iOS Application

iOS provides several #gls("api") that allow a third party developer to access various underlying technologies to establish #gls("ptp") connections. The software could directly record how much data is sent and received mitigating overhead of measurement logic. Using the frameworks provided by Apple is also an interface available to any third party developer and can therefore be implemented in any iOS application without the need to bypass any restrictions.

=== Jailbreaking 

Jailbreaking is a term used to describe the bypassing of the security mechanism in iOS. This allows the user to install arbitrary third party software and gain full access to the operating system. This would allow to also access interfaces like the cellular antenna that is restricted and not accessible to a third party developer or turning off services that would interfere with testing @ao_kaspersky_lab_jailbreaking_nodate. This however violates Apple's iOS Software License Agreement and testing could potentially disturb restricted frequency bands that are licensed @apple_inc_unauthorized_nodate. Additionally considering the current use cases of iOS devices and restrictions of the operating system it seems unlikely that developers other than Apple could have similar interfaces in near future.

== Experiment Design

After evaluating the aforementioned concepts the decision was taken to build an iOS Application establishing and intercepting the #gls("ptp") connection to measure connection metrics. It is the most practicable considering the use for a wide mass, because staying in the boundaries imposed by Apple and using only first party frameworks makes developing and distributing in the App Store easier. The application needs to be installed on two nearby devices to establish a connection and transfer data. Furthermore since iPhones are typically used under various circumstances and surroundings testing should also cover representable scenarios for common places visited by iPhone users. 

=== Prototype

The prototype should be installable on arbitrary iOS devices and should serve as both client and server. The client must be capable of discovering nearby peers and sending a connection request after user instruction. The server must be capable of advertising a service that clients can find and handling incoming connection requests. Both must be able to display the metrics that the applications measured to the user and should support a method to abort ongoing connections to start new advertisers/discoverers. 

=== Testing

Capturing the data of interest is done by the prototype itself. However general conditions for environmental and data variations have to be defined. Testing must be done in different surroundings distinguishing each other in the density of obstacles, radio frequency emissions or both to cover most real life scenarios. Moreover data size must vary to represent use cases for small payloads like simple message transfer to bigger payloads like sharing files. Another factor to consider is the distance between the two testing devices. All these three external factors must be tested in each possible variation forming a three dimensional matrix. 

// ==== Environments

// ==== Metrics of Interest

// From an abstract perspective the evaluation of the quality of direct connections between mobile iOS devices is done building a prototype application that measures data transfer on the TCP/IP application layer. During testing, the application is simultaniously run on two iOS machines that connect via #gls("awdl") and measure the connection metrics. The measurements taken during the data transfer will then be displayed, ready to be documented by the tester for later evaluation. 
//The overall idea to evaluate the quality of direct connection between mobile iOS devices is to build a prototype application that measures data transfer on the OSI application layer. This application is built in the programming language `Swift` and in the IDE `XCode`. To access the Transport Layer of the OSI model the Networking Framework which is bundled in the iOS SDK was used. This SDK features a synchronous API to read and write data to the underlying networking stack. The measure interface lies directly on top of Networking Frameworks API which makes calculation overhead little.  

// This section should explain the what and why of your experiment — your rationale and high-level design, without diving into exact tools or code yet.
// You could include:
// Objective of the Experiments
// What are you trying to measure, observe, or prove? (e.g., how #gls("awdl") handles peer discovery, connection setup time, data throughput, etc.)
// Experimental Design
// Types of scenarios you're testing (e.g., proximity, number of devices, interference).
// Whether you're testing static or dynamic conditions (e.g., walking with iPhones, varying network conditions).
// Role of Each Device
// e.g., One iPhone as sender, one as receiver.
// MacBook with Wi-Fi adapter as sniffer.
// Assumptions and Constraints
// No access to private APIs.
// Relying on reverse engineering and publicly observable behavior.
// Limited visibility into Apple’s internal workings of #gls("awdl").
// Metrics of Interest
// Packet timing, latency, signal strength, peer discovery time, channel switching patterns.

// == Prototype

// == Layers

// Although the application code can not be exactly grouped into the following categories, for understand the testing structure and how the data is collected the application is best presented from an abstract perspective described in layers. For this model the application can be divided into an `User Interface`, `Logic`, `Measuring` and `Networking` layer.

// image from layers 

// === User Interface

// The `User Interface` layer is developed using `SwiftUI` and serves the presentation of different interaction points, the tester can interact with to control the underlying workings. 

// === Logic 

// The next underlying `Logic` layer serves as a gateway between the user input and the underlying `Measuring` and `Networking` logic. The composition of the first two layers follow the MVVM frontend software pattern, whereas the `Logic` layer corresponds to the view model (VM) part. 

// image from mvvm

// === Measuring

// The measuring layer is highly intervened with the networking layer and therefore the most abstract of these listed. It sits upon the receiving and sending functions of the networking layer and is built to minimize computational delays. 

// === Networking

// The networking layer is built to abstract the communication with the wifi module via the networking framework which is included in the iOS SDK. The measuremnt logic is tightly integrated but the sole responsibility of the networking layer is to parse raw data to communicate with the Networkign API and read header lengths to distinguish between different package types. These different package types will be more precisely covered in implementation. 

// == Server and Client in one App

// == Technical scope

// As already mentioned in the @introduction the prototype will compare several transport protocols and their effects on data transfer between two iOS devices. In particular TCP, UDP and QUIC will be compared side by side under the same conditions and with the same connections metrics. 


// I am testing quic, tcp, udp and comparing them...

//The `User Interface` layer serves the presentation of the different elements that the tester can interact with and is not pertinent for this experiment. The next underlying layer is that of `Logic` which handles the interaction between the user interface, the measuring and networking layer. The measuring layer collects the metrics based on the application data exposed by the networking layer. The networking layer itself is responsible for interacting with the synchronous Networking Framework API, subsequently wrapping it in asynchronous functions.

// == Testing

// They will be compared in different surroundings which generally differ in electromagnetic field levels, which could also influence error rates and data transfer speeds. 

// == Visualization
// describe the overall concept of what you have planned

// what is the purpose of the app, how are you planning to measure the metrics and implement these measurements in the app

// maybe describe which metrics you want to test, but this goes a bit too far into implementation 

// maybe describe in general your approach to a test protocol and that you want to test it in different scenarios and why you think that these different scenarios are important and how you plan to visiualize the results,

// == Notes on security

// as OWL project found out over several papers there are several vulnerabilities even when no service is advertised or port is open so when apps open a port for peer to peer connectivity it is on the one hand the responsibility of the developer to create a secure connection with services. on the other hand the #gls("awdl") itself has some vulnerabilities that can not be eliminated by the developer itself, since they reside in the operating system iOS itself. as already mentioned the encryption of the connection itself is the responsibility of the developer since one can also open up unecrypted ports. to mitigate this responsibility one can use the mulitpeer connectivity framework which builds upon these low level apis and abstracts encryption and establishing the connection away from the developer. also security issues in ad hoc networks itslef are more present then in infrastructure networks since there is no central authority like used by the certificate chains in SSL encryption.

// #(
//   [ Describe an overall concept of a solution, which could possibly solve a given
//     problem. Design a novel solution and visualise the architecture and relevant
//     (data) flows. Compare and relate your approach to possible alternatives and
//     argue why and in which way(s) the suggested solution(s) will be better. ],
// )


// #(
//   [
//   #v(3cm)

//   *Hints for formatting in Typst*:

//   + You can use built-in styles:
//     + with underscore (\_) to _emphasise_ text
//     + forward dash (\`) for `monospaced` text
//     + asterisk (\*) for *strong* (bold) text

//   You can create and use your own (custom) formatting macros:

//   + check out the custom style (see in file `lib.typ`):
//     + `#textit` for #textit([italic]) text
//     + `#textbf` for #textbf([bold face]) text
//   ],
// )
