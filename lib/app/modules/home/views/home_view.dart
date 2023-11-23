import 'package:budget_tracker_app/app/modules/home/widgets/goal_rogress_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(213, 228, 254, 1),
      body: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 50.0,
          ),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(46, 46, 124, 1),
          ),
          child: Column(
            children: <Widget>[
              // Goal title
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Buy a dream house', style: TextStyle(fontSize: 40.0)),
                ],
              ),
              // Goal Progress
              const GoalProgressIndicator(),

              // dot indicator
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.count.value,
                    // TODO: Replace with the actual length
                    count: 6,
                    effect: WormEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withOpacity(0.5),
                      dotHeight: 10,
                      dotWidth: 10,
                    ), // your preferred effect
                  ),
                ),
              ),

              // Goal detail
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Goal",
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          "by Jan 2030",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    const Text(
                      "\$50,000",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
              ),

              // remaining amount to reach goal
              Container(
                padding: const EdgeInsets.all(16.0),
                margin:
                    const EdgeInsets.only(top: 32.0, right: 32.0, left: 32.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                      52, 112, 237, 1), // Set the background color
                  borderRadius:
                      BorderRadius.circular(10.0), // Set the rounded corner
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Need more saving"),
                        Text("\$25,000"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Saving Projection"),
                        Text("\$250"),
                      ],
                    ),
                  ],
                ),
              ),

              // Contribution lists

              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 50.0),
                margin: const EdgeInsets.only(top: 32.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color
                  borderRadius:
                      BorderRadius.circular(40.0), // Set the rounded corner
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contribution",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(10, 9, 98, 1)),
                        ),
                        Text(
                          "Show History",
                          style: TextStyle(color: Color.fromRGBO(10, 9, 98, 1)),
                        )
                      ],
                    ),
                    LinearPercentIndicator(
                      padding: const EdgeInsets.all(0),
                      progressColor: Colors.red,
                      percent: 0.5,
                      lineHeight: 10.0,
                      barRadius: const Radius.circular(10),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: const [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Colors.blue, // Customize the dot color
                            radius: 4.0, // Customize the dot size
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Monthly Saving",
                                style: TextStyle(
                                    color: Color.fromRGBO(10, 9, 98, 1)),
                              ),
                              Text(
                                "\$15,000",
                                style: TextStyle(
                                    color: Color.fromRGBO(10, 9, 98, 1)),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Colors.yellow, // Customize the dot color
                            radius: 4.0, // Customize the dot size
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Something Else",
                                style: TextStyle(
                                    color: Color.fromRGBO(10, 9, 98, 1)),
                              ),
                              Text(
                                "\$700",
                                style: TextStyle(
                                    color: Color.fromRGBO(10, 9, 98, 1)),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
