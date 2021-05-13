import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  double _valorSliderHeight = 100;

  bool _bloquearCheck = false;
  bool _bloquearSwitchWidth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSliderHeight(),
            Divider(),
            _crearSliderWidth(),
            Divider(),
            _crearCheck(),
            Divider(),
            _crearSwitch(),
            Divider(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  Widget _crearSliderWidth() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 0.0,
      max: 500.0,
      onChanged: (_bloquearSwitchWidth)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearSliderHeight() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de imagen',
      value: _valorSliderHeight,
      min: 0.0,
      max: 500.0,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSliderHeight = valor;
              });
            },
    );
  }

  Widget _crearCheck() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://static.wikia.nocookie.net/kill-la-kill/images/f/f0/Op_satsuki.jpg'),
      width: _valorSlider,
      height: _valorSliderHeight,
      fit: BoxFit.fill,
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Habilitar para Width'),
      value: _bloquearSwitchWidth,
      onChanged: (valor) {
        setState(() {
          _bloquearSwitchWidth = valor;
        });
      },
    );
  }
}
