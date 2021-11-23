import 'package:dcm_flutter/repositories/datasource/company_repository.dart';
import 'package:dcm_flutter/repositories/model/company.dart';
import 'package:dcm_flutter/repositories/model/user.dart';

class ContactViewModel {
  final User _user;

  ContactViewModel(this._user);

  Future<Company> getCompanyData() {
    return CompanyRepository().getCompany(_user);
  }
}