import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'is715773 Tarea',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool upIsPressed = false;
  bool downIsPressed = false;
  int likeCounter = 0;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Tarea 2'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/iteso.jpg"),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ITESO, Universidad Jesuita de Guadalajara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "San Pedro Tlaquepaque, Jal.",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: upIsPressed ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () {
                              upIsPressed = !upIsPressed;
                              likeCounter++;
                              setState(() {});
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                              color: downIsPressed ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              downIsPressed = !downIsPressed;
                              likeCounter--;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Text("$likeCounter"),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.mail,
                        ),
                        iconSize: 45,
                        onPressed: () {
                          _scaffoldKey.currentState.removeCurrentSnackBar();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Enviando correo..."),
                            ),
                          );
                          setState(() {});
                        },
                      ),
                      Text("Correo"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.call,
                        ),
                        iconSize: 45,
                        onPressed: () {
                          _scaffoldKey.currentState.removeCurrentSnackBar();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Relizando llamada..."),
                            ),
                          );
                          setState(() {});
                        },
                      ),
                      Text("Llamar"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.directions,
                        ),
                        iconSize: 45,
                        onPressed: () {
                          _scaffoldKey.currentState.removeCurrentSnackBar();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Mostrando Ruta..."),
                            ),
                          );
                          setState(() {});
                        },
                      ),
                      Text("Ruta"),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Text(
                  "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas."),
            ),
            IconButton(
              icon: Icon(
                Icons.check_circle,
              ),
              iconSize: 30,
              onPressed: () {
                if (likeCounter % 2 == 0) {
                  _dialogoPar();
                } else {
                  _dialogoImpar();
                }

                setState(() {});
              },
            ),
            Text("Revisar likes"),
          ],
        ),
      ),
    );
  }

  _dialogoPar() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Par!"),
              content: Text("El contador de likes es par"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  _dialogoImpar() {
    showDialog(
        context: context,
        builder: (_) =>  AlertDialog(
              title:  Text("Impar!"),
              content:  Text("${DateTime.now()}"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
