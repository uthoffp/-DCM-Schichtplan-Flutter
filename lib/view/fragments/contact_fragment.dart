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

    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Company Name", style: textTheme.headline5)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Company Street", style: textTheme.headline5)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Company City", style: textTheme.headline5)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Company Phone", style: textTheme.headline5)),
          ),
        ]));
  }
}
