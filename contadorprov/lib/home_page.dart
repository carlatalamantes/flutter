import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter V2'),
        ),
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: const Text(
                    'Foreground Text',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(onPressed: (() => {}), child: Text('Black')),
                TextButton(onPressed: (() => {}), child: Text('Red')),
                TextButton(onPressed: (() => {}), child: Text('Blue')),
                TextButton(onPressed: (() => {}), child: Text('Green'))
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: (() {}), icon: Icon(Icons.add_circle)),
                IconButton(onPressed: (() {}), icon: Icon(Icons.remove)),
                IconButton(onPressed: (() {}), icon: Icon(Icons.restart_alt))
              ],
            )
          ],
        ),
      ),
    );
  }
}
