class SpeciesModel {
  final String id, name, classification, eyeColors, hairColors;

  SpeciesModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        classification = map['classification'] ?? '',
        eyeColors = map['eye_colors'] ?? '',
        hairColors = map['hair_colors'] ?? '';

  static parseList(List<Map<String, dynamic>> mappedList) {
    final list = <SpeciesModel>[];
    for (final speciesModelMapped in mappedList) {
      list.add(SpeciesModel.fromMap(speciesModelMapped));
    }

    return list;
  }
}