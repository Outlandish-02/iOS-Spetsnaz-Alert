import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // nos servirá para agregar elementos (imagenes a nuestro listView)
  List<int> _ListaNumeros = new List();

  int _ultimoItem = 0;

  bool _isLoading = false;

  bool _blurred = false;
  bool _gray = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if (_ListaNumeros.length < 10) if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listas')),
      body: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <OutlinedButton>[
                  OutlinedButton(
                      child: Text('Normal'),
                      onPressed: () {
                        setState(() {
                          _blurred = false;
                          _gray = false;
                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      )),
                  OutlinedButton(
                      child: Text('Gray'),
                      onPressed: () {
                        setState(() {
                          _blurred = false;
                          _gray = true;
                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      )),
                  OutlinedButton(
                      child: Text('Blurred'),
                      onPressed: () {
                        setState(() {
                          _blurred = true;
                          _gray = false;
                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ))
                ],
              )),
          _crearLista(),
          _crearLoading()
        ],
      ),
    );
  }

  Widget _crearLista() {
    return Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView.builder(
          controller: _scrollController,
          itemCount:
              _ListaNumeros.length, //Cantidad de items que se desea cargar
          itemBuilder: (BuildContext context, int index) {
            final imagen = _ListaNumeros[index];
            if (_blurred)
              return FadeInImage(
                image: NetworkImage(
                    'https://picsum.photos/id/$imagen/500/300/?blur'),
                placeholder: AssetImage('assets/jar-loading.gif'),
              );
            if (_gray)
              return FadeInImage(
                image: NetworkImage(
                    'https://picsum.photos/id/$imagen/500/300/?grayscale'),
                placeholder: AssetImage('assets/jar-loading.gif'),
              );

            return FadeInImage(
              image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            );
          },
        ));
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duracion = new Duration(seconds: 3);
    return new Timer(duracion, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 150,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      //_ultimoItem++;
      _ListaNumeros.add(_ultimoItem++);
      setState(() {});
    }
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
        ],
      );
    }
    return Container();
  }
}
