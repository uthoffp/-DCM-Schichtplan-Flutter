import 'dart:async';

import 'package:dcm_flutter/repositories/datasource/clocking_repository.dart';
import 'package:dcm_flutter/repositories/model/clocking_time.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:intl/intl.dart';

class ClockingViewModel {
  final User _user;
  final _date = DateTime.now();
  ClockingRepository? repo;

  List<ClockingTime> _clockingTimes = [];
  StreamController clockingTimes = StreamController<List<ClockingTime>>();
  StreamController errorMessage = StreamController<String>();


  ClockingViewModel(this._user) {
    repo = ClockingRepository(_user);
  }

  void getClockingTimes() {
    repo!.getLatestClockingTimes().then((result) {
      _clockingTimes = result;
      clockingTimes.add(result);
    }).onError((error, stackTrace) {
      errorMessage.add(error!.toString());
    });
  }

  void addClockingTime(int status) {
    repo!.addClockingTime(status).then((_) => getClockingTimes()).onError((error, stackTrace) {
      errorMessage.add(error!.toString());
    });
  }

  bool latestStatusEquals(int status) {
    return _clockingTimes.first.e_Status == status;
  }

  String getCurrentDate() {
    return DateFormat('dd.MM.yyyy').format(_date);
  }

  String getCurrentTime() {
    return DateFormat('hh:mm').format(_date);
  }
}
