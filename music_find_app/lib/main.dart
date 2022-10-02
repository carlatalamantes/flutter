import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_find_app/ui/bloc/bloc_music_bloc.dart';
import 'package:music_find_app/ui/bloc/favorite_bloc.dart';
import 'app/music_app.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<BlocMusicBloc>(
            create: (context) => BlocMusicBloc(),
          ),
          BlocProvider<FavoriteBloc>(
            create: (context) => FavoriteBloc(),
          ),
        ],
        child: MusicApp(),
      ),
    );
