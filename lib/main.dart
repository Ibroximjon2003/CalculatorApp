import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = '0';
  String _output = "0";

  double num1 = 0;
  double num2 = 0;
  String operand = '';

  operation(String btnText) {
    if (btnText == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (btnText == '+' ||
        btnText == "-" ||
        btnText == "/" ||
        btnText == "x") {
      num1 = double.parse(output);
      operand = btnText;
      _output = "0";
    } else if (btnText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output = _output + btnText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  // button widget
  Widget button(String btnText) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.black, width: 2),
        fillColor: Colors.black12,
        padding: EdgeInsets.all(30),
        splashColor: Colors.red,
        child: Text(
          "$btnText",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          operation(btnText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator.apk",
      home: Scaffold(
        appBar: AppBar(
          title: Text("CALCULATOR (PORTFOLIO)"),
          backgroundColor: Colors.black12,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.black12,
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "$output",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  button("9"),
                  SizedBox(
                    width: 5,
                  ),
                  button("8"),
                  SizedBox(
                    width: 5,
                  ),
                  button("7"),
                  SizedBox(
                    width: 5,
                  ),
                  button("/"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("4"),
                  SizedBox(
                    width: 5,
                  ),
                  button("5"),
                  SizedBox(
                    width: 5,
                  ),
                  button("6"),
                  SizedBox(
                    width: 5,
                  ),
                  button("x"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("3"),
                  SizedBox(
                    width: 5,
                  ),
                  button("2"),
                  SizedBox(
                    width: 5,
                  ),
                  button("1"),
                  SizedBox(
                    width: 5,
                  ),
                  button("-"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("0"),
                  SizedBox(
                    width: 5,
                  ),
                  button("C"),
                  SizedBox(
                    width: 5,
                  ),
                  button("="),
                  SizedBox(
                    width: 5,
                  ),
                  button("+"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
