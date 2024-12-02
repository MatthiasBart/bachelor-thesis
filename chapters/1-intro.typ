#import "global.typ": *

= Introduction

#v(1em)
#quote(
  [Most smartphone communication leverages one hop radio links to cell towers or WiFi access points. In recent years, however, the major smartphone operating systems have included increasingly stable and useful support for local peer-to-peer communication that allows a device to talk directly to a nearby device (using local radio broadcast) while avoiding cellular and WiFi infrastructure. The ability to create these local links, combined with the ubiquity of smartphones, enables scenarios in which large groups of nearby smartphone users run applications that create peer-to-peer meshes supporting infrastructure-free networking. There are many possible motivations for these smartphone peer-to-peer networks. For example, they can support communication in settings where network infrastructure is censored (e.g., government protests), overwhelmed (e.g., a large festival or march), or unavailable (e.g., after a disaster or at a remote event). In addition, in developing countries, cellular data minutes are often bought in blocks and carefully conserved—increasing interest in networking operations that do not require cellular infrastructure.], [Calvin Newport, 2017],
)
#v(1em)

*Problem Statement*

Modern mobile devices can make use of a wide variety of communication technologies. To achieve data transfers seamlessly, standards like Bluetooth, WiFi or 5G need to be wireless. The use cases are different and so is the applicability and protocol. Nevertheless the complexity of creating devices supporting all of these different standards, global economic demand has drastically impacted research and development in data transmission and hardware engineering to let humanity invent smartphones. Unfortunately most of the communication methods used on smartphones all demand on mediators. Be it a router in a local network or a cell tower in a cellular network, without these nodes a connection between two peers could not be established. However in scenarios where the required infrastructure is not available or in reach, communication between two mobile phones could be initiated through Bluetooth or peertopeer WiFi. Due to the latest advancements in these technologies and hardware, it is unclear how good of an option it is to replace mediator based with direct Peer to Peer (PtP) communication in various situations. This thesis tries to find and measure metrics that indicate the quality of direct PtP connections on Apple's mobile devices. This can help to evaluate the feasibility of alike projects. In particular the Multipeer Connectivity Framework accessible from iOS 7.0+ will be tested for its robustness considering metrics of quality in different scenarios and locations.

*Research Questions*

Can direct PtP connections between Apple devices improve connectivity in certain scenarios?

*Hypothesis*

$H_1$

Direct PtP connectivity on Apple devices can enhance connectivity in different scenarios.


#todo(
  [ State a hypothesis – a rough idea – of how you think a solution might look
    like. Explain, how to possibly solve a given problem. ],
)

#pagebreak()

*Method*

A prototype application will be developed that will serve as a tool to measure metrics of quality of connectivity. Metrics of quality and different these are measured, will be defined in the testing protocol. 

#todo(
  [
    Describe your structured, academic approach to find — and evaluate — a solution.
    When you needed (large) data sets for you work, explain how you collected and
    filtered raw data. For the validation (see Section Evaluation 6) you want to
    describe the criteria for objective measurement.
  ],
)

#todo(
  [
    #v(3cm)
    Note the so called "*Roter Faden*": At the end of one chapter you might sum up
    the content. Then you give an outlook on the next chapter. For example, at the
    end of the introduction you might start the text with:

    _The remainder of the thesis is structured as follows:_
    _The implementation is presented in @implementation (including the backend
    @backend and the frontend @frontend). The evaluation ... ..._
  ],
)
