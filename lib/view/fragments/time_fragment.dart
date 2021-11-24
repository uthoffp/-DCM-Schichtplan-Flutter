import 'package:dcm_flutter/repositories/model/time_info.dart';
import 'package:dcm_flutter/repositories/model/user.dart';
import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/view/widgets/item_timeinfo.dart';
import 'package:dcm_flutter/viewmodel/time_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TimeFragment extends StatefulWidget {
  final User _user;
  final String type;

  const TimeFragment(this.type, this._user, Key? key) : super(key: key);

  @override
  State<TimeFragment> createState() => _TimeFragmentState(_user, type);
}

class _TimeFragmentState extends State<TimeFragment> {
  final _user;
  final _type;
  TimeViewModel? _viewModel;

  List<TimeInfo> _times = [];
  var _date = DateTime.now();
  final _dateController = TextEditingController();

  _TimeFragmentState(this._user, this._type);

  void _onClickPrevWeek() {
    _date = _date.add(const Duration(days: -7));
    _viewModel!.getTimes(_date);
    setState(() {
      _dateController.text = DateFormat('dd.MM.yyyy').format(_date);
    });
  }

  void _onClickNextWeek() {
    _date = _date.add(const Duration(days: 7));
    _viewModel!.getTimes(_date);
    setState(() {
      _dateController.text = DateFormat('dd.MM.yyyy').format(_date);
    });
  }

  void _openDatePicker() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Datum auswählen.',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
        _dateController.text = DateFormat('dd.MM.yyyy').format(_date);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _viewModel = TimeViewModel(_user, _type);
    _viewModel!.getTimes(_date);
    _viewModel!.times.stream.listen((value) {
      setState(() {
        _times = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    _dateController.text = DateFormat('dd.MM.yyyy').format(_date);

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: _onClickPrevWeek,
                mini: true,
                child: const Icon(Icons.arrow_back_ios_rounded),
              ),
              SizedBox(
                width: 220,
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: _openDatePicker,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: Strings.hintFirstDayOfWeek,
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder()),
                ),
              ),
              FloatingActionButton(
                onPressed: _onClickNextWeek,
                mini: true,
                child: const Icon(Icons.arrow_forward_ios_rounded),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          child: Text(Strings.txtDate, style: textTheme.headline2),
                          alignment: Alignment.center,
                        ))),
              ),
              Expanded(
                child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          child: Text(Strings.txtShift1, style: textTheme.headline2),
                          alignment: Alignment.center,
                        ))),
              ),
              Expanded(
                child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          child: Text(Strings.txtShift2, style: textTheme.headline2),
                          alignment: Alignment.center,
                        ))),
              ),
            ],
          ),
          Expanded(child: Container(child: Card(
            child: ListView(
              children: _times.map((timeInfo) => TimeInfoItem(timeInfo)).toList(),
            ),
          ), width: 500))
        ],
      ),
    );
  }
}
