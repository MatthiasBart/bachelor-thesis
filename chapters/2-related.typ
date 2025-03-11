#import "global.typ": *

= Related Work<relatedwork>

Already back 2001 the Proem project @Kortuem_Schneider_Preuitt_Thompson_Fickas_Segall_2002 examined different aspects of peer-to-peer applications for ad hoc networks. They already noticed the trend for a ever-larger becoming applicability of personal mobile devices for data sharing but listed resources of mobile devices among other possible limitations. This facet has fastly changed since then and several new ideas like ShAir @Dubois_Bando_Watanabe_Holtzman_2013, a middleware infrasructure for peer-to-peer sharing between mobile devices or mFerio @Balan_Ramasubbu_Prakobphol_Christin_Hong_2009, a peer-to-peer mobile payment system have emerged. The working group of mFerio already noticed the problem that mobile devices rely too heavily on static infrastructure. Fortunately hardware of modern smartphones has matured and has gotten support WiFi Direct which was used by #cite(<Newport_2017>, form: "author") in his approach to develop a new gossip algorithm for a local peer to peer communication system (#cite(<Newport_2017>, form: "year")). Though approaches existed to also introduce LTE-Direct, no support for this technology is given on mobile smartphones @Condoluci_Militano_Orsino_Alonso-Zarate_Araniti_2015. This is why this thesis will focus on the available technologies WiFi-Direct and Bluetooth, which work under the hood of Apple's Multipeer Connectivity. 

TODO: LTE Direct mystery and 5G NR sidelink mystery, why do mobile phones not have access to these technologies? at least the app developers do not have access to that most of this technology is used in vehicles and autonomous driving, C-V2X, seems like these direct communication technologies are not available on modern smartphones and mostly used in public safety or automotive applications, look for sources and write a paragraph about this and its use cases

TODO: write a paragraph about newer approaches about wifi direct or bluetooth on smartphones and mobile devices 

This paragraph is just to showcase that i am capable of both including code listings in @implementation and also reference them correctly in other parts of the thesis. @lst:StoredTaskReference shows how important it is to be very alert when dealing with concurrency. 

// #todo(
//   [

//     Describe the work of other research teams and noteworthy approaches related to
//     your work. State what is different to your solution.

//     + Related literature might/should contain: theoretical foundations,
//       - definitions of key terms,
//       - technologies, techniques,
//       - and/or a literature review

//     + Note on the size and quality of your bibliography:
//       - BA about 30-40 references
//       - MA about 60-100 references

//     Furthermore, check: Are the reference (too) old? Did you include papers from
//     scientific databases, such as ACM or IEEE? Can the reader find your sources?
//     (e.g. check if you named the publisher for books, or specified DOIs for
//     scientific papers)

//     #v(1cm)
  //   *Citation hints when writing in Typst:*

  //   A single citation is possible with the \@Eco:2010 (i.e. using the _at_ sign),
  //   such as @Eco:2010. Find in #cite(<acm:diglibrary>) and/or #cite(<ieee:xplore>) the
  //   latest scientific findings. For citing multiple references, just name them one
  //   by one, such as #cite(<Alley:1998>) #cite(<Booth:2008>)
  //   @Batina:2011
  //   @Eco:2010
  //   @Fernandez-Mir:2011
  //   @Field:2003
  //   @Google:2016a @Google:2017a
  //   @Li:2008
  //   @Shaw:2002
  //   @Strunk:2000
  //   @Wisconsin:2004
  //   @Yin:2013
  //   @Zobel:2004
  //   and they will be listed within the _(_ _)_ round brackets separated by a _;_ semicolon.

  //   If we know where a text of relevance is presented inside an article, we might
  //   specify the page number also, see @Yin:2013[p.~7]. If you want to cite without
  //   parantheses, you specify _form_ as _prose_, as shown here with #cite(<Shaw:2002>, form: "prose").

  // ],
// )

// #todo([
//   #v(1.3cm)
//   *Hints for footnotes in Typst*:

//   As shown in #footnote[Visit https://typst.app/docs for more details on formatting the document using
//     typst. Note, _typst_ is written in the *Rust* programming language.] we might
//   discuss the alternatives.
// ])
