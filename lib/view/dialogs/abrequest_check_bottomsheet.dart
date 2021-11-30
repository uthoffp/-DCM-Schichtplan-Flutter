import 'package:dcm_flutter/repositories/model/request_days.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/view/widgets/message.dart';
import 'package:dcm_flutter/viewmodel/abrequest_viewmodel.dart';
import 'package:flutter/material.dart';

class AbRequestCheckBottomSheet extends StatefulWidget {
  final AbRequestViewModel _viewModel;

  AbRequestCheckBottomSheet(this._viewModel);

  static Future<dynamic> show(BuildContext context, AbRequestViewModel viewModel) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (context) {
          return AbRequestCheckBottomSheet(viewModel);
        });
  }

  @override
  State<AbRequestCheckBottomSheet> createState() => _AbRequestCheckBottomSheetState();
}

class _AbRequestCheckBottomSheetState extends State<AbRequestCheckBottomSheet> {
  RequestDays _requestDays =
      RequestDays(open: 0, corrections: 0, prevYear: 0, remaining: 0, taken: 0, thisRequest: 0, thisYear: 0, total: 0);

  @override
  void initState() {
    super.initState();
    widget._viewModel.getRequestDays().then((value) {
      setState(() {
        _requestDays = widget._viewModel.adjustRequestDays(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
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
                    Align(alignment: Alignment.centerLeft, child: Text(_requestDays.prevYear.toString())),
                    const SizedBox(height: 8),
                    Align(alignment: Alignment.centerLeft, child: Text(_requestDays.thisYear.toString())),
                    const SizedBox(height: 8),
                    Align(alignment: Alignment.centerLeft, child: Text(_requestDays.total.toString())),
                    const SizedBox(height: 8),
                    Align(alignment: Alignment.centerLeft, child: Text(_requestDays.corrections.toString())),
                    const SizedBox(height: 8),
                    Align(alignment: Alignment.centerLeft, child: Text(_requestDays.taken.toString())),
                    const SizedBox(height: 8),
                    Align(alignment: Alignment.centerLeft, child: Text(_requestDays.open.toString())),
                    const SizedBox(height: 8),
                    Align(alignment: Alignment.centerLeft, child: Text(_requestDays.thisRequest.toString())),
                    const SizedBox(height: 8),
                    Align(alignment: Alignment.centerLeft, child: Text(_requestDays.remaining.toString())),
                  ],
                )),
              ],
            ),
            const SizedBox(height: 16),
            Align(alignment: Alignment.centerLeft, child: Text(Strings.txtHolidayResult)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => {
                widget._viewModel
                    .sendAbRequest()
                    .then((_) => Navigator.of(context).pop())
                    .onError((error, stackTrace) => Message.show(context, "Error sending Request."))
              },
              child: const Text(Strings.btnSendRequest, style: TextStyle(fontSize: 18)),
            ),
          ],
        ));
  }
}
