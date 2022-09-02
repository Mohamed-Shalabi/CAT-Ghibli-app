import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/navigate.dart';
import 'package:state_management_session_two/global/styles/themes.dart';
import 'package:state_management_session_two/global/widgets/my_network_image.dart';
import 'package:state_management_session_two/global/widgets/my_divider.dart';
import 'package:state_management_session_two/models/anime_model.dart';
import 'package:state_management_session_two/modules/all_anime/screens/single_anime_screen.dart';
import 'package:state_management_session_two/modules/all_anime/view_models/single_anime_view_model.dart';

class AnimeListTile extends StatelessWidget {
  const AnimeListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = context.read<AnimeTileViewModel>().anime;
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          Provider(
            create: (_) => SingleAnimeViewModel(anime: anime),
            child: const SingleAnimeScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            MyNetworkImage(url: anime.banner),
            const SizedBox(height: 8),
            Text(
              '${anime.title}\n${anime.japaneseTitle}',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
            const MyDivider(),
            const DescriptionText(),
          ],
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final description = context.read<AnimeTileViewModel>().anime.description;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: context.textTheme.bodyMedium,
      ),
    );
  }
}


class AnimeTileViewModel {
  final AnimeModel anime;

  AnimeTileViewModel({required this.anime});
}
