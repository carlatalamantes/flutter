import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_find_app/ui/bloc/favorite_bloc.dart';
import 'package:music_find_app/ui/favoritesDetail_page.dart';
import 'package:music_find_app/ui/favorites_component.dart';

class Favoritespage extends StatefulWidget {
  Favoritespage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FavoritespageState createState() => _FavoritespageState();
}

class _FavoritespageState extends State<Favoritespage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteBloc>(context, listen: false)
        .getFavorites()
        .then((value) => {
              setState(() {
                print(value);
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocConsumer<FavoriteBloc, FavoriteState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:
                  BlocProvider.of<FavoriteBloc>(context).favoriteList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoritesDetail(
                            title: 'Detail',
                            data: BlocProvider.of<FavoriteBloc>(context)
                                .favoriteList[index]),
                      ),
                    ),
                    //show dialog
                  },
                  child: FavoriteItem(
                    content: BlocProvider.of<FavoriteBloc>(context)
                        .favoriteList[index],
                  ),
                );
              },
            );
          },
        ));
  }
}
