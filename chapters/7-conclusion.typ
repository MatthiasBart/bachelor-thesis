#import "global.typ": *

= Conclusion and Outlook

Overall, considering the big research question, forming big mesh networks over wide areas throughout a city might not be possible yet due to technical and especially regulatory reasons. What we found in this research however is that connection quality highly depends on the surroundings, although not in the sense we might anticipated in the first place. Forest and Inner City did not differ in metrics the way we thought it would do so we conclude that #gls("rfemf") pollution might not be as effective as we thought. What we found however in the Inner City, while generally performing well considering Jitter and data transfer speed, is that groups of people that were blocking the view of sight caused outliers in #gls("rtt") and Jitter. Also we found that using different transport protocols also effects metrics like #gls("rtt"), Jitter and data transfer speed, but showed that for most cases #gls("quic") might be the best fit, especially because there might soon be a standard to also support an unreliable datagram extension for #gls("quic") @pauly_unreliable_2022. 

== Outlook

What was unfortunately not covered by this research but would be still interesting to explore considering the issues we had on the field is how device temperature effects connection quality metrics and also connection establishment using the same protocol stack (#gls("awdl") and Bonjour). Another known unknown is why service discovery seemed more difficult, considering the distance than transferring data to a known host or how different devices, newer or older, iPad, iPhone or Mac change these metrics. 

Another topic we did not focus on in my research per se but was very present in @relatedwork was device security. It is needless to say that smartphones nowadays own enough personal data to make a huge part of ones identity. If this is a good or a bad thing is a philosophical question we do not want cover here in more detail but we urge everybody, especially big vendors like Apple, Samsung and co to be much more sensitive and responsive to these topics and also support research in this field since the trend for these devices to gather more and more personal data is only to increase.

== Software

To help enthusiasts get started we share the #gls("ios") application as well as the Jupyter Notebook to create the graphics and statistical metrics on GitHub. If any help is needed or questions arise related we suggest to create an issue on GitHub describing your problem.


