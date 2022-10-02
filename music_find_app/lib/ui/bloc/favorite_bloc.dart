import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<UpdateFavorite>(updateFavorite);
  }

  Future updateFavorite(event, emit) async {
    List favoriteList = state.favoriteList;

    //Search if the song is already in the list
    bool isFavorite = favoriteList.any((element) =>
        element["title"] == event.data["title"] &&
        element["artist"] == event.data["artist"]);

    if (isFavorite) {
      favoriteList.removeWhere((element) =>
          element["title"] == event.data["title"] &&
          element["artist"] == event.data["artist"]);
      emit(FavoriteDelete(favoriteList: favoriteList));
    } else {
      favoriteList.add(event.data);
      emit(FavoriteSuccess(favoriteList: favoriteList));
    }
  }
}
