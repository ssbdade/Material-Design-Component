import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      title: const Text('Title'),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 1; i <= 3; i++)
            ListTile(
              title: Text(
                'option $i',
              ),
              leading: Radio(
                value: i,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ACTION 1'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ACTION 2'),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            showDialog<void>(context: context, builder: (context) => dialog);
          },
          child: const Text("SHOW DIALOG"),
        ),
      ),
    );
  }
}
