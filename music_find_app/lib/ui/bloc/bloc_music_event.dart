part of 'bloc_music_bloc.dart';

abstract class BlocMusicEvent extends Equatable {
  const BlocMusicEvent();

  @override
  List<Object> get props => [];
}

class StartRecording extends BlocMusicEvent {}
