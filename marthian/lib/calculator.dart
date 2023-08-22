import 'package:flutter/material.dart';
import 'package:marthian/constants.dart';
import 'package:math_expressions/math_expressions.dart';

final normalShape = RoundedRectangleBorder(
  borderRadius:
      BorderRadius.circular(20.0), // Radio de las esquinas igual a cero
  side: const BorderSide(
      color: Colors.black, width: 2.0), // Color, ancho y estilo del borde
);

class CalculatorApplication extends StatefulWidget {
  const CalculatorApplication({super.key});

  @override
  State<CalculatorApplication> createState() => _CalculatorApplicationState();
}

class _CalculatorApplicationState extends State<CalculatorApplication> {
  var result = '0';
  var inputUser = '';

  void buttonPressed(String text) {
    setState(() {
      inputUser = inputUser + text;
    });
  }

  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {
            if (text1 == 'AC') {
              setState(() {
                inputUser = '';
                result = '0';
              });
            } else {
              buttonPressed(text1);
            }
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text1),
          padding: const EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                0.0), // Radio de las esquinas igual a cero
            side: const BorderSide(
                color: Colors.black,
                width: 2.0), // Color, ancho y estilo del borde
          ),
          child: Text(
            text1,
            style: TextStyle(
                color: getTextColor(text1),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            if (text2 == '⌫') {
              setState(() {
                if (inputUser.isNotEmpty) {
                  inputUser = inputUser.substring(0, inputUser.length - 1);
                }
              });
            } else {
              buttonPressed(text2);
            }
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text2),
          padding: const EdgeInsets.all(20.0),
          shape: normalShape,
          child: Text(
            text2,
            style: TextStyle(
                color: getTextColor(text2),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            buttonPressed(text3);
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text3),
          padding: const EdgeInsets.all(20.0),
          shape: normalShape,
          child: Text(
            text3,
            style: TextStyle(
                color: getTextColor(text3),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            if (text4 == '=') {
              Parser parser = Parser();
              Expression expression = parser.parse(inputUser);
              ContextModel contextModel = ContextModel();
              double eval =
                  expression.evaluate(EvaluationType.REAL, contextModel);

              setState(() {
                result = eval.toString();
              });
            } else {
              buttonPressed(text4);
            }
          },
          elevation: 2.0,
          fillColor: kAmber,
          padding: const EdgeInsets.all(15.0),
          shape: normalShape,
          child: Text(
            text4,
            style: const TextStyle(
                fontSize: 40, color: kWhite, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        inputUser,
                        style: const TextStyle(
                          color: kLightGray,
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '=',
                        style: TextStyle(
                          color: kLightGray,
                          fontSize: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          result,
                          style: const TextStyle(
                            color: kWhite,
                            fontSize: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 5,
                ),
                getRow('AC', '⌫', '/', '*'),
                getRow('7', '8', '9', '-'),
                getRow('4', '5', '6', '+'),
                getRow('1', '2', '3', '+'),
                getRow('00', '0', '.', '='),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bool isOprator(String text) {
    var list = ['AC', '⌫', '%'];

    for (var item in list) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOprator(text)) {
      return kLightGray;
    } else {
      return kDarkGray;
    }
  }

  bool textOprator(String text) {
    var list = ['AC', '⌫', '%'];

    for (var item in list) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getTextColor(String text) {
    if (isOprator(text)) {
      return Colors.black;
    } else {
      return kWhite;
    }
  }
}
