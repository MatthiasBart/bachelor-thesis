#import "global.typ": *

= Results and Evaluation 

The following section shows the scenarios the testings were executed and presents the metrics individually before discussing the hypothesis. Testing has been done on 1.Mai 2025 in Vienna around noon. The weather was sunny and it had around 25 degrees celsius.

#figure(
  image("/figures/weather.png", width: 60%),
  caption: [Weather at day of testing.]
)<fig:weather>

== Field

Testing on the field started at around 11:38 and ended at around 12:15 at the coordinates `48,22695° N, 16,24221° E`. 

#figure(
  image("/figures/field.jpeg", width: 75%),
  caption: [Field at time of testing.]
)<fig:field>

== Forest 

Testing in the forest started at around 12:21 and ended at around 12:37 at the coordinates `48,22605° N, 16,24379° E`.

#figure(
  image("/figures/forest.jpeg", width: 35%),
  caption: [Forest at time of testing.]
)<fig:forest>

== Inner City of Vienna

Testing in the inner city of Vienna started at around 13:31 and ended at around 13:47 at the coordinates `48,20837° N, 16,37043° E`.

#figure(
  image("/figures/inner_city.jpeg", width: 35%),
  caption: [Inner city of vienna at time of testing.]
)<fig:inner_city>

== Underground

Testing in the Underground started at around 14:02 and ended at around 14:12 at the coordinates `48,20815° N, 16,37162° E`.

#figure(
  image("/figures/underground.jpeg", width: 75%),
  caption: [Underground at time of testing.]
)<fig:underground>

== Interpretation

=== Effects of the surroundings

The first hypothesis claims that direct #gls("ptp") communication between #gls("ios") devices depends on the surroundings and functions worse in crowded areas. Data shows that this is not the case in general, although when a pack of people walked between the devices transfer speed got seemingly worse which can also be seen at increased outliers of #gls("rtt") in the inner city. 

#figure(
  image("/figures/speed_scenario.png", width: 75%),
  caption: [Transfer speed per scenario.]
)<fig:speed_scenario>

Measurements of the average #gls("rtt") shows massive outliers in the inner city which again is a hint at the loss of connection quality when people blocked the direct view. Other than that one can see that the median of the measurements in the underground is the lowest. 

#figure(
  image("/figures/rtt_scenario.png", width: 75%),
  caption: [RTT per scenario.]
)<fig:rtt_scenario>

Measurements of the Jitter do not show any reliabilities on the surroundings. Although the Jitter might seem worse in the Forest on the first sight, comparing it to the outliers and the median of the other scenarios it seems that this assumptions is based on how the data is represented and some randomly increased outliers. 

#figure(
  image("/figures/jitter_scenario.png", width: 75%),
  caption: [Jitter per scenario.]
)<fig:jitter_scenario>

This is also supported by a comparison of the statistical values of the Jitter in the different scenarios. It shows that besides some accumulations in the higher sector of the measurements in the forest leading to a higher 0.75 quantile, no differences to the other scenarios can explicitly pointed out in the other quantiles. 

#figure(
    fhjtable(
      tabledata: csv("/data/jitter_scenario_stats.csv"),
      header-row: white,
      odd-row: luma(240),
      even-row: white,
      columns: 9),
    caption: flex-caption(
      [Statistical metrics of Jitter in different scenarios.],
      [Statistical metrics of Jitter.],
    )
) <jitter_stats>

Measurements of the package loss show that the connection worked best in the underground while not seeing big differences comparing the other scenarios.

#figure(
  image("/figures/package_loss_scenario.png", width: 75%),
  caption: [Package loss per scenario.]
)<fig:package_loss_scenario>

==== Conclusion

Data shows that connection quality indeed depends on the surroundings but cannot be linked directly to function worse in crowded areas. While #gls("rfemf") seems to have no effect at all, blocking the direct sight of view severely decreased connection quality. This can be seen in the extreme outliers of #gls("rtt") in the inner city which can be attributed to a group of people walking between the testing devices. This did not happen in the forest because trees and bushes did not move to block view of sight completely during testing. Data also shows that connection quality was best in the underground. This can be attributed to all the metal panels installed on the roof and walls in the underground stations which might better reflect electro magnetic signals.

=== Effects of the Transport Protocol



== Other findings

=== Establishing or finding Bonjour service much more difficult than holding connection

=== Distance abnahme transfer speed

=== the iphone 15 Pro lost more energy than the iphone 12 mini

=== after having quite big issues on field with 10m we switched to 1/5/10 event though 30 was planned but when testing in underground easily 35m <underground_field>

maybe because of heat on the field and the good reflectors in the underground

// #todo([
//   Describe (proof) how your implementation really solved the stated problem. I.e.
//   accept or reject your hypotheses. Provide a range of input data sets. Run
//   experiments and gather the output (of tools) to meter your prototype. For the
//   analysis, collect the measurement-data, process (e.g. filter) data and interpret
//   the data. Include an interpretation of the work. What do the results mean to
//   you? State current limitations of your solution. Give (personal) interpretation
//   where suitable. Your own opinion is relevant, but must be marked clearly as
//   such.

//   == Setup Experiment <setup>

//   #lorem(35)#v(0.5cm)

//   *For example*: During the setup the was configured for the parallel version
//   using the value `+UseParallelGC` for the command line argument `-XX` (`java -XX:+UseParallelGC`).

//   #v(0.3cm)
//   *Hints on dynamically reading in external data for tables in Typst:*

//   Using the custom macro `fhjtable` it is possible to include data dynamically for
//   table generation. The data has to be specified in
//   as shown below:
// ])

// // #figure(
// //     fhjtable(
// //       tabledata: csv("/data/recordings.csv"),
// //       header-row: white,
// //       odd-row: luma(240),
// //       even-row: white,
// //       columns: 3),
// //     caption: flex-caption(
// //       [Professional experience of the test users with databases.],
// //       [DB expertise in years.],
// //     )
// // ) <users>
// // #todo([
// //   Find in @users the years a user has worked with different relational or nosql
// //   databases in a professional context.
// // ])

// #todo([
//   == Measurement <measure>

//   #lorem(35)#v(0.3cm)

//   *Hints on using tables in Typst:*

//   Somewhere in the normal text of the thesis the interpretation of data and
//   information shown in a table must be discussed. Explain to the readers which
//   numbers are important. Possibly, highlight unexpected or special data points.

// ])

// #figure(
//   table(
//     columns: (auto, 4em, 4em, 4em, 4em), inset: 10pt, fill: (x, y) =>
//     if y == 0 { luma(240) }, stroke: gray, align: center, [], [*Min*], [*Max*], [*$diameter$*], [*$sigma$*], [Network roundtrip time], [34.6s], [42.5s], [38.1s], [2.3s], [Time for single request], [2.4s], [13.5s], [*7.1s*], [4.3s],
//   ), caption: flex-caption(
//     [The numbers in the table above show the minimum, maximum, average $diameter$ ,
//       and standard deviation $sigma$ of the 273 measured network times in seconds.],
//     [Roundtrip and request times.],
//   ),
// ) <nwperf>


// #todo([
//   For example: ... @nwperf shows some calculated results on the roundtrip and
//   request times measured in the experiment. The average, the minimum, the maximum
//   and the standard deviations hint to a dramatic increase (> 13%) in performance
//   in comparison to the old solution of 2003.
// ])

// #pagebreak()

// #todo([
//   == Interpretation of the Data <measure>

//   #lorem(35)#v(0.3cm)


//   *For example*: The customisation of the seem to have following positive and negative
//   consequences....


//   *Hints on dynamic calculation in Typst:*

//   We might calculate, e.g. `#calc.max(...)`, within our document, such as max of
//   three and seven times two is: #calc.max(3, 2 * 7).

//   *Hints on using logic in Typst:*

//   For example, we might use *for loop* to arrange a few images in a grid box, as
//   shown below.
// ])

// // #box(height: 124pt, columns(2, gutter: 11pt)[
// //   #for x in range(1, 3) [
// //     #let imagename = "/figures/chart-" + str(x) + ".svg"
// //     #figure(image(imagename, width: 75%), caption: [
// //       Compared source code by metric #(x).
// //     ])
// //   ]
// // ])


// #todo([
// #v(1cm)

// *Hints on Charts:*

// Note: the charts (*vector*! images) shown have been created from raw data using
// the tool *gnuplot* on the command line. With `gnuplot` you can create charts by
// use of a textual command language. This is great for automation and it is also
// great for managing the source code in `git`.

// ])
