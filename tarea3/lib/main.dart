import 'package:flutter/material.dart';
import 'package:tarea3/app/Searchpage.dart';
import 'package:provider/provider.dart';
import 'app/bookprovider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookProvider()),
      ],
      child: Searchpage(
        title: 'Librería free to play',
      ),
    ));
  }
}
