import 'package:flutter/material.dart';
import 'package:state_management_session_two/models/anime_model.dart';
import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/modules/all_anime/all_anime_repository.dart';

class AllAnimeViewModel with ChangeNotifier {
  var allAnime = <AnimeModel>[];
  var isLoading = false;
  var isConnected = false;

  Future<ResponseModel<List<AnimeModel>>> getAllAnime() async {
    isLoading = true;
    notifyListeners();

    final result = await AllAnimeRepository.parseAllAnime();

    if (result.message == 'Check your internet connection') {
      isConnected = false;
    } else {
      isConnected = true;
    }

    isLoading = false;
    notifyListeners();

    if (result.statusCode == 200) {
      allAnime = result.data ?? [];
      notifyListeners();
    }

    return result;
  }
}
