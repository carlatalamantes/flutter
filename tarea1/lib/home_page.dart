import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color _iconColor1 = Colors.black;
  Color _iconColor2 = Colors.black;
  Color _iconColor3 = Colors.black;
  Color _iconColor4 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mc Flutter'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  size: 50,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(children: [
                    Text(
                      'Flutter McFlutter',
                      style: TextStyle(fontSize: 23),
                    ),
                    Text(
                      'Experienced App Developer',
                    )
                  ]),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('123 Main Street'), Text('(415) 555-0198')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text('Únete a un club con otras personas'),
                            backgroundColor: Colors.blue,
                          ));
                        setState(() {
                          if (_iconColor1 == Colors.black) {
                            _iconColor1 = Colors.lightBlue;
                          } else {
                            _iconColor1 = Colors.black;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.person,
                        color: _iconColor1,
                      ),
                      iconSize: 40,
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text(
                                'Cuenta regresiva para el evento: 31 días'),
                            backgroundColor: Colors.blue,
                          ));
                        setState(() {
                          if (_iconColor2 == Colors.black) {
                            _iconColor2 = Colors.lightBlue;
                          } else {
                            _iconColor2 = Colors.black;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.timer,
                        color: _iconColor2,
                      ),
                      iconSize: 40,
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text('Llama al número 4155550198'),
                            backgroundColor: Colors.blue,
                          ));
                        setState(() {
                          if (_iconColor3 == Colors.black) {
                            _iconColor3 = Colors.lightBlue;
                          } else {
                            _iconColor3 = Colors.black;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.settings_cell_sharp,
                        color: _iconColor3,
                      ),
                      iconSize: 40,
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text('Llama al celular 3317865113'),
                            backgroundColor: Colors.blue,
                          ));
                        setState(() {
                          if (_iconColor4 == Colors.black) {
                            _iconColor4 = Colors.lightBlue;
                          } else {
                            _iconColor4 = Colors.black;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.phone_android,
                        color: _iconColor4,
                      ),
                      iconSize: 40,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
