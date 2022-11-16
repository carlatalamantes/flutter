import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_find_app/ui/bloc/bloc_music_bloc.dart';
import 'package:music_find_app/ui/favoritesDetail_page.dart';
import 'package:music_find_app/ui/favorites_page.dart';
import 'package:music_find_app/ui/login_widget.dart';

import 'bloc/auth_bloc.dart';

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
          actions: [
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is UnAuthenticated) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginWidget(),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return IconButton(
                    onPressed: () => Logout(context),
                    icon: Icon(Icons.logout_outlined));
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: BlocConsumer<BlocMusicBloc, BlocMusicState>(
              listener: (context, state) {
            if (state is AudDSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesDetail(
                    title: "Favorites",
                    data: {
                      "title": state.title,
                      "artist": state.artist,
                      "album": state.album,
                      "year": state.year,
                      "image": state.image,
                      "linkSpotify": state.linkSpotify,
                      "linkApple": state.linkApple,
                      "linkAll": state.linkAll
                    },
                  ),
                ),
              );
            }
            if (state is UnAuthenticated) {
              print("holaa");
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginWidget(),
                ),
              );
            }
          }, builder: (context, state) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Toque para escuchar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  if (state is AudDFailed)
                    Text("No se pudo encontrar la cancion.",
                        style: TextStyle(
                            color: Colors.purpleAccent, fontSize: 14)),
                  Material(
                    child: Center(
                      child: Ink(
                        width: 200,
                        height: 220,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            BlocProvider.of<BlocMusicBloc>(context)
                                .add(StartRecording());

                            setState(() {});
                          },
                          icon: Icon(
                            Icons.mic,
                            size: 100,
                          ),
                          color: Colors.purple,
                          splashRadius: 110,
                          splashColor: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Material(
                        child: Center(
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              tooltip: 'Ver favoritos',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Favoritespage(title: 'Favorites')),
                                );
                              },
                              icon: Icon(Icons.favorite),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]);
          }),
        ));
  }

  void Logout(context) async {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
  }
}
