import 'dart:async';

import 'package:dcm_flutter/repositories/datasource/company_repository.dart';
import 'package:dcm_flutter/repositories/datasource/user_repository.dart';
import 'package:dcm_flutter/repositories/model/company.dart';
import 'package:dcm_flutter/repositories/model/user.dart';

class LoginViewModel {
  List<Company> _companies = [];
  StreamController companies = StreamController<List<Company>>();

  // sends login request to UserRepository class. Returns future containing the logged in user or an error message
  Future<User> login(String cName, String username, String password) async {
    UserRepository repo = UserRepository();
    var cId = _companies.firstWhere((item) => item.companyName1 == cName).id;
    return repo.login(cId, username, password);
  }

  // sends company data request to CompanyRepository class. If successful, returned value get passed to the company stream
  void getCompanyData() {
    CompanyRepository repo = CompanyRepository();
    repo.getAllCompanies().then((result) {
      _companies = result;
      companies.add(result);
    });
  }
}
