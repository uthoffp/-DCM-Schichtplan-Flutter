import 'dart:async';

import 'package:dcm_flutter/repositories/datasource/time_repository.dart';
import 'package:dcm_flutter/repositories/model/time_info.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:intl/intl.dart';

class TimeViewModel {
  final User _user;
  final String _type;

  StreamController times = StreamController<List<TimeInfo>>();
  StreamController errorMessage = StreamController<String>();

  TimeViewModel(this._user, this._type);

  void getTimes(DateTime date) {
    TimeRepository repo = TimeRepository();
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    String start = dateFormat.format(date);
    String stop = dateFormat.format(date.add(const Duration(days: 14)));

    if (_type == Strings.menuActual) {
      repo.getTimesActual(_user, start, stop).then((result) {
        times.add(result);
      }).onError((error, stackTrace) {
        errorMessage.add(error!.toString());
      });
    } else {
      repo.getTimesPlanned(_user, start, stop).then((result) {
        times.add(result);
      }).onError((error, stackTrace) {
        errorMessage.add(error!.toString());
      });
    }
  }

  static String getShift1Dep(TimeInfo timeInfo) {
    String? station = timeInfo.station1;
    String? department = timeInfo.divDepartmentsSt1;

    if (department == null || department.isEmpty) department = timeInfo.department;

    if (department == null) {
      return "";
    } else if (station == null) {
      return department.replaceAll(' ', '');
    } else {
      return "$department ($station)".replaceAll(' ', '');
    }
  }

  static String getShift2Dep(TimeInfo timeInfo) {
    String? station = timeInfo.station2;
    String? department = timeInfo.divDepartmentsSt2;

    if (department == null || department.isEmpty) department = timeInfo.department;

    if (department == null) {
      return "";
    } else if (station == null) {
      return department.replaceAll(' ', '');
    } else {
      return "$department ($station)".replaceAll(' ', '');
    }
  }
}
