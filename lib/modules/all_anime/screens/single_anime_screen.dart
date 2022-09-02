import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/navigate.dart';
import 'package:state_management_session_two/global/functions/show_snack_bar.dart';
import 'package:state_management_session_two/global/styles/themes.dart';
import 'package:state_management_session_two/global/widgets/my_divider.dart';
import 'package:state_management_session_two/global/widgets/my_network_image.dart';
import 'package:state_management_session_two/modules/all_anime/view_models/single_anime_view_model.dart';
import 'package:state_management_session_two/modules/all_anime/widgets/navigation_row.dart';
import 'package:state_management_session_two/modules/locations/view_models/locations_view_model.dart';
import 'package:state_management_session_two/modules/people/screens/people_screen.dart';
import 'package:state_management_session_two/modules/people/view_models/people_view_model.dart';
import 'package:state_management_session_two/modules/species/screens/species_screen.dart';
import 'package:state_management_session_two/modules/species/view_models/species_view_model.dart';
import 'package:state_management_session_two/modules/vehicles/screens/vehicles_screen.dart';
import 'package:state_management_session_two/modules/vehicles/view_models/vehicles_view_model.dart';

import '../../locations/screens/locations_screen.dart';

class SingleAnimeScreen extends StatelessWidget {
  const SingleAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleAnimeViewModel>();
    final anime = viewModel.anime;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          anime.title,
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                MyNetworkImage(url: anime.banner),
                const MyDivider(),
                Text(
                  '${anime.title}\n${anime.japaneseTitle}',
                  style: context.textTheme.titleMedium,
                ),
                const MyDivider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsetsDirectional.only(end: 8),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            anime.description,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: AnimeDataColumn(),
                      ),
                    ],
                  ),
                ),
                const MyDivider(),
                NavigationRow(
                  title: 'People',
                  navigateTo: (BuildContext context) {
                    navigateTo(
                      context,
                      ChangeNotifierProvider(
                        create: (_) {
                          return PeopleViewModel(peopleUrls: anime.people)
                            ..getPeople().then((value) {
                              if (value.isError) {
                                showSnackBar(context, value.message);
                              }
                            });
                        },
                        child: const PeopleScreen(),
                      ),
                    );
                  },
                ),
                const MyDivider(),
                NavigationRow(
                  title: 'Locations',
                  navigateTo: (BuildContext context) {
                    navigateTo(
                      context,
                      ChangeNotifierProvider(
                        create: (_) {
                          return LocationsViewModel(
                            locationsUrls: anime.locations,
                          )..getLocations().then((value) {
                              if (value.isError) {
                                showSnackBar(context, value.message);
                              }
                            });
                        },
                        child: const LocationsScreen(),
                      ),
                    );
                  },
                ),
                const MyDivider(),
                NavigationRow(
                  title: 'Vehicles',
                  navigateTo: (BuildContext context) {
                    navigateTo(
                      context,
                      ChangeNotifierProvider(
                        create: (_) {
                          return VehiclesViewModel(
                            vehiclesUrls: anime.vehicles,
                          )..getVehicles().then((value) {
                              if (value.isError) {
                                showSnackBar(context, value.message);
                              }
                            });
                        },
                        child: const VehiclesScreen(),
                      ),
                    );
                  },
                ),
                const MyDivider(),
                NavigationRow(
                  title: 'Species',
                  navigateTo: (BuildContext context) {
                    navigateTo(
                      context,
                      ChangeNotifierProvider(
                        create: (_) {
                          return SpeciesViewModel(speciesUrls: anime.species)
                            ..getSpecies().then((value) {
                              if (value.isError) {
                                showSnackBar(context, value.message);
                              }
                            });
                        },
                        child: const SpeciesScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimeDataColumn extends StatelessWidget {
  const AnimeDataColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = context.read<SingleAnimeViewModel>().anime;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          child: MyNetworkImage(url: anime.image),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Director: ${anime.director}',
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Producer: ${anime.producer}',
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Release Date: ${anime.releaseDate}',
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Running Time: ${anime.runningTime}',
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

