import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalProgressIndicator extends StatelessWidget {
  const GoalProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: CircularPercentIndicator(
        startAngle: 220.0,
        radius: 125.0,
        lineWidth: 5.0,
        percent: 0.40,
        // Inside of the circular percentage indicator
        center: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.home_rounded, size: 100),
            const Text(
              "\$25,000",
              style: TextStyle(fontSize: 30.0),
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
    );
  }
}
