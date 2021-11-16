import 'package:dcm_flutter/resources/strings.dart';
import 'package:flutter/material.dart';

class PwChangeFragment extends StatefulWidget {
  const PwChangeFragment({Key? key}) : super(key: key);

  @override
  State<PwChangeFragment> createState() => _PwChangeFragmentState();
}

class _PwChangeFragmentState extends State<PwChangeFragment> {
  bool _pwOldVisible = false;
  bool _pwNewVisible = false;
  bool _pwConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: _pwOldVisible,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: Strings.hintOldPw,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: Strings.hintOldPw,
                suffixIcon: IconButton(
                  icon: Icon(
                    _pwOldVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _pwOldVisible = !_pwOldVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: _pwNewVisible,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: Strings.hintPwNew,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: Strings.hintPwNew,
                suffixIcon: IconButton(
                  icon: Icon(
                    _pwNewVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _pwNewVisible = !_pwNewVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: _pwConfirmVisible,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: Strings.hintPwConfirm,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: Strings.hintPwConfirm,
                suffixIcon: IconButton(
                  icon: Icon(
                    _pwConfirmVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _pwConfirmVisible = !_pwConfirmVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {

                  });
                },
                icon: const Icon(Icons.save, size: 18),
                label: const Text(Strings.btnPwChange, style: TextStyle(fontSize: 18)),
              ),
              alignment: Alignment.centerRight,
            )

          ],
        ));
  }

  TextFormField passwordField(BuildContext context, bool pwVisible) {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: pwVisible,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: Strings.hintOldPw,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: Strings.hintOldPw,
        suffixIcon: IconButton(
          icon: Icon(
            pwVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              pwVisible = !pwVisible;
            });
          },
        ),
      ),
    );
  }
}
