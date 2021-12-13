import 'dart:convert';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:http/http.dart' as http;

//performs login and in later versions password reset requests on the dcm api
class UserRepository {
  //call login with company, username and password. returns user with token if correct
  Future<User> login(String cId, String username, String password) async {
    String url = Strings.baseUrl + "/company/$cId/login/$username?pw=$password";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Login Failed');
    }
  }
}
