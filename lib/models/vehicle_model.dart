class VehicleModel {
  final String id, name, description, vehicleClass, length;

  VehicleModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        description = map['description'] ?? '',
        vehicleClass = map['vehicle_class'] ?? '',
        length = map['length'] ?? '';

  static parseList(List<Map<String, dynamic>> mappedList) {
    final list = <VehicleModel>[];
    for (final vehicleModelMapped in mappedList) {
      list.add(VehicleModel.fromMap(vehicleModelMapped));
    }

    return list;
  }
}
