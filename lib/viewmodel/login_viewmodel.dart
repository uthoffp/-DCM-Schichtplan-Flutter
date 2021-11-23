import 'dart:async';

import 'package:dcm_flutter/repositories/datasource/company_repository.dart';
import 'package:dcm_flutter/repositories/datasource/user_repository.dart';
import 'package:dcm_flutter/repositories/model/company.dart';
import 'package:dcm_flutter/repositories/model/user.dart';

class LoginViewModel {
  List<Company> _companies = [];
  StreamController companies = StreamController<List<Company>>();

  Future<User> login(String cName, String username, String password) async {
    UserRepository repo = UserRepository();
    var cId = _companies.firstWhere((item) => item.companyName1 == cName).id;
    return repo.login(cId, username, password);
  }

  void getCompanyData() {
    CompanyRepository repo = CompanyRepository();
    repo.getAllCompanies().then((result) {
      _companies = result;
      companies.add(result);
    });
  }
}
