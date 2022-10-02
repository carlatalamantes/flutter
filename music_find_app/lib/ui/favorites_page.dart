import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_find_app/ui/bloc/favorite_bloc.dart';
import 'package:music_find_app/ui/favoritesDetail_page.dart';
import 'package:music_find_app/ui/favorites_component.dart';

class Favoritespage extends StatefulWidget {
  Favoritespage({Key? key, required this.title}) : super(key: key);
  final List<Map<String, String>> _listElements = [
    {
      "title": "Song title",
      "artist": "Artist name",
      "album": "Album title",
      "year": "Year",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
      "linkSpotify": "",
      "linkApple": "",
      "linkPodcast": ""
    },
    {
      "title": "Song title",
      "artist": "Artist name",
      "album": "Album title",
      "year": "Year",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
      "linkSpotify": "",
      "linkApple": "",
      "linkPodcast": ""
    },
    {
      "title": "Song title",
      "artist": "Artist name",
      "album": "Album title",
      "year": "Year",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
      "linkSpotify": "",
      "linkApple": "",
      "linkPodcast": ""
    },
  ];

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
        body: BlocConsumer<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.favoriteList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoritesDetail(
                            title: 'Detail', data: state.favoriteList[index]),
                      ),
                    ),
                    //show dialog
                  },
                  child: FavoriteItem(
                    content: state.favoriteList[index],
                  ),
                );
              },
            );
          },
        ));
  }
}
