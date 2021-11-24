import 'package:intl/intl.dart';

class TimeInfo {
  String date;
  int? dailyHoursNet;
  String? department;
  String? divDepartmentsSt1;
  String? divDepartmentsSt2;
  Object? electronicTime;
  String? endTime1;
  String? endTime2;
  int? kindOfDay;
  String? specialTime1;
  String? specialTime2;
  String? startTime1;
  String? startTime2;
  String? station1;
  String? station2;

  TimeInfo(
      {required this.date,
      this.dailyHoursNet,
      this.department,
      this.divDepartmentsSt1,
      this.divDepartmentsSt2,
      this.electronicTime,
      this.endTime1,
      this.endTime2,
      this.kindOfDay,
      this.specialTime1,
      this.specialTime2,
      this.startTime1,
      this.startTime2,
      this.station1,
      this.station2});

  factory TimeInfo.fromJson(Map<String, dynamic> json) {
    return TimeInfo(
      date: json['DATE'],
      dailyHoursNet: json['DailyHoursNet'],
      department: json['Department'],
      divDepartmentsSt1: json['DivDepartmentsSt1'],
      divDepartmentsSt2: json['DivDepartmentsSt2'],
      electronicTime: json['ElectronicTime'],
      endTime1: json['EndTime1'],
      endTime2: json['EndTime2'],
      kindOfDay: json['KindOfDay'],
      specialTime1: json['SpecialTime1'],
      specialTime2: json['SpecialTime2'],
      startTime1: json['StartTime1'],
      startTime2: json['StartTime2'],
      station1: json['Station1'],
      station2: json['Station2'],
    );
  }

  String getDate() {
    DateTime dateTime = DateTime.parse(date);
    String enDay = DateFormat("EEEE").format(dateTime);
    String deDate = DateFormat("dd.MM").format(dateTime);

    String deDay = "";
    switch (enDay) {
      case "Monday":
        deDay = "Mo.";
        break;
      case "Tuesday":
        deDay = "Di.";
        break;
      case "Wednesday":
        deDay = "Mi.";
        break;
      case "Thursday":
        deDay = "Do.";
        break;
      case "Friday":
        deDay = "Fr.";
        break;
      case "Saturday":
        deDay = "Sa.";
        break;
      case "Sunday":
        deDay = "So.";
        break;
    }
    return "$deDay, $deDate";
  }
}
