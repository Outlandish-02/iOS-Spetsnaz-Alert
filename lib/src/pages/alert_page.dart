import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SN'),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Alerta'),
          onPressed: () => _mostrarAlerta(context),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, shape: StadiumBorder()),
        ),
      ),
    );
  }

  _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible:
            true, //indica si puedes cerrar la alerta picando fuera de ella
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Avanzar a avatar'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      'https://www.pngkit.com/png/full/186-1866208_glados-is-a-potato-portal2-attack-on-titan.png'),
                  height: 200,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pushNamed('avatar')),
              FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}
