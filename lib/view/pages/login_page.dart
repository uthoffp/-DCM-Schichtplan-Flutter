import 'package:dcm_flutter/resources/strings.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(children: [
        Text(_companySelectController.text),
        DropDownInputField(
          controller: _companySelectController,
          hint: Strings.hintCompany,
          onChanged: () => setState(() {
            _companySelectController.text;
          }),
          options: ["Company 1", "Company 2"],
        )
      ]),
    );
  }
}
