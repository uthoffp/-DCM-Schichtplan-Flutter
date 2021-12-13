import 'dart:convert';

import 'package:dcm_flutter/repositories/model/clocking_time.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:http/http.dart' as http;

class ClockingRepository {
  final User _user;

  ClockingRepository(this._user);

  //request the 10 latest clocking times done by the user
  Future<List<ClockingTime>> getLatestClockingTimes() async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json', 'auth': _user.token};
    String url = Strings.baseUrl + "/company/${_user.company}/user/${_user.uId}/actual/latest";

    var response = await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<ClockingTime>.from(l.map((model) => ClockingTime.fromJson(model)));
    } else {
      throw Exception('Unable to load clocking times');
    }
  }

  //post request to add new clocking time to the database
  Future<void> addClockingTime(int status) async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json', 'auth': _user.token};
    var requestBody = json.encode({
      "nameValuePairs": {"tId": 1101, "status": status, "username": _user.toString()}
    });

    String url = Strings.baseUrl + "/company/${_user.company}/user/${_user.uId}/clocking";
    var response = await http.post(Uri.parse(url), headers: requestHeaders, body: requestBody);

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Unable to post clocking times');
    }
  }
}
