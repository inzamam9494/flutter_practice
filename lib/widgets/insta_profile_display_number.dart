import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstaProfileDisplayNumber extends StatelessWidget {
  String count, label;
   InstaProfileDisplayNumber({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(
          fontWeight: FontWeight.w800
        ),),
        Text(label)
      ],
    );
  }
}
