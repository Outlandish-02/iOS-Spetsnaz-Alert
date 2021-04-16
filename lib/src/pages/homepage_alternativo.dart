import 'package:flutter/material.dart';

class HomePageAlternativo extends StatelessWidget {

  final opciones = ['Uno','Dos','Tres','Cuatro','Cinco', 'Seis','Siete','Ocho'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listTile'),
      ),
      body: ListView(
        children: _crearItemsCorto()
      ),
    );
  }

  List <Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();// Lista dinamica sin tamaño
    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      //lista.add(tempWidget);
      //lista.add(Divider());
      lista..add(tempWidget)
          ..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorto() {
    return opciones.map((item){
      return Column(children: [
        ListTile(
          title: Text(item+'*'),
          subtitle: Text('Lista dinamica 2'),
          leading: Icon(Icons.account_balance_wallet),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){},       
        ),
        Divider()
      ],
      );
    }).toList();
  }
}