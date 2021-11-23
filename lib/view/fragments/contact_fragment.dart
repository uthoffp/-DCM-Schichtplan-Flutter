import 'package:dcm_flutter/repositories/model/company.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/viewmodel/contact_viewmodel.dart';
import 'package:flutter/material.dart';

class ContactFragment extends StatefulWidget {
  final User _user;
  const ContactFragment(this._user, {Key? key}) : super(key: key);

  @override
  State<ContactFragment> createState() => _ContactFragmentState(_user);
}

class _ContactFragmentState extends State<ContactFragment> {
  final User _user;
  String _name = "";
  String _street = "";
  String _city = "";
  String _phone = "";

  _ContactFragmentState(this._user);

  @override
  void initState() {
    ContactViewModel(_user).getCompanyData().then((company) {
      setState(() {
        _name = company.companyName1;
        _street = company.street!;
        _city = company.city!;
        _phone = company.phone!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(_name, style: textTheme.headline5)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(_street, style: textTheme.headline5)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(_city, style: textTheme.headline5)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(_phone, style: textTheme.headline5)),
          ),
        ]));
  }
}
