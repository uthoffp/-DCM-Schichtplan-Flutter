import 'package:flutter/material.dart';

class TimeFragment extends StatefulWidget {
  const TimeFragment(this.type, {Key? key}) : super(key: key);

  final String type;
  @override
  State<TimeFragment> createState() => _TimeFragmentState();
}

class _TimeFragmentState extends State<TimeFragment> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Center(child: Text(widget.type, style: textTheme.headline6));
  }
}