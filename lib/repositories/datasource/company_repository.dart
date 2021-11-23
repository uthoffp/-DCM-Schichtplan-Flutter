import 'dart:convert';

import 'package:dcm_flutter/repositories/model/company.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:http/http.dart' as http;

class CompanyRepository {
  Future<List<Company>> getAllCompanies() async {
    String url = Strings.baseUrl + "/company";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<Company>.from(l.map((model)=> Company.fromJson(model)));
    } else {
      throw Exception('Unable to load company data');
    }
  }

  Future<Company> getCompany(User user) async {

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'auth': user.token
    };

    String url = Strings.baseUrl + "/company/${user.company}";

    var response = await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      return Company.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unable to load company data');
    }
  }
}