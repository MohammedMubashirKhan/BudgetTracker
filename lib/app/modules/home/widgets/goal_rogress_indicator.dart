import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GoalProgressIndicator extends StatelessWidget {
  const GoalProgressIndicator({
    super.key,
    required this.dotIndicatorIndex,
    required this.selectedIndex,
    this.savedAmount,
    this.percent,
  });

  final int dotIndicatorIndex;
  final int selectedIndex;
  final String? savedAmount;
  final double? percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        children: [
          CircularPercentIndicator(
            startAngle: 220.0,
            radius: 125.0,
            lineWidth: 5.0,
            percent: (percent ?? 0.0),
            // Inside of the circular percentage indicator
            center: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.home_rounded, size: 100),
                Text(
                  "\$$savedAmount",
                  style: const TextStyle(fontSize: 30.0),
                ),
                Text(
                  "You Saved",
                  style: TextStyle(
                      fontSize: 20.0, color: Colors.white.withOpacity(0.5)),
                ),
              ],
            ),
            progressColor: Colors.white,
            arcBackgroundColor: Colors.white.withOpacity(0.5),
            arcType: ArcType.FULL,
            animation: true,
            animationDuration: 800,
          ),

          // dot indicator
          AnimatedSmoothIndicator(
            activeIndex: selectedIndex,
            // TODO: Replace with the actual length
            count: dotIndicatorIndex,
            effect: WormEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.5),
              dotHeight: 10,
              dotWidth: 10,
            ), // your preferred effect
          ),
        ],
      ),
    );
  }
}
