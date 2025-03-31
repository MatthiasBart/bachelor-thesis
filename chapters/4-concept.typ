#import "global.typ": *

= Concept

The following describes an overall concept on how the evaluation of measuring quality metrics of peer to peer connection between iOS devices is done. It will cover an abstract description of the application design and the used software packages, as well as how testing will work. 

== Overall Idea

The overall idea to evaluate the quality of direct connection between mobile iOS devices is to build a prototype application that measures data transfer on the OSI application layer. The application is written in `Swift` using the integrated development environment (IDE) `XCode`, which is the suggested way to build iOS application by Apple. The built artifact is distributed via TestFlight, an online service for installing and testing apps for Apple devices and can be downloaded via a link or directly installed via cable from the developer machine. The application is then simultaniously run on two iOS machines that can then connect via AWDL and test the connection. Measurements taken during the data transfer will then be displayed and documented for later evaluation. 
//The overall idea to evaluate the quality of direct connection between mobile iOS devices is to build a prototype application that measures data transfer on the OSI application layer. This application is built in the programming language `Swift` and in the IDE `XCode`. To access the Transport Layer of the OSI model the Networking Framework which is bundled in the iOS SDK was used. This SDK features a synchronous API to read and write data to the underlying networking stack. The measure interface lies directly on top of Networking Frameworks API which makes calculation overhead little.  

== Layers

Although the application code can not be exactly grouped into the following categories, for understand the testing structure and how the data is collected the application is best presented from an abstract perspective described in layers. For this model the application can be divided into an `User Interface`, `Logic`, `Measuring` and `Networking` layer.

image from layers 

=== User Interface

The `User Interface` layer is developed using `SwiftUI` and serves the presentation of different interaction points, the tester can interact with to control the underlying workings. 

=== Logic 

The next underlying `Logic` layer serves as a gateway between the user input and the underlying `Measuring` and `Networking` logic. The composition of the first two layers follow the MVVM frontend software pattern, whereas the `Logic` layer corresponds to the view model (VM) part. 

image from mvvm

=== Measuring

The measuring layer is highly intervened with the networking layer and therefore the most abstract of these listed. It sits upon the receiving and sending functions of the networking layer and is built to minimize computational delays. 

=== Networking

The networking layer is built to abstract the communication with the wifi module via the networking framework which is included in the iOS SDK. The measuremnt logic is tightly integrated but the sole responsibility of the networking layer is to parse raw data to communicate with the Networkign API and read header lengths to distinguish between different package types. These different package types will be more precisely covered in implementation. 

== Server and Client in one App

== Technical scope

As already mentioned in the @introduction the prototype will compare several transport protocols and their effects on data transfer between two iOS devices. In particular TCP, UDP and QUIC will be compared side by side under the same conditions and with the same connections metrics. 


I am testing quic, tcp, udp and comparing them...

//The `User Interface` layer serves the presentation of the different elements that the tester can interact with and is not pertinent for this experiment. The next underlying layer is that of `Logic` which handles the interaction between the user interface, the measuring and networking layer. The measuring layer collects the metrics based on the application data exposed by the networking layer. The networking layer itself is responsible for interacting with the synchronous Networking Framework API, subsequently wrapping it in asynchronous functions.

== Testing Concept 

They will be compared in different surroundings which generally differ in electromagnetic field levels, which could also influence error rates and data transfer speeds. Comparison of ambient radiofrequency electromagnetic field (RF-EMF) levels in outdoor areas and public transport in Switzerland in 2014 and 2021 , Hidden-nodes in coexisting LAA & Wi-Fi: a measurement study of real deployments where one can see that LTE of licensed assited access which sends in the spectrums of wifi disturb each other

== Visualization
describe the overall concept of what you have planned

what is the purpose of the app, how are you planning to measure the metrics and implement these measurements in the app

maybe describe which metrics you want to test, but this goes a bit too far into implementation 

maybe describe in general your approach to a test protocol and that you want to test it in different scenarios and why you think that these different scenarios are important and how you plan to visiualize the results,

== Notes on security

as OWL project found out over several papers there are several vulnerabilities even when no service is advertised or port is open so when apps open a port for peer to peer connectivity it is on the one hand the responsibility of the developer to create a secure connection with services. on the other hand the awdl itself has some vulnerabilities that can not be eliminated by the developer itself, since they reside in the operating system iOS itself. as already mentioned the encryption of the connection itself is the responsibility of the developer since one can also open up unecrypted ports. to mitigate this responsibility one can use the mulitpeer connectivity framework which builds upon these low level apis and abstracts encryption and establishing the connection away from the developer. also security issues in ad hoc networks itslef are more present then in infrastructure networks since there is no central authority like used by the certificate chains in SSL encryption.

#todo(
  [ Describe an overall concept of a solution, which could possibly solve a given
    problem. Design a novel solution and visualise the architecture and relevant
    (data) flows. Compare and relate your approach to possible alternatives and
    argue why and in which way(s) the suggested solution(s) will be better. ],
)


#todo(
  [
  #v(3cm)

  *Hints for formatting in Typst*:

  + You can use built-in styles:
    + with underscore (\_) to _emphasise_ text
    + forward dash (\`) for `monospaced` text
    + asterisk (\*) for *strong* (bold) text

  You can create and use your own (custom) formatting macros:

  + check out the custom style (see in file `lib.typ`):
    + `#textit` for #textit([italic]) text
    + `#textbf` for #textbf([bold face]) text
  ],
)
