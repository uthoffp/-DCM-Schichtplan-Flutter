import 'package:dcm_flutter/repositories/model/clocking_time.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/view/widgets/item_clocking.dart';
import 'package:dcm_flutter/view/widgets/message.dart';
import 'package:dcm_flutter/viewmodel/clocking_viewmodel.dart';
import 'package:flutter/material.dart';

class ClockingFragment extends StatefulWidget {
  final User _user;

  const ClockingFragment(this._user, {Key? key}) : super(key: key);

  @override
  State<ClockingFragment> createState() => _ClockingFragmentState();
}

class _ClockingFragmentState extends State<ClockingFragment> {
  ClockingViewModel? _viewModel;
  List<ClockingTime> _clockingTimes = [];

  void _onClockingPressed(int status) {
    if (_viewModel!.latestStatusEquals(status)) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: const Text(Strings.dialogClockingStatusAlert),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text(Strings.decline)),
                    TextButton(
                        onPressed: () {
                          _viewModel!.addClockingTime(status);
                          Navigator.pop(context, true);
                        },
                        child: const Text(Strings.accept)),
                  ],
                ));
      });
    } else {
      _viewModel!.addClockingTime(status);
    }
  }

  @override
  void initState() {
    super.initState();
    _viewModel = ClockingViewModel(widget._user);
    _viewModel!.getClockingTimes();
    _viewModel!.clockingTimes.stream.listen((value) {
      setState(() {
        _clockingTimes = value;
      });
    });
    _viewModel!.errorMessage.stream.listen((text) => Message.show(context, text));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            Card(
              elevation: 1.5,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: Align(alignment: Alignment.center, child: Text(_viewModel!.getCurrentDate()))),
                        Expanded(child: Align(alignment: Alignment.center, child: Text("${_viewModel!.getCurrentTime()} Uhr"))),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 16), child: Divider(height: 1, thickness: 1)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.black,
                          onPressed: () {
                            _onClockingPressed(1);
                          },
                          child: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.black,
                          onPressed: () {
                            _onClockingPressed(2);
                          },
                          child: const Icon(Icons.arrow_back_ios_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Expanded(child: Align(alignment: Alignment.center, child: Text(Strings.txtComes))),
                        Expanded(child: Align(alignment: Alignment.center, child: Text(Strings.txtGoes))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(alignment: Alignment.centerLeft, child: Text(Strings.txtTop10, style: textTheme.headline2)),
            const SizedBox(height: 8),
            Expanded(
                child: ListView(
                  children: _clockingTimes.map((clockingTime) => ClockingItem(clockingTime)).toList(),
                ))
          ],
        ));
  }
}
