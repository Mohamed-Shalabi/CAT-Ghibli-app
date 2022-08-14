class LocationModel {
  final String id, name, climate, terrain, surfaceWater;

  LocationModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        climate = map['climate'] ?? '',
        terrain = map['terrain'] ?? '',
        surfaceWater = map['surface_water'] ?? '';

  static parseList(List<Map<String, dynamic>> mappedList) {
    final list = <LocationModel>[];
    for (final locationModelMapped in mappedList) {
      list.add(LocationModel.fromMap(locationModelMapped));
    }

    return list;
  }
}
