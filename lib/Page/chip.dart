import 'dart:ffi';

import 'package:flutter/material.dart';

class ChipPage extends StatefulWidget {
  const ChipPage({Key? key}) : super(key: key);

  @override
  State<ChipPage> createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  bool x = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Theme Chips Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            FilterChip(
              selected: x,
              label: const Text('Input 1'),
              onSelected: (bool x) {
                x = !x;
              },
            ),
            InputChip(
              avatar: const Icon(Icons.card_giftcard),
              label: const Text('Input 2'),
              onSelected: (bool value) {},
            ),
            InputChip(
              avatar: const Icon(Icons.credit_card),
              label: const Text('Input 3'),
              onSelected: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}
