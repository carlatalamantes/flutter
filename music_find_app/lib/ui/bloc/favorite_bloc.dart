import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  List<dynamic> favoriteList = [];

  FavoriteBloc() : super(FavoriteInitial()) {
    on<UpdateFavorite>(updateFavorite);
    on<GetFavorites>(updateFavorite);
  }

  Future updateFavorite(event, emit) async {
    //Search if the song is already in the list
    bool isFavorite = favoriteList.any((element) =>
        element["title"] == event.data["title"] &&
        element["artist"] == event.data["artist"]);

    if (isFavorite) {
      await _firestore.collection('users').doc(user.uid).update({
        'favorites': FieldValue.arrayRemove([event.data])
      });
      emit(FavoriteDelete(favoriteList: favoriteList));
    } else {
      var uuid = Uuid();
      event.data["uuid"] = uuid.v1();
      await _firestore.collection('users').doc(user.uid).set({
        'favorites': FieldValue.arrayUnion([event.data])
      }, SetOptions(merge: true));
      emit(FavoriteSuccess(favoriteList: favoriteList));
    }
  }

  Future getFavorites() async {
    await _firestore.collection('users').doc(user.uid).get().then((value) {
      if (value.exists) {
        favoriteList = value.data()!['favorites'];
      } else {
        favoriteList = [];
      }
    });
  }
}
