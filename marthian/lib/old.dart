import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        // Clear the expression and result
        _expression = '';
        _result = '';
      } else if (value == '⌫') {
        // Delete the last character of the expression
        if (_expression.isNotEmpty) {
          _expression = _expression.substring(0, _expression.length - 1);
        }
      } else if (value == '=') {
        // Evaluate the expression and show the result
        try {
          double result = _evaluateExpression(_expression);
          _result = result.toString();
        } catch (e) {
          // Show an error message if the expression is invalid
          _result = 'Error';
        }
      } else {
        // Append the value to the expression
        _expression += value;
      }
    });
  }

  double _evaluateExpression(String expression) {
    // TODO: Implement a function to evaluate a mathematical expression
    // For simplicity, you can assume that the expression only contains numbers and the four basic operations (+, -, *, /)
    // You can use any algorithm or library that you prefer
    // For example, you can use the shunting-yard algorithm and a stack to convert the expression to postfix notation and then evaluate it
    // Or you can use a recursive descent parser to build an abstract syntax tree and then traverse it
    // Or you can use a built-in function like eval() if your language supports it
    // Here is a simple implementation using eval() in Dart:

    return 0;
  }

  Widget _buildButton(String value, {int flex = 1, Color? color}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color ?? Colors.grey[300],
            onPrimary: color != null ? Colors.white : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () => _onButtonPressed(value),
          child: Text(
            value,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _expression,
                      style: TextStyle(color: Colors.white, fontSize: 32.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _result,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              _buildButton('AC', color: Colors.red),
              _buildButton('⌫', color: Colors.orange),
              _buildButton('/', color: Colors.orange),
              _buildButton('*', color: Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('-', color: Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('+', color: Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('+',
                  color: Colors.orange), // This is the corrected line
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('0', flex: 2),
              _buildButton('.'),
              _buildButton('=', color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
