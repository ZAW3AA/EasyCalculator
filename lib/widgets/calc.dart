// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Calc extends StatelessWidget {
  String c;
  Function onBtnClick;
  Calc(this.c, this.onBtnClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: Text(
          c,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          onBtnClick(c);
        },
      ),
    );
  }
}
