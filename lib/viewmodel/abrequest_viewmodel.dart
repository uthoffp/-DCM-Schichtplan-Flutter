import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dcm_flutter/repositories/datasource/abrequest_repository.dart';
import 'package:dcm_flutter/repositories/model/request_days.dart';
import 'package:dcm_flutter/repositories/model/special_time.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:intl/intl.dart';

class AbRequestViewModel {
  final User _user;
  AbRequestRepository? _repo;
  List<SpecialTime>? specialTimes;

  SpecialTime? type;
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateTime start = DateTime.now();
  DateTime stop = DateTime.now();
  int firstDayHalf = 0;
  int lastDayHalf = 0;
  String? comment;
  File? image;

  StreamController message = StreamController<String>();
  StreamController imageSelected = StreamController<bool>();

  AbRequestViewModel(this._user) {
    _repo = AbRequestRepository(_user);
    getAbRequestTypes().then((value) => specialTimes = value);
  }

  Future<List<SpecialTime>> getAbRequestTypes() async {
    return _repo!.getSpecialTimes();
  }

  bool validateUserInputs(int firstDayHalf, int lastDayHalf, String comment) {
    if (type == null) {
      message.add("Bitte wählen sie einen Typ aus.");
      return false;
    }
    if (start.millisecondsSinceEpoch > stop.millisecondsSinceEpoch) {
      message.add("Bitte geben sie einen gültigen Zeitraum ein.");
      return false;
    }
    this.firstDayHalf = firstDayHalf;
    this.lastDayHalf = lastDayHalf;
    this.comment = comment;
    return true;
  }

  void setType(String type) {
    this.type = specialTimes!.firstWhere((element) => element.name == type);
  }

  bool isDirectSend() {
    return type != null && type!.daysInAdvance == 0;
  }

  int dayTypeToKey(String type) {
    if (type == Strings.menuDayFull) return 0;
    return 1;
  }

  Future<void> sendAbRequest() async {
    String? imgB64 = image != null ? base64Encode(image!.readAsBytesSync()) : null;

    return _repo!.postAbRequest(
        type!, dateFormat.format(start), firstDayHalf, dateFormat.format(stop), lastDayHalf, comment!, imgB64);
  }

  Future<RequestDays> getRequestDays() {
    return _repo!.requestDays(dateFormat.format(start), dateFormat.format(stop));
  }

  RequestDays adjustRequestDays(RequestDays requestDays) {
    if (firstDayHalf == 1) requestDays.thisRequest += 0.5;
    if (lastDayHalf == 1 && requestDays.thisRequest <= -1) requestDays.thisRequest += 0.5;
    requestDays.remaining = requestDays.open + requestDays.thisRequest;
    return requestDays;
  }

  void setImage(String imagePath) {
    image = File(imagePath);
    imageSelected.add(true);
  }

  void removeImage() {
    image = null;
    imageSelected.add(false);
  }
}
