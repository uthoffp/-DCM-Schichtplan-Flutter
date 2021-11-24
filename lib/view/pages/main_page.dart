import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/view/fragments/abrequest_fragment.dart';
import 'package:dcm_flutter/view/fragments/clocking_fragment.dart';
import 'package:dcm_flutter/view/fragments/contact_fragment.dart';
import 'package:dcm_flutter/view/fragments/pwchange_fragment.dart';
import 'package:dcm_flutter/view/fragments/time_fragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class MainPage extends StatefulWidget {
  final User _user;

  const MainPage(this._user, {Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState(_user);
}

class _MainPageState extends State<MainPage> {
  String _selectedFragment = Strings.menuPlanned;
  Widget _contentWidget = Container();
  final User _user;

  _MainPageState(this._user);

  void selectDestination(String selectedFragment) {
    setState(() {
      _selectedFragment = selectedFragment;
      switch (selectedFragment) {
        case Strings.menuPlanned:
          _contentWidget = TimeFragment(Strings.menuPlanned, _user);
          break;
        case Strings.menuClocking:
          _contentWidget = ClockingFragment(_user);
          break;
        case Strings.menuAbRequest:
          _contentWidget = AbRequestFragment();
          break;
        case Strings.menuActual:
          _contentWidget = TimeFragment(Strings.menuActual, _user);
          break;
        case Strings.menuContact:
          _contentWidget = ContactFragment(_user);
          break;
        case Strings.menuPwChange:
          _contentWidget = PwChangeFragment();
          break;
        case Strings.menuLogout:
          logout();
          return;
      }
      Navigator.of(context).pop();
    });
  }

  void logout() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return const LoginPage();
    }));
  }


  @override
  void initState() {
    super.initState();
    setState(() {
      _contentWidget = TimeFragment(Strings.menuPlanned, _user);
    });

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedFragment),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 8),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.appName,
                    style: textTheme.headline5,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Align(alignment: Alignment.centerLeft, child: Text(_user.toString(), style: textTheme.headline6)),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            navDrawerItem(context, Icons.calendar_today, Strings.menuPlanned),
            navDrawerItem(context, Icons.access_alarm, Strings.menuClocking),
            navDrawerItem(context, Icons.attach_email, Strings.menuAbRequest),
            navDrawerItem(context, Icons.calendar_today, Strings.menuActual),
            navDrawerItem(context, Icons.contact_mail, Strings.menuContact),
            const Divider(height: 1, thickness: 1),
            navDrawerItem(context, Icons.vpn_key, Strings.menuPwChange),
            navDrawerItem(context, Icons.power_settings_new, Strings.menuLogout),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(padding: EdgeInsets.all(16), child: Text(Strings.menuFooter)),
              ),
            ),
          ],
        ),
      ),
      body: _contentWidget,
    );
  }

  Widget navDrawerItem(BuildContext context, IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        leading: Icon(icon),
        dense: true,
        title: Text(text),
        selected: _selectedFragment == text,
        selectedTileColor: Theme.of(context).colorScheme.primaryVariant,
        onTap: () => selectDestination(text),
      ),
    );
  }
}
