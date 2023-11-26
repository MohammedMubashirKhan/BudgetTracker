import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Budget {
  int? amount;
  String? formattedAmount;
  List<Contributions>? contributions;
  String? title;
  Timestamp? deadLine;
  DateTime? deadLineDate;
  int? deadLineInMonths;
  String? formattedDate;
  int? savedAmount;
  String? formattedsavedAmount;
  int? remainingAmount;
  String? formattedremainingAmount;
  double? monthlyProjection;
  String? formattedmonthlyProjection;

  Budget({this.amount, this.title, this.deadLine, this.savedAmount});

  Budget.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    title = json['title'];
    deadLine = json['deadLine'];
    savedAmount = json['savedAmount'];
  }

  Budget.fromSnap(QueryDocumentSnapshot? snap) {
    var sanpshot = (snap?.data() as Map<String, dynamic>);

    amount = sanpshot['amount'];

    if (sanpshot['contributions'] is List) {
      contributions = <Contributions>[];
      sanpshot['contributions'].forEach((eachContro) {
        if (eachContro is Map<String, dynamic>) {
          contributions!.add(Contributions.fromJson(eachContro));
        }
      });
    }
    formattedAmount = NumberFormat('#,##0').format(amount);
    title = sanpshot['title'];
    deadLine = sanpshot['deadLine'];
    deadLineDate = deadLine?.toDate();
    if (deadLineDate != null) {
      formattedDate = DateFormat('MMM y').format(deadLineDate!);
    }
    savedAmount = sanpshot['savedAmount'];
    formattedsavedAmount = NumberFormat('#,##0').format(savedAmount);
    remainingAmount = (amount ?? 0) - (savedAmount ?? 0);
    formattedremainingAmount = NumberFormat('#,##0').format(remainingAmount);

    DateTime now = DateTime.now();
    int yearsDifference = (deadLineDate?.year ?? 0) - now.year;
    int monthsDifference = (deadLineDate?.month ?? 0) - now.month;
    deadLineInMonths = yearsDifference * 12 + monthsDifference;

    monthlyProjection = (remainingAmount ?? 0) / (deadLineInMonths ?? 0);
    formattedmonthlyProjection =
        NumberFormat('#,##0').format(monthlyProjection);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['formattedAmount'] = formattedAmount;
    data['title'] = title;
    data['deadLine'] = deadLine;
    data['deadLineDate'] = deadLineDate;
    data['formattedDate'] = formattedDate;
    data['savedAmount'] = savedAmount;
    data['formattedsavedAmount'] = formattedsavedAmount;
    data['remainingAmount'] = remainingAmount;
    data['formattedremainingAmount'] = formattedremainingAmount;
    data['monthlyProjection'] = monthlyProjection;
    data['formattedmonthlyProjection'] = formattedmonthlyProjection;
    return data;
  }
}

class Contributions {
  int? amount;
  String? formattedAmount;
  Timestamp? dateOfContribuation;
  DateTime? dateOfContribuationDateTime;
  String? formateddateOfContribuationDateTime;
  String? source;

  Contributions({this.amount, this.dateOfContribuation, this.source});

  Contributions.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    formattedAmount = NumberFormat('#,##0').format(amount);
    dateOfContribuation = json['dateOfContribuation'];
    dateOfContribuationDateTime = dateOfContribuation?.toDate();
    formateddateOfContribuationDateTime =
        DateFormat('MMM y').format(dateOfContribuationDateTime!);
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['dateOfContribuation'] = dateOfContribuation;
    data['source'] = source;
    return data;
  }
}
