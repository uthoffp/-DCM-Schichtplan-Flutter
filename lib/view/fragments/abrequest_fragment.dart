import 'package:dcm_flutter/resources/strings.dart';
import 'package:flutter/material.dart';

class AbRequestFragment extends StatefulWidget {
  const AbRequestFragment({Key? key}) : super(key: key);

  @override
  State<AbRequestFragment> createState() => _AbRequestFragmentState();
}

class _AbRequestFragmentState extends State<AbRequestFragment> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Center(child: Text(Strings.menuAbRequest, style: textTheme.headline6));
  }
}