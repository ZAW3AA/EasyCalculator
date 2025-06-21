// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:easycalculate/widgets/calc.dart';
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  static const String routeName = "/calculate";

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculate",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  result,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Calc("C", onClear),
                  // ممكن تضيف 3 أزرار فاضية عشان تكمل 4 في الصف
                  Expanded(child: SizedBox()),
                  Expanded(child: SizedBox()),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Calc("7", onNumberClicked),
                  Calc("8", onNumberClicked),
                  Calc("9", onNumberClicked),
                  Calc("/", onOperatorClicked),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Calc("4", onNumberClicked),
                  Calc("5", onNumberClicked),
                  Calc("6", onNumberClicked),
                  Calc("*", onOperatorClicked),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Calc("1", onNumberClicked),
                  Calc("2", onNumberClicked),
                  Calc("3", onNumberClicked),
                  Calc("+", onOperatorClicked),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Calc(".", onNumberClicked),
                  Calc("0", onNumberClicked),
                  Calc("=", onEqual),
                  Calc("-", onOperatorClicked),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String calculateResult(String L, String op, String R) {
    int left = int.parse(L);
    int right = int.parse(R);
    int res = 0;

    if (op == "+") {
      res = left + right;
    } else if (op == "-") {
      res = left - right;
    } else if (op == "*") {
      res = left * right;
    } else if (op == "/") {
      if (right == 0) return "خطأ";
      res = left ~/ right;
    }

    return res.toString();
  }

  String RHS = "";
  String op = "";

  void onEqual(c) {
    if (RHS.isNotEmpty && result.isNotEmpty && op.isNotEmpty) {
      String LHS = result;
      result = calculateResult(RHS, op, LHS);
      RHS = "";
      op = "";
      setState(() {});
    }
  }

  void onOperatorClicked(c) {
    if (op.isEmpty) {
      RHS = result;
    } else {
      if (op == '=') {
        result = c;
      } else {
        String LHS = result;
        RHS = calculateResult(RHS, op, LHS);
      }
    }
    op = c;
    result = "";
    setState(() {});
  }

  void onNumberClicked(c) {
    if (result == "0" && c == "0") {
      return;
    } else {
      if (op == "=") {
        result = c;
        op = "";
      } else {
        result += c;
      }
    }
    setState(() {});
  }

  void onClear(c) {
    result = "";
    RHS = "";
    op = "";
    setState(() {});
  }
}
