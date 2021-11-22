import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/view/pages/main_page.dart';
import 'package:dcm_flutter/view/widgets/drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _companySelectController = TextEditingController();

  void _login() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return MainPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    bool _isLoading = false;
    bool _pwVisible = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName + " Login"),
      ),
      body: Column(children: [
        Visibility(
          child: const LinearProgressIndicator(),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: _isLoading,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(Strings.txtCompany, style: textTheme.headline2),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Hotel in Focus", style: textTheme.headline3),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Kundennr.: 47110815", style: textTheme.headline3),
              ),
              const SizedBox(height: 24),
              DropDownInputField(
                controller: _companySelectController,
                hint: Strings.hintCompany,
                onChanged: () => setState(() {
                  _companySelectController.text;
                }),
                options: const ["Company 1", "Company 2"],
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  labelText: Strings.hintPwConfirm,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: Strings.hintPwConfirm,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: _pwVisible,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: Strings.hintPwConfirm,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: Strings.hintPwConfirm,
                  prefixIcon: const Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _pwVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _pwVisible = !_pwVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text(Strings.btnLogin,
                      style: TextStyle(fontSize: 18)),
                ),
                alignment: Alignment.centerRight,
              )
            ],
          )
        )
      ]),
    );
  }
}
