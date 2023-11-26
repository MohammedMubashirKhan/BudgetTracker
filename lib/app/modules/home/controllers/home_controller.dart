import 'dart:developer';

import 'package:budget_tracker_app/app/modules/home/models/budget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxnInt docLength = RxnInt();
  int selectedIndex = 0;
  Budget? budget;

  void convertSnapToBudget(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot, int index) {
    log("${snapshot.data?.docs[index].data()}", name: "snapshot");
    budget = Budget.fromSnap(snapshot.data?.docs[index]);
    docLength.value = snapshot.data?.docs.length;
    selectedIndex = index;
  }
}
