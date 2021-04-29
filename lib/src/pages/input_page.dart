import 'package:flutter/material.dart';

class InputPage extends StatefulWidget{
  @override 
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>{
  String valor, _nombre;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      title: Text('Inputs personalizados'),
    ),
    body:ListView(
      padding:EdgeInsets.symmetric(horizontal:8.0,vertical: 8.0),
      children: <Widget>[
        _crearInput(),
        _repintar(),
      ]
    ),
    );
  }

  Widget _crearInput(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('caracteres 0'),
        hintText: 'Nombres completo',
        labelText: 'Nombre',
        helperText: 'solo letras',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(20.0)
        ),

      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _repintar(){
    return ListTile(
      title: Text('Su nombre es: $_nombre'),
    );
  }
}