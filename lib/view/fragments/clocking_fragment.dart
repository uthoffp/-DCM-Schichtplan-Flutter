import 'package:dcm_flutter/resources/strings.dart';
import 'package:flutter/material.dart';

class ClockingFragment extends StatefulWidget {
  const ClockingFragment({Key? key}) : super(key: key);

  @override
  State<ClockingFragment> createState() => _ClockingFragmentState();
}

class _ClockingFragmentState extends State<ClockingFragment> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Center(child: Text(Strings.menuClocking, style: textTheme.headline6));
  }
}