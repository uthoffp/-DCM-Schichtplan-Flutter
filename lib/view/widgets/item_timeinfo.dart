import 'package:dcm_flutter/repositories/model/time_info.dart';
import 'package:dcm_flutter/viewmodel/time_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//list item to display shifts etc. for the Dienstplan and Ist-Zeiten fragments
class TimeInfoItem extends StatelessWidget {
  final TimeInfo _timeInfo;

  TimeInfoItem(this._timeInfo);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText2;

    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Align(alignment: Alignment.center, child: Text(_timeInfo.getDate(), style: textStyle))),
              Expanded(
                  child: Column(
                children: [
                  Text(_timeInfo.startTime1 != null ? "${_timeInfo.startTime1} - ${_timeInfo.endTime1}" : "",
                      style: textStyle),
                  Text(TimeViewModel.getShift1Dep(_timeInfo), style: textStyle),
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Text(_timeInfo.startTime2 != null ? "${_timeInfo.startTime1} - ${_timeInfo.endTime1}" : "",
                      style: textStyle),
                  Text(TimeViewModel.getShift1Dep(_timeInfo), style: textStyle),
                ],
              ))
            ],
          ),
        ),
        const Divider()
      ],
    ));
  }
}
