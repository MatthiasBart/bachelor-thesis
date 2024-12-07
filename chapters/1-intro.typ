#import "global.typ": *

= Introduction

#v(1em)
#quote(
  [Most smartphone communication leverages one hop radio links to cell towers or WiFi access points. In recent years, however, the major smartphone operating systems have included increasingly stable and useful support for local peer-to-peer communication that allows a device to talk directly to a nearby device (using local radio broadcast) while avoiding cellular and WiFi infrastructure. The ability to create these local links, combined with the ubiquity of smartphones, enables scenarios in which large groups of nearby smartphone users run applications that create peer-to-peer meshes supporting infrastructure-free networking. There are many possible motivations for these smartphone peer-to-peer networks. For example, they can support communication in settings where network infrastructure is censored (e.g., government protests), overwhelmed (e.g., a large festival or march), or unavailable (e.g., after a disaster or at a remote event). In addition, in developing countries, cellular data minutes are often bought in blocks and carefully conserved—increasing interest in networking operations that do not require cellular infrastructure.], [Calvin Newport, 2017],
)
#v(1em)

This thesis analyses and measures the capabilities of the latest iOS devices to communicate via direct #gls("ptp") networks. Since most of current technology standards rely heavily on external infrastructure with powerful receiver antennas, direct #gls("ptp") communication is not yet wide spread or optimized to function over long distances. However it is unclear, where the boundaries of the current implementations lie and therefore which type of applications could be implemented with direct #gls("ptp").

== Motivation 

Modern mobile devices can make use of a wide variety of communication technologies. Besides having different applicabilities and protocols, standards like Bluetooth, WiFi or 5G need to be wireless to seamlessly transfer data. Nevertheless the complexity of creating devices supporting all of these different standards at the same time, global economic demand has impacted research and development in data transmission and hardware engineering to accumulate to over 4 billion smartphone users, as of 2024. Unfortunately most of the communication methods used on smartphones all rely on mediators. Be it a router in a local network or a cell tower in a cellular network, without these nodes a connection between two peers can not be established, no matter how close neighboring devices are. However in scenarios where the required infrastructure is not available or data needs to be handled sensitive, communication between two mobile devices can be initiated via Bluetooth or peer-to-peer WiFi. Due to the latest advancements in these technologies and hardware, it is unclear how good of an option it is to replace mediator based with direct #gls("ptp") communication in various situations. This thesis tries to find and measure metrics that indicate the quality of direct #gls("ptp") connections on Apple's mobile devices. This can help to evaluate the feasibility of alike projects. In particular the Multipeer Connectivity Framework accessible from iOS 7.0+ will be tested for its robustness considering metrics of quality in different scenarios and locations.

== Research Definition

*Research Questions*

Can direct #gls("ptp") connections between Apple devices improve connectivity in contrast to commercial technologies to build new forms of mobile connections?

*Hypothesis*

$H_1$

Direct #gls("ptp") connectivity on Apple devices can enhance connectivity in different scenarios and therefore work as an alternative to mediator based communication technologies, for implementing ad-hoc mesh networks.


// #todo(
//   [ State a hypothesis – a rough idea – of how you think a solution might look
//     like. Explain, how to possibly solve a given problem. ],
// )

*Method*

A prototype application will be developed that will serve as a tool to measure quality metrics of connectivity. The metrics will be defined in the test protocol. In addition, different scenarios, indicating various characteristics of real life scenarios will be tested to cover most areas of application. Measurement of connection quality will be purely based on values captured by the prototype app itself. The characteristics of the environment will be first described based on human perceive. Measuring distance will be done with .... TODO 


Since the latest smartphone technologies improved hardware and operating system for direct communications, it is unclear how well these techniques can currently serve direct communication in different scenarios. Focusing on the Apple platform, an iOS App is developed, that also serves as testing utility. After discussing related work that summarizes past attempts, considerations and benefits of direct communication the @background will provide all required knowledge to understand the concepts of the design and decisions made to best answer the question, if or when latest technology is/will be ready to rely on direct #gls("ptp") communication.

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
