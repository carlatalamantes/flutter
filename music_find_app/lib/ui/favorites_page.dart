import 'package:flutter/material.dart';

class Favoritespage extends StatefulWidget {
  Favoritespage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FavoritespageState createState() => _FavoritespageState();
}

class _FavoritespageState extends State<Favoritespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(child: Text("Favorites State")),
    );
  }
}
