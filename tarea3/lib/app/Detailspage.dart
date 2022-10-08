import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Detailspage extends StatefulWidget {
  Detailspage({Key? key, required this.title, required this.book})
      : super(key: key);

  final String title;
  final book;

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  bool fullDescription = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black38,
          actions: [
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () async => {
                      await Share.share('Titulo: ' +
                          widget.book['volumeInfo']['title'] +
                          ', Páginas: ' +
                          widget.book['volumeInfo']['pageCount'].toString())
                    })
          ],
        ),
        body: Container(
          child: Column(
            children: [
              // Text(widget.book.toString()),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image(
                    image: NetworkImage(
                        "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/yellow-business-leadership-book-cover-design-template-dce2f5568638ad4643ccb9e725e5d6ff.jpg?ts=1637017516")),
              ),

              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Text(widget.book['volumeInfo']['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 30)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(widget.book['volumeInfo']['publishedDate'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(widget.book['volumeInfo']['pageCount'].toString(),
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              GestureDetector(
                child: Text(
                    widget.book['volumeInfo']['description'] == null
                        ? 'Descripción no disponible'
                        : fullDescription == true
                            ? widget.book['volumeInfo']['description']
                                    .toString()
                                    .substring(0, 256) +
                                '...'
                            : widget.book['volumeInfo']['description']
                                    .toString()
                                    .substring(0, 10) +
                                '...',
                    style: TextStyle(fontSize: 15)),
                onTap: () {
                  this.fullDescription = !this.fullDescription;
                  print(this.fullDescription);
                  setState(() {});
                },
              )
            ],
          ),
        ));
  }
}
