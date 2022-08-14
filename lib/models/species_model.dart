class SpeciesModel {
  final String id, name, classification, eyeColor, hairColor;

  SpeciesModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        classification = map['classification'] ?? '',
        eyeColor = map['eye_color'] ?? '',
        hairColor = map['hair_color'] ?? '';

  static parseList(List<Map<String, dynamic>> mappedList) {
    final list = <SpeciesModel>[];
    for (final speciesModelMapped in mappedList) {
      list.add(SpeciesModel.fromMap(speciesModelMapped));
    }

    return list;
  }
}