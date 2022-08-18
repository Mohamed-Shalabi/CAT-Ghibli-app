import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/global_functions.dart';
import 'package:state_management_session_two/modules/all_anime/view_models/all_anime_view_model.dart';
import 'package:state_management_session_two/modules/all_anime/widgets/anime_list_tile.dart';

class AllAnimeScreen extends StatelessWidget {
  const AllAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All anime films')),
      body: ChangeNotifierProvider(
        create: (_) => AllAnimeViewModel()
          ..getAllAnime().then(
            (result) {
              if (result.statusCode != 200) {
                showSnackBar(context, result.message);
              }
            },
          ),
        builder: (BuildContext context, _) {
          final viewModel = context.watch<AllAnimeViewModel>();
          final allAnime = viewModel.allAnime;
          return viewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : !viewModel.isConnected
                  ? const Center(
                      child: Text('Check your internet connection'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: allAnime.length,
                      itemBuilder: (BuildContext context, int index) {
                        final anime = allAnime[index];
                        return AnimeListTile(anime: anime);
                      },
                    );
        },
      ),
    );
  }
}
