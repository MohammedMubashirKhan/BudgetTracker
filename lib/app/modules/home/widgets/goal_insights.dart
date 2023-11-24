import 'package:flutter/material.dart';

class GoalInsights extends StatelessWidget {
  const GoalInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        fontSize: 17, color: Colors.white.withOpacity(0.5)),
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
          margin: const EdgeInsets.only(top: 32.0, right: 32.0, left: 32.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(
                52, 112, 237, 1), // Set the background color
            borderRadius: BorderRadius.circular(10.0), // Set the rounded corner
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
      ],
    );
  }
}
