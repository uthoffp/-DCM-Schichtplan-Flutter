import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/viewmodel/abrequest_viewmodel.dart';
import 'package:flutter/material.dart';

class AbRequestCheckBottomSheet {
  final AbRequestViewModel _viewModel;

  AbRequestCheckBottomSheet(this._viewModel);

  Future<dynamic> show(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Strings.txtHolidayHead,
                        style: textTheme.headline6,
                      )),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: const [
                          Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayPrevYear)),
                          SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayThisYear)),
                          SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayTotal)),
                          SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayCorrections)),
                          SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayTaken)),
                          SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayOpen)),
                          SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayRequest)),
                          SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayRemaining)),
                          SizedBox(height: 8),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Align(alignment: Alignment.centerLeft, child: Text("0,0")),
                          const SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text("0,0")),
                          const SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text("0,0")),
                          const SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text("0,0")),
                          const SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text("0,0")),
                          const SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text("0,0")),
                          const SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text("0,0")),
                          const SizedBox(height: 8),
                          Align(alignment: Alignment.centerLeft, child: Text("0,0")),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayResult)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => {
                      _viewModel
                          .sendAbRequest()
                          .then((value) => Navigator.pop(context, true))
                          .onError((error, stackTrace) {})
                    },
                    child: const Text(Strings.btnSendRequest, style: TextStyle(fontSize: 18)),
                  ),
                ],
              ));
        });
  }
}
