import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/view/fragments/abrequest_fragment.dart';
import 'package:dcm_flutter/view/fragments/clocking_fragment.dart';
import 'package:dcm_flutter/view/fragments/contact_fragment.dart';
import 'package:dcm_flutter/view/fragments/pwchange_fragment.dart';
import 'package:dcm_flutter/view/fragments/time_fragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedDestination = 0;
  Widget _contentWidget = TimeFragment(Strings.menuPlanned);

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
      switch (index) {
        case 0:
          _contentWidget = TimeFragment(Strings.menuPlanned);
          break;
        case 1:
          _contentWidget = ClockingFragment();
          break;
        case 2:
          _contentWidget = AbRequestFragment();
          break;
        case 3:
          _contentWidget = TimeFragment(Strings.menuActual);
          break;
        case 4:
          _contentWidget = ContactFragment();
          break;
        case 5:
          _contentWidget = PwChangeFragment();
          break;
        case 6:
          logout();
          break;
      }
      Navigator.of(context).pop();
    });
  }

  void logout() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 8),
              child: Text(
                Strings.appName,
                style: textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                'Max Mustermann',
                style: textTheme.headline6,
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            navDrawerItem(
                context, Icons.calendar_today, Strings.menuPlanned, 0),
            navDrawerItem(context, Icons.access_alarm, Strings.menuClocking, 1),
            navDrawerItem(
                context, Icons.attach_email, Strings.menuAbRequest, 2),
            navDrawerItem(context, Icons.calendar_today, Strings.menuActual, 3),
            navDrawerItem(context, Icons.contact_mail, Strings.menuContact, 4),
            const Divider(height: 1, thickness: 1),
            navDrawerItem(context, Icons.vpn_key, Strings.menuPwChange, 5),
            navDrawerItem(
                context, Icons.power_settings_new, Strings.menuLogout, 6),
          ],
        ),
      ),
      body: _contentWidget,
    );
  }

  Widget navDrawerItem(
      BuildContext context, IconData icon, String text, int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        leading: Icon(icon),
        dense: true,
        title: Text(text),
        selected: _selectedDestination == index,
        selectedTileColor: Theme.of(context).colorScheme.primaryVariant,
        onTap: () => selectDestination(index),
      ),
    );
  }
}
