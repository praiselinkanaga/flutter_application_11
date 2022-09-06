import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class Ratings extends StatefulWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  var rating = 0.0;
  double value = 1.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xff3157F6),
          title: const Text(
            "Star Rating",
            style: kBodyText1,
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.yellow.shade100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmoothStarRating(
                      rating: rating,
                      color: const Color(0xffE5BB12),
                      borderColor: const Color(0xffE5BB12),
                      size: 30,
                      filledIconData: Icons.star_rounded,
                      halfFilledIconData: Icons.star_half_rounded,
                      defaultIconData: Icons.star_border_rounded,
                      starCount: 5,
                      allowHalfRating: true,
                      spacing: 2.0,
                      onRatingChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                    // RatingStars(
                    //   value: value,
                    //   onValueChanged: (v) {
                    //     setState(() {
                    //       value = v;
                    //     });
                    //   },
                    //   starBuilder: (index, color) => Icon(
                    //     Icons.star_rate_rounded,
                    //     color: color,
                    //     size: 30,
                    //   ),
                    //   starCount: 5,
                    //   starSize: 35,
                    //   starOffColor: const Color(0xffAAAAAA),
                    //   starColor: const Color(0xffE5BB12),
                    //   maxValue: 5,
                    //   starSpacing: 1,
                    //   valueLabelColor: const Color(0xff9b9b9b),
                    //   valueLabelTextStyle: const TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.w400,
                    //       fontStyle: FontStyle.normal,
                    //       fontSize: 12.0),
                    //   valueLabelRadius: 10,
                    //   maxValueVisibility: true,
                    //   valueLabelVisibility: true,
                    //   animationDuration: const Duration(milliseconds: 1000),
                    //   valueLabelPadding: const EdgeInsets.symmetric(
                    //       vertical: 1, horizontal: 8),
                    //   valueLabelMargin: const EdgeInsets.only(right: 8),
                    // ),
                    const Text(
                      "4.7 out of 5",
                      style: bBodyText1,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "20 ratings",
              style: bBodyText2,
            ),
            SizedBox(
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xffE5BB12),
                        ),
                        Text(
                          "${index + 1}",
                        ),
                        LinearPercentIndicator(
                          backgroundColor: const Color(0xffF2F2F2),
                          lineHeight: 6.0,
                          width: 320,
                          progressColor: const Color(0xffE5BB12),
                          animation: true,
                          percent: 0.1,
                          trailing: const Text("10"),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ticket ID: 1",
                      style: gBodyText2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Rajeev Ranjan",
                          style: bHeading4,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SmoothStarRating(
                      rating: rating,
                      color: const Color(0xffE5BB12),
                      borderColor: const Color(0xffE5BB12),
                      size: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Thanks for your amazing, timely and prompt work. My refrigerator is working wonderfully after your service.",
                      style: gBodyText1,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xffE4E4E4),
              thickness: 1,
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
