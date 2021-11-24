import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/view/dialogs/pictureselect_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AbRequestFragment extends StatefulWidget {
  const AbRequestFragment({Key? key}) : super(key: key);

  @override
  State<AbRequestFragment> createState() => _AbRequestFragmentState();
}

class _AbRequestFragmentState extends State<AbRequestFragment> {
  bool _menuExpanded = false;
  bool _fileAttached = false;

  var _date = DateTime.now();
  final _dateController = TextEditingController();
  final _commentController = TextEditingController();

  void _openDatePicker() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2099, 12),
      helpText: 'Datum auswählen.',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
        _dateController.text = DateFormat('dd.MM.yyyy').format(_date);
      });
    }
  }

  void _checkRequest() {}

  void _onClickAttach(BuildContext parentContext) {}

  void _removeAttachment() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: Strings.hintAbType,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: Strings.hintAbType,
              suffixIcon: IconButton(
                icon: Icon(
                  _menuExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _menuExpanded = !_menuExpanded;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(Strings.txtStartDate, style: textTheme.headline2),
          ),
          Row(
            children: [
              Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: _openDatePicker,
                      textAlign: TextAlign.start,
                      decoration:
                          const InputDecoration(prefixIcon: Icon(Icons.calendar_today), border: OutlineInputBorder()),
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _menuExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _menuExpanded = !_menuExpanded;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(Strings.txtStopDate, style: textTheme.headline2),
          ),
          Row(
            children: [
              Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: _openDatePicker,
                      textAlign: TextAlign.start,
                      decoration:
                          const InputDecoration(prefixIcon: Icon(Icons.calendar_today), border: OutlineInputBorder()),
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _menuExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _menuExpanded = !_menuExpanded;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            keyboardType: TextInputType.text,
            maxLines: 5,
            minLines: 3,
            controller: _commentController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: Strings.hintComment,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: Strings.hintComment,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  PictureSelectBottomSheet.show(context);
                },
                icon: const Icon(Icons.attach_file, size: 18),
                label: const Text(Strings.btnAttach),
              ),
              const SizedBox(width: 16),
              Visibility(
                  visible: _fileAttached,
                  child: GestureDetector(onTap: _removeAttachment, child: const Text(Strings.btnRemoveAttachment)))
            ],
          ),
          const SizedBox(height: 8),
          Align(
            child: ElevatedButton.icon(
              onPressed: _checkRequest,
              icon: const Icon(Icons.save, size: 18),
              label: const Text(Strings.btnAbCheck, style: TextStyle(fontSize: 18)),
            ),
            alignment: Alignment.centerRight,
          )
        ],
      ),
    );
  }
}
