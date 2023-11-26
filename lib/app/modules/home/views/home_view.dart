import 'dart:developer';

import 'package:budget_tracker_app/app/modules/home/views/budget_tracker_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(213, 228, 254, 1),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('goals').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  itemBuilder: (context, index) {
                    controller.convertSnapToBudget(snapshot, index);
                    return BudgetTrackerView(
                      controller: controller,
                      budget: controller.budget,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15.0,
                  ),
                );
              }
              return const Center(
                child: Text("No data to display"),
              );
            }),
      ),
    );
  }
}
