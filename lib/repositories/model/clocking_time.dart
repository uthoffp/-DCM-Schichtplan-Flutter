import 'package:dcm_flutter/resources/strings.dart';
import 'package:intl/intl.dart';

class ClockingTime {
  String e_Date;
  int e_Status;
  String e_Time;
  String employeeNumber;

  ClockingTime({required this.e_Date, required this.e_Status, required this.e_Time, required this.employeeNumber});

  factory ClockingTime.fromJson(Map<String, dynamic> json) {
    return ClockingTime(
      e_Date: json['E_Date'],
      e_Status: json['E_Status'],
      e_Time: json['E_Time'],
      employeeNumber: json['EmployeeNumber'],
    );
  }

  String getStatus() {
    return e_Status == 1 ? Strings.txtComes : Strings.txtGoes;
  }

  String getDate() {
    return DateFormat('dd.MM.yyyy').format(DateTime.parse(e_Date));
  }
}
