import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/show_snack_bar.dart';
import 'package:state_management_session_two/global/styles/themes.dart';
import 'package:state_management_session_two/modules/all_anime/view_models/all_anime_view_model.dart';
import 'package:state_management_session_two/modules/all_anime/widgets/anime_list_tile.dart';

class AllAnimeScreen extends StatelessWidget {
  const AllAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All anime films'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<Themes>().toggleThemeMode();
            },
            icon: const Icon(Icons.brightness_4),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => AllAnimeViewModel()
          ..getAllAnime().then(
            (result) {
              if (result.isError) {
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
                  ? Center(
                      child: Text(
                        'Check your internet connection',
                        style: context.textTheme.titleLarge,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: allAnime.length,
                      itemBuilder: (BuildContext context, int index) {
                        final anime = allAnime[index];
                        return Provider(
                          create: (_) => AnimeTileViewModel(anime: anime),
                          child: const AnimeListTile(),
                        );
                      },
                    );
        },
      ),
    );
  }
}
