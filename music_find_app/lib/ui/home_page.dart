import 'package:flutter/material.dart';
import 'package:music_find_app/ui/favorites_page.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Favorites'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Favoritespage(title: 'Favorites')),
            );
          },
        ),
      ),
    );
  }
}
