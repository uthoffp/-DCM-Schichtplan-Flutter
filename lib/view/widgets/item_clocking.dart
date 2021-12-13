import 'package:dcm_flutter/repositories/model/clocking_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//list item to display clocking times
class ClockingItem extends StatelessWidget {
  final ClockingTime _clockingTime;

  ClockingItem(this._clockingTime);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText2;

    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Align(alignment: Alignment.center, child: Text(_clockingTime.getDate(), style: textStyle))),
            Expanded(
                child:
                    Align(alignment: Alignment.center, child: Text(_clockingTime.e_Time + " Uhr", style: textStyle))),
            Expanded(
                child: Align(alignment: Alignment.center, child: Text(_clockingTime.getStatus(), style: textStyle)))
          ],
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(8, 1, 8, 0),
          child: Divider(),
        )

      ],
    ));
  }
}
