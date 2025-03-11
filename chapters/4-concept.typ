#import "global.typ": *

= Concept

== Overall Idea

The overall idea to evaluate the quality of direct connection between mobile iOS devices is to build a prototype application that measures data on the application layer. This application was built in the programming language `Swift` and in the IDE `XCode`. To access the Transport Layer of the OSI model the Networking Framework which is bundled in the iOS SDK was used. This SDK features a synchronous API to read and write data to the underlying networking stack. The measure interface lies directly on top of Networking Frameworks API which makes calculation overhead little.  

== Layers

Although the application code can not be grouped into the following categories, understand the testing structure it is best presented from an abstract perspective described in layers. For this model the application can be divided into an `User Interface`, `Logic`, `Measuring` and `Networking` layer. The `User Interface` layer serves the presentation of the different elements that the tester can interact with and is not pertinent for this experiment. The next underlying layer is that of `Logic` which handles the interaction between the user interface, the measuring and networking layer. The measuring layer collects the metrics based on the application data exposed by the networking layer. The networking layer itself is responsible for interacting with the synchronous Networking Framework API, subsequently wrapping it in asynchronous functions.

== Testing Concept 

== Visualization
describe the overall concept of what you have planned

what is the purpose of the app, how are you planning to measure the metrics and implement these measurements in the app

maybe describe which metrics you want to test, but this goes a bit too far into implementation 

maybe describe in general your approach to a test protocol and that you want to test it in different scenarios and why you think that these different scenarios are important and how you plan to visiualize the results,

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
