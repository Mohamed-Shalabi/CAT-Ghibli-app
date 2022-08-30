import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/navigate.dart';
import 'package:state_management_session_two/global/widgets/MyNetworkImage.dart';
import 'package:state_management_session_two/global/widgets/my_divider.dart';
import 'package:state_management_session_two/models/anime_model.dart';
import 'package:state_management_session_two/modules/all_anime/screens/single_anime_screen.dart';
import 'package:state_management_session_two/modules/all_anime/view_models/single_anime_view_model.dart';

class AnimeListTile extends StatelessWidget {
  const AnimeListTile({
    Key? key,
    required this.anime,
  }) : super(key: key);

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
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
          color: Colors.white,
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
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const MyDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                anime.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
