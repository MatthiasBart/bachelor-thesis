#import "global.typ": *

//MARK: The QUIC protocol has significant advantages over TCP. If you’re building a custom network protocol, consider using QUIC instead of TCP. https://developer.apple.com/documentation/technotes/tn3151-choosing-the-right-networking-api
= Implementation <implementation>
The application is written in `Swift` using the integrated development environment (IDE) `XCode`, which is the suggested way to build iOS application by Apple. The built artifact is distributed via TestFlight, an online service for installing and testing apps for Apple devices and can be downloaded via an URL or directly installed by the developer machine.
== Application 
The following builds upon the concepts described in the previous chapter but will describe further details and show code examples. The presentation of the inner workings of the application will be structured in the layers descirbed in the previous chapter, whereas the User Interface and the logic layers are outlined together to improve understanding of the connections of graphical layouts and corresponding logic. The measurement and networking layers are mentioned under the headings of the seperate screens where it is applicable. The Start screen for example, does not contain code for neither networking nor measurement. 

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
