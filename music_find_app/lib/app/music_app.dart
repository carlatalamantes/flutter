import 'package:flutter/material.dart';
import 'package:music_find_app/ui/home_page.dart';

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Music App',
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Homepage(title: 'Homepage'));
  }
}
