class AnimeModel {
  final String id,
      title,
      japaneseTitle,
      image,
      banner,
      description,
      director,
      producer,
      releaseDate,
      runningTime,
      rtScore;
  final List<String> people, species, locations, vehicles;

  AnimeModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        title = map['title'] ?? '',
        japaneseTitle = map['original_title'] ?? '',
        image = map['image'] ?? '',
        banner = map['movie_banner'] ?? '',
        description = map['description'] ?? '',
        director = map['director'] ?? '',
        producer = map['producer'] ?? '',
        releaseDate = map['release_date'] ?? '',
        runningTime = map['running_time'] ?? '',
        rtScore = map['rt_score'] ?? '',
        people = (map['people'] ?? []).cast<String>(),
        species = (map['people'] ?? []).cast<String>(),
        locations = (map['locations'] ?? []).cast<String>(),
        vehicles = (map['vehicles'] ?? []).cast<String>();

  static parseList(List<Map<String, dynamic>> mappedList) {
    final list = <AnimeModel>[];
    for (final animeModelMapped in mappedList) {
      list.add(AnimeModel.fromMap(animeModelMapped));
    }

    return list;
  }
}
