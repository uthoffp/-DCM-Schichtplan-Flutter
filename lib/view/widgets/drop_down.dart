import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownInputField<T> extends StatefulWidget {
  final String hint;
  final List<T> options;
  final void Function()? onChanged;
  final TextEditingController controller;

  DropDownInputField({
    required this.hint,
    required this.options,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<DropDownInputField<T>> createState() => _DropDownInputFieldState<T>();
}

class _DropDownInputFieldState<T> extends State<DropDownInputField<T>> {
  bool _menuExpanded = false;

  void _openOptions() {
    setState(() {
      _menuExpanded = true;
    });
    showDialog(
        context: context,
        builder: (_) => SimpleDialog(children: [
              for (var i = 0; i < widget.options.length; i++)
                SimpleDialogOption(
                  onPressed: () =>
                      _onOptionSelected(widget.options[i].toString()),
                  child: Text(
                    widget.options[i].toString(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
            ])).then((_) => setState(() {
          _menuExpanded = false;
        }));
  }

  void _onOptionSelected(String text) {
    widget.controller.text = text;
    widget.onChanged!();
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      readOnly: true,
      onTap: _openOptions,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.hint,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: widget.hint,
          suffixIcon: Icon(
            _menuExpanded
                ? Icons.keyboard_arrow_down_rounded
                : Icons.keyboard_arrow_up_rounded,
            color: Colors.grey,
          )),
    );
  }
}
