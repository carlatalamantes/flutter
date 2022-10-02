import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/favorite_bloc.dart';

class FavoritesDetail extends StatefulWidget {
  FavoritesDetail({Key? key, required this.title, required this.data})
      : super(key: key);

  final String title;
  final Map<String, String> data;

  @override
  _FavoritesDetailState createState() => _FavoritesDetailState();
}

class _FavoritesDetailState extends State<FavoritesDetail> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteDelete) {
          isFavorite = false;
          setState(() {});
        }
        if (state is FavoriteSuccess) {
          isFavorite = true;
          setState(() {});
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                IconButton(
                  icon: !isFavorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Favoritos'),
                      content: !isFavorite
                          ? const Text('¿Desea eliminar de favoritos?')
                          : const Text('¿Desea agregar a favoritos?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => {
                            BlocProvider.of<FavoriteBloc>(context)
                                .add(UpdateFavorite(widget.data)),
                            Navigator.pop(context, 'OK'),
                            setState(() {
                              isFavorite = !isFavorite;
                            })
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.network(
                      widget.data["image"]!,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      widget.data["title"]!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      widget.data["artist"]!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],

                  // children: [Image(image: widget.data['image']), Text('DATA')],
                )));
      },
    );
  }
}
