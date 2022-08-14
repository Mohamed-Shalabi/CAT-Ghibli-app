import 'package:flutter/material.dart';
import 'package:state_management_session_two/models/anime_model.dart';
import 'package:state_management_session_two/modules/all_anime/all_anime_repository.dart';

class AllAnimeViewModel with ChangeNotifier {
  var allAnimeFilms = <AnimeModel>[];
  var isLoading = false;

  Future<bool> getAllAnimeFilms() async {
    isLoading = true;
    notifyListeners();

    final result = await AllAnimeRepository.parseAllAnime();

    isLoading = false;

    if (result.statusCode == 200) {
      allAnimeFilms = result.data ?? [];
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
