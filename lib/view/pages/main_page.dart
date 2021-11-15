import 'package:dcm_flutter/resources/strings.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedDestination = 0;

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
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
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text(Strings.menuPlanned),
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(0),
            ),
            ListTile(
              leading: const Icon(Icons.access_alarm),
              title: const Text(Strings.menuClocking),
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
            ),
            ListTile(
              leading: const Icon(Icons.attach_email),
              title: const Text(Strings.menuAbRequest),
              selected: _selectedDestination == 2,
              onTap: () => selectDestination(2),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text(Strings.menuActual),
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(3),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text(Strings.menuContact),
              selected: _selectedDestination == 4,
              onTap: () => selectDestination(4),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key),
              title: const Text(Strings.menuPwChange),
              selected: _selectedDestination == 5,
              onTap: () => selectDestination(5),
            ),
            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: const Text(Strings.menuLogout),
              selected: _selectedDestination == 6,
              onTap: () => logout(),
            ),
          ],
        ),
      ),
      body: Center(child: Text("Test", style: textTheme.headline6)),
    );
  }
}
