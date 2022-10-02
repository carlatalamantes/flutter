part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  FavoriteState();

  List<dynamic> favoriteList = [];

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  FavoriteSuccess({required favoriteList});
}

class FavoriteDelete extends FavoriteState {
  FavoriteDelete({required favoriteList});
}
