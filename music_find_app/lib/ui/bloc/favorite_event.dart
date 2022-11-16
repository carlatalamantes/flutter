part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
  @override
  List<Object> get props => [];
}

class UpdateFavorite extends FavoriteEvent {
  Map<dynamic, dynamic> data;

  UpdateFavorite(this.data);
}

class GetFavorites extends FavoriteEvent {
  GetFavorites();
}
