import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/app/Detailspage.dart';
import 'bookprovider.dart';

class Searchpage extends StatelessWidget {
  Searchpage({Key? key, required this.title}) : super(key: key);

  final String title;
  final bookTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.black38,
        ),
        body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: bookTitle,
                  decoration: InputDecoration(
                    hintText: 'Ingresa título',
                    suffixIcon: IconButton(
                      onPressed: () async => {
                        await context
                            .read<BookProvider>()
                            .onSearch(this.bookTitle.value.text),
                      },
                      icon: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                (context.watch<BookProvider>().result['totalItems'] != null &&
                        context.watch<BookProvider>().result['totalItems'] >= 1
                    ? Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 8.0,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(20),
                          children: List<Widget>.generate(
                            (context
                                            .watch<BookProvider>()
                                            .result['totalItems'] !=
                                        null &&
                                    context
                                            .watch<BookProvider>()
                                            .result['totalItems'] >=
                                        1
                                ? context
                                    .watch<BookProvider>()
                                    .result['items']
                                    .length
                                : 0),
                            (index) => GestureDetector(
                              onTap: () {
                                var tapped_book = context
                                    .read<BookProvider>()
                                    .result['items'][index];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detailspage(
                                              title: 'Detalles del libro',
                                              book: tapped_book,
                                            )));
                              },
                              child: Container(
                                constraints: new BoxConstraints.expand(
                                  height: 350.0,
                                ),
                                alignment: Alignment.bottomLeft,
                                padding: new EdgeInsets.only(
                                    left: 16.0, bottom: 8.0),
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: NetworkImage(
                                        "https://www.mswordcoverpages.com/wp-content/uploads/2018/10/Book-cover-page-3-CRC.png"),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                child: Text(
                                    "${context.read<BookProvider>().result['items'][index]['volumeInfo']['title']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        backgroundColor: Colors.white54)),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ingrese para buscar un libro'),
                            ]),
                      ))
              ],
            )));
  }
}
