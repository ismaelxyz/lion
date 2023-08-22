import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtener el ancho de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black, // fondo negro
          appBar: null,
          body: Row(children: [
            Column(
              children: [
                // Row con los botones iniciales
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // TODO: implement AC functionality
                      },
                      child: Text('AC'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: implement ⌫ functionality
                      },
                      child: Text('⌫'),
                    ),
                    SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        // TODO: implement / functionality
                      },
                      child: Text('/'),
                    ),
                  ],
                ),
                Container(
                  // asignar el ancho de la pantalla al Container
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(9, (index) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: implement number functionality
                          },
                          child: Text('${9 - index}'), // número del 1 al 9
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(141, 38, 36, 36), // color de fondo
                            foregroundColor: Color.fromARGB(255, 164, 177, 245), // color de texto
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 117,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: implement AC functionality
                          },
                          child: Text('0'),
                        )),
                        SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: implement ⌫ functionality
                      },
                      child: Text('.'),
                    ),
                  ],
                )
              ],
            ),
            Column(children: [
              ElevatedButton(
                onPressed: () {
                  // TODO: implement * functionality
                },
                child: Text('*'),
              ),
              SizedBox(height: 23),
              ElevatedButton(
                onPressed: () {
                  // TODO: implement * functionality
                },
                child: Text('-'),
              ),
              SizedBox(height: 15),
              SizedBox(height: 80, child: ElevatedButton(
                onPressed: () {
                  // TODO: implement * functionality
                },
                child: Text('+'),
              )),
              SizedBox(height: 20),
              SizedBox(height: 65, child: ElevatedButton(
                onPressed: () {
                  // TODO: implement * functionality
                },
                child: Text('='),
              )),
            ])
          ])),
    );
  }
}
