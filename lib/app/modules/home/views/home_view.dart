import 'package:budget_tracker_app/app/modules/home/widgets/goal_rogress_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
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
                () => AnimatedSmoothIndicator(
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
