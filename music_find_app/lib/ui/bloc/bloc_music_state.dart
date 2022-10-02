part of 'bloc_music_bloc.dart';

class BlocMusicState extends Equatable {
  const BlocMusicState();

  @override
  List<Object> get props => [];
}

class BlocMusicInitial extends BlocMusicState {}

class AudDSuccess extends BlocMusicState {
  String artist;
  String title;
  String album;
  String year;
  String image;
  String linkSpotify;
  String linkApple;
  String linkAll;

  AudDSuccess(
      {required this.artist,
      required this.title,
      required this.album,
      required this.year,
      required this.image,
      required this.linkSpotify,
      required this.linkApple,
      required this.linkAll});
}

class AudDFailed extends BlocMusicState {}
