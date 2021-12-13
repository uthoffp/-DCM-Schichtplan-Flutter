import 'dart:convert';

import 'package:dcm_flutter/repositories/model/time_info.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:http/http.dart' as http;

class TimeRepository {
  //get actual times for the Ist-Zeiten fragment
  Future<List<TimeInfo>> getTimesActual(User user, String start, String stop) async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json', 'auth': user.token};
    String url = Strings.baseUrl + "/company/${user.company}/user/${user.uId}/actual/$start/$stop";

    var response = await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<TimeInfo>.from(l.map((model) => TimeInfo.fromJson(model)));
    } else {
      throw Exception('Unable to load actual times');
    }
  }

  //get actual times for the Dienstplan fragment
  Future<List<TimeInfo>> getTimesPlanned(User user, String start, String stop) async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json', 'auth': user.token};
    String url = Strings.baseUrl + "/company/${user.company}/user/${user.uId}/planned/$start/$stop";

    var response = await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<TimeInfo>.from(l.map((model) => TimeInfo.fromJson(model)));
    } else {
      throw Exception('Unable to load planned times');
    }
  }
}