#import "global.typ": *

= Background<background>

== Infrastructure Networks 

== Ad-hoc Networks
This should better be part of introduction
Describe that all of mobile connections use mediators and why this happend like it and why it is beneficial (bigger antennas that can handle weaker signals and send stronger signals) 
describe what has changes in the last years on apples platform and why non-mediator communication got so important for apples ecosystem, apple watch pairing, clone app to mac (when opened on iphone, eg. calendar), cmd+c and cmd+v via across iphone and mac
what is lorawan and how could it be used one day in smartphones and mobile computing
describe why peertopeer wlan or bluetooth is not yet suitable for long distance communications, 
also mention the longest wlan connection, 273km with bigger antennas

describe what was used on ios device what frameworks exist. how bluetooth was used and how wifi is now used for ptp connections

== Satellite phones<satellite>

== Starlink Direct to Cell<starlink>

#figure(
    box(stroke: gray, inset: 1em,
      image("/figures/starlink.png", width: 25%)
    ),
    caption: [Abstract structure of Starlink's network.]
  )<fig:starlink>

== OSI Transport layer

=== TCP 

==== Nagle's algorithm

=== UDP 

=== QUIC 

== Ad-hoc technologies 

While <satellite> and <starlink> solve the issue of dead spots, they also rely on infrastructure. The following is an incomprehensive list of ad hoc technologies.

=== WiFi

=== Bluetooth

=== LoraWan

=== LTE-Direct and 5G Sidelink

==== gNB

=== NFC

== Ad-hoc on iPhones

=== Bonjour

=== Multipeer Connectivity

=== Networking Framework

=== AWDL

biggest kernel module in iOS 

=== Websockets

== Wireless communication on iPhones 

this heading will focus more on wireless communication in general not per se ad hoc so software here will include 

=== Hardware 

Differences of wifi antennas and cellular antennas, where they are located and how they operate
power of cellular antennas vs wifi antennas of iphones, frequency spectrum of these technologies, what is the real difference which makes the one so much wider than the other, wifi and bluetooth go over the same chip/antenna on iphone

=== Software 

packages like Networking framework, BSD Sockets or URL Session...


#todo(
  [
  In the background section you might give explanations which are necessary to
  read the remainder of the thesis. For example define and/or explain the terms
  used. Optionally, you might provide a glossary (index of terms used with/without
  explanations).

  *Hints for equations in Typst*:

  Mathematical formulas are (embedded in `$`) in Typst. For example:

  The notation used for #textbf([calculating]) of #textit([code performance]) might
  typically look like shown in @eq:performance, i.e. the first one for *slow* in
  @slow and the other one for *very slow* in @veryslow.

  ])

  #figure(
    kind: math.equation, align(left, [
      #set math.equation(numbering: "(I)", supplement: [Eq.])
      $ O(n) = n^2 $ <slow>
      $ O(n) = 2^n $ <veryslow>
    ]), caption: flex-caption([Equations calculate the performance.], [Performance.]),
  ) <eq:performance>

  #figure(
    kind: math.equation, align(
      left, [
        In the text we refer multiple times to $phi.alt$. We define it to be calcultated
        as shown here:
        #set math.equation(numbering: "(I)", supplement: [Eq.])
        $ d &= 24 -10 - 7 - sqrt(3) \
          d &= 14 - 7 - sqrt(3) \
          d &= 7 - sqrt(3) $ <diff>
        $ phi.alt := d / 3 $ <ratio>
      ],
    ), caption: flex-caption(
      [A custom definition of $phi.alt$ allows to shorten upcoming equations.], [Phi defined in two steps.],
    ),
  ) <eq:phidef>


#todo([
  The @eq:phidef explains (for the single steps see @diff and @ratio) how the
  overall $phi.alt$ is calculated to be used in the upcoming formulas of this
  thesis.

  ],
)
