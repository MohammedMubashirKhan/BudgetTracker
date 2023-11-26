import 'package:budget_tracker_app/app/data/utils/contribution_color_selector.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressStack extends StatelessWidget {
  final List<double>? contributionValues; // List of contribution values

  const LinearProgressStack({super.key, required this.contributionValues});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LinearPercentIndicator(
          padding: const EdgeInsets.all(0),
          percent: 0.0,
          lineHeight: 10.0,
          barRadius: const Radius.circular(10),
        ),
        for (int i = 0; i < (contributionValues?.length ?? 0); i++)
          LinearPercentIndicator(
            padding: const EdgeInsets.all(0),
            progressColor: contributionColor(i),
            backgroundColor: Colors.transparent,
            percent: contributionValues![i],
            lineHeight: 10.0,
            barRadius: const Radius.circular(10),
          ),
      ],
    );
  }
}
