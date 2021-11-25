import 'package:dcm_flutter/repositories/datasource/abrequest_repository.dart';
import 'package:dcm_flutter/repositories/model/special_time.dart';
import 'package:dcm_flutter/repositories/model/user.dart';

class AbRequestViewModel {
  final User _user;
  AbRequestRepository? _repo;

  AbRequestViewModel(this._user) {
    _repo = AbRequestRepository(_user);
  }

  Future<List<SpecialTime>> getAbRequestTypes() async {
    return _repo!.getSpecialTimes();
  }

  Future<void> sendAbRequest() async {

  }
}