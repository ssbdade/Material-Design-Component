import 'package:flutter/material.dart';

class CheckBoxesPage extends StatefulWidget {
  const CheckBoxesPage({Key? key}) : super(key: key);

  @override
  State<CheckBoxesPage> createState() => _CheckBoxesPageState();
}

class _CheckBoxesPageState extends State<CheckBoxesPage> {
  List<bool> checked = [true, true, false, false, true];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkboxes Demo'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            for (var i = 0; i < 5; i += 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (bool? value) {
                            setState(() {
                              checked[i] = value!;
                            });
                          },
                    value: checked[i],
                  ),
                  Text(
                    'Checkbox ${i + 1}',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
