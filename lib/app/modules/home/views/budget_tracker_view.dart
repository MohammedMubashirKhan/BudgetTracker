import 'package:budget_tracker_app/app/modules/home/controllers/home_controller.dart';
import 'package:budget_tracker_app/app/modules/home/models/budget.dart';
import 'package:budget_tracker_app/app/modules/home/widgets/goal_insights.dart';
import 'package:budget_tracker_app/app/modules/home/widgets/goal_rogress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BudgetTrackerView extends StatelessWidget {
  const BudgetTrackerView({
    super.key,
    required this.controller,
    required this.budget,
  });

  final HomeController controller;
  final Budget? budget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${budget?.title}',
                      style: const TextStyle(fontSize: 40.0)),
                ],
              ),
              // Goal Progress
              Obx(
                () => GoalProgressIndicator(
                  dotIndicatorIndex: controller.docLength.value ?? 1,
                  selectedIndex: controller.selectedIndex,
                  savedAmount: budget?.formattedsavedAmount,
                  percent:
                      (budget?.savedAmount ?? 0.0) / (budget?.amount ?? 1.0),
                ),
              ),

              // Remaining amount and monthly projection
              GoalInsights(
                  amount: budget?.amount,
                  formattedAmount: budget?.formattedAmount,
                  saved: budget?.savedAmount,
                  deadLinedate: budget?.formattedDate,
                  remainigToReachGoal: budget?.formattedremainingAmount,
                  monthlyProjection: budget?.formattedmonthlyProjection),

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
                child: Column(
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: budget?.contributions?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor:
                                Colors.blue, // Customize the dot color
                            radius: 4.0, // Customize the dot size
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "${budget?.contributions?[index].source}",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(10, 9, 98, 1)),
                                ),
                              ),
                              Text(
                                "\$${budget?.contributions?[index].formattedAmount}",
                                style: const TextStyle(
                                    color: Color.fromRGBO(10, 9, 98, 1)),
                              )
                            ],
                          ),
                          subtitle: Text(
                            "${budget?.contributions?[index].formateddateOfContribuationDateTime}",
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 9, 98, 1)),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
