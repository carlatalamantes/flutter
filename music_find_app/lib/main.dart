import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_find_app/ui/bloc/auth_bloc.dart';
import 'package:music_find_app/ui/bloc/bloc_music_bloc.dart';
import 'package:music_find_app/ui/bloc/favorite_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/music_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
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
}
