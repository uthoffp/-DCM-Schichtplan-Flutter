import 'dart:convert';

import 'package:dcm_flutter/repositories/model/request_days.dart';
import 'package:dcm_flutter/repositories/model/special_time.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:http/http.dart' as http;

class AbRequestRepository {
  final User _user;

  AbRequestRepository(this._user);

  Future<List<SpecialTime>> getSpecialTimes() async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json', 'auth': _user.token};
    String url = Strings.baseUrl + "/company/${_user.company}/specialtime";

    var response = await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<SpecialTime>.from(l.map((model) => SpecialTime.fromJson(model)));
    } else {
      throw Exception('Unable to load clocking times');
    }
  }

  Future<void> postAbRequest(SpecialTime type, String start, int startHalf, String stop, int stopHalf, String? comment,
      Object? attachment) async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json', 'auth': _user.token};
    var requestBody = json.encode({
      "nameValuePairs": {
        "department": _user.department,
        "type": type.typeKey,
        "start": start,
        "startHalf": startHalf,
        "stop": stop,
        "stopHalf": stopHalf,
        "comment": comment,
        "attachment": attachment,
        "username": _user.toString()
      }
    });

    String url = Strings.baseUrl + "/company/${_user.company}/user/${_user.uId}/abrequest";
    var response = await http.post(Uri.parse(url), headers: requestHeaders, body: requestBody);

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Unable to post clocking times');
    }
  }

  Future<RequestDays> requestDays(String start, String stop) async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json', 'auth': _user.token};
    String url = Strings.baseUrl + "/company/${_user.company}/user/${_user.uId}/holidays/$start/$stop";

    var response = await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      return RequestDays.fromJson(json.decode(response.body));
    } else {
      throw Exception('Unable to load clocking times');
    }
  }
}
