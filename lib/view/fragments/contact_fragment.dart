import 'package:dcm_flutter/resources/strings.dart';
import 'package:flutter/material.dart';

class ContactFragment extends StatefulWidget {
  const ContactFragment({Key? key}) : super(key: key);

  @override
  State<ContactFragment> createState() => _ContactFragmentState();
}

class _ContactFragmentState extends State<ContactFragment> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Center(child: Text(Strings.menuContact, style: textTheme.headline6));
  }
}