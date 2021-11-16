import 'package:dcm_flutter/resources/strings.dart';
import 'package:flutter/material.dart';

class ClockingFragment extends StatefulWidget {
  const ClockingFragment({Key? key}) : super(key: key);

  @override
  State<ClockingFragment> createState() => _ClockingFragmentState();
}

class _ClockingFragmentState extends State<ClockingFragment> {
  void _onPressedComes() {}

  void _onPressedGoes() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 1.5,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("01. Januar 1900"),
                      Text("00:00 Uhr"),
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Divider(height: 1, thickness: 1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black,
                        onPressed: _onPressedComes,
                        child: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.black,
                        onPressed: _onPressedGoes,
                        child: const Icon(Icons.arrow_back_ios_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(Strings.txtComes),
                      Text(Strings.txtGoes),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(Strings.txtTop10, style: textTheme.headline2))
            ],
          ),
        )
      ],
    ));
  }
}
