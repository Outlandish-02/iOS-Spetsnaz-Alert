import 'dart:math';

import 'package:flutter/material.dart';

class InputAnimatedPage extends StatefulWidget {
  @override
  _InputAnimatedPageState createState() => _InputAnimatedPageState();
}

class _InputAnimatedPageState extends State<InputAnimatedPage> {
  String _nombre;
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blueAccent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs personalizados'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _repintar(),
          _generarForma()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization
          .sentences, //Colocar la primera letra de la sentencia en mayuscula
      decoration: InputDecoration(
          counter: Text('Caracteres: '),
          hintText: 'Nombre completo',
          labelText: 'Nombre',
          helperText: 'Solo letras',
          suffixIcon: Icon(Icons.power_input_outlined), //icono a la derecha
          icon: Icon(Icons.account_circle), //icono a la izquierda

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0) //redondea el input
              )),

      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
        if (contador < 20)
          contador += 1;
        else
          contador = 0;
        _cambiarForma();
        print(contador);
      },
    );
  }

  Widget _generarForma() {
    return AnimatedContainer(
      width: _width,
      height: _height,
      decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
      duration: Duration(seconds: 1),
      curve: Curves.bounceInOut, //GENERA EL COMPORTAMIENTO DE LA ANIMACION
    );
  }

  _repintar() {
    return ListTile(title: Text('Su nombre es: $_nombre'));
  }

  void _cambiarForma() {
    final random = Random();

    setState(() {
      _width = random.nextInt(200).toDouble();
      _height = random.nextInt(200).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

      if (contador < 10) {
        _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      } else if (contador >= 10) {
        _borderRadius =
            BorderRadius.only(topLeft: Radius.elliptical(500.0, 200));
      }
    });
  }
}
