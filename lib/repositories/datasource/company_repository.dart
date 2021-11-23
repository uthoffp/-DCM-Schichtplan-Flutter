import 'dart:convert';

import 'package:dcm_flutter/repositories/model/company.dart';
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
      throw Exception('Login Failed');
    }
  }
}