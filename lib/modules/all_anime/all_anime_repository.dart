import 'dart:convert';
import 'dart:io';

import 'package:state_management_session_two/models/anime_model.dart';
import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/modules/all_anime/all_anime_service.dart';

class AllAnimeRepository {
  AllAnimeRepository._();

  static Future<ResponseModel<List<AnimeModel>>> parseAllAnime() async {
    try {
      final response = await AllAnimeService.fetchAllAnime();
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final animeModels = AnimeModel.parseList(
          result.cast<Map<String, dynamic>>(),
        );

        return ResponseModel.success(data: animeModels);
      } else {
        return ResponseModel.unknownError();
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseModel.networkError();
      }

      return ResponseModel.unknownError();
    }
  }
}
