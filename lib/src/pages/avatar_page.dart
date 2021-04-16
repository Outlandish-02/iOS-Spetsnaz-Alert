import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SN'),
              backgroundColor: Colors.red,
            ),
          ),
          // Container(
          //  padding: EdgeInsets.all(5.0),
          //  child: CircleAvatar(
          //    backgroundImage: NetworkImage(
          //      'https://www.bugatti.com/fileadmin/_processed_/sei/p572/se-image-a712633835c1906fd3e81f80d38fbaa7.webp'),
          //  radius: 25,
          //),
          //),
        ],
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://pm1.narvii.com/7790/c891d84d27490785161b9b61de992abc2b274cc8r1-564-564v2_uhq.jpg'),
                    radius: 110,
                  ),
                  SizedBox(height: 25),
                  Stack(
                    children: <Widget>[
                      Column(
                        children: <Row>[
                          Row(
                            children: <Expanded>[
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  'Nombre: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Text(
                                'Gawr Gura',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ))
                            ],
                          ),
                          Row(
                            children: <Expanded>[
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  'Plataforma: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Text(
                                'Hololive',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ))
                            ],
                          ),
                          Row(
                            children: <Expanded>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Text(
                                    'SHAAAAAAAAAAAAAAAAAAAAARK',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ])),
      ),
    );
  }
}
