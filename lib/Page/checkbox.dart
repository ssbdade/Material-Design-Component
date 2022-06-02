import 'package:flutter/material.dart';
import 'package:material_design_component/resource/widgets/check_box_widget.dart';

class CheckBoxesPage extends StatefulWidget {
  const CheckBoxesPage(this.checked, {Key? key}) : super(key: key);
  final List<bool> checked;


  @override
  State<CheckBoxesPage> createState() => _CheckBoxesPageState();
}

class _CheckBoxesPageState extends State<CheckBoxesPage> {
  bool checkAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Checkboxes Demo'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null) {
                      checkAll = value;
                      for(int i = 0; i < 5; i++) {
                        widget.checked[i] = checkAll;
                      }
                    }
                  });
                },
                value: checkAll,
              ),
              Text(
                'Check all',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!,
              ),
            ],
          ),
          for(int i = 0; i < 5; i++)
            CheckedBox(check:widget.checked[i], i: i,onchange:  (value){
              widget.checked[i] = value;
              int count = 0;
              for(int i = 0; i < 5; i++) {
                if (widget.checked[i] == true) {
                  count++;
                }
              }
              if(count == 5) {
                setState(() {
                  checkAll = true;
                });
              }
              else {
                setState(() {
                  checkAll = false;
                });
              }
            })
        ],
      ),
    );
  }
}
