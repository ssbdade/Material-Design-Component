import 'package:flutter/material.dart';

class CheckedBox extends StatefulWidget {
  CheckedBox({Key? key, required this.check, required this.i, required this.onchange})
      : super(key: key);
  final bool check;
  final int i;
  final Function(bool value) onchange;
  @override
  State<CheckedBox> createState() => _CheckedBoxState();
}

class _CheckedBoxState extends State<CheckedBox> {
  bool result = true;

  @override
  void initState() {
    super.initState();

    result = widget.check;
  }
  @override
  void didUpdateWidget(CheckedBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    result = widget.check;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          onChanged: (bool? value) {
            widget.onchange.call(value!);
            setState(() {
              result = value;
            });
          },
          value: result,
        ),
        Text(
          'Checkbox ${widget.i + 1}',
        ),
      ],
    );
  }
}
