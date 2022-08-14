import 'package:state_management_session_two/global/enums/gender.dart';

class PersonModel {
  final String id, name, age, eyeColor, hairColor;
  final Gender gender;

  PersonModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        age = map['age'] ?? '',
        eyeColor = map['eye_color'] ?? '',
        hairColor = map['hair_color'] ?? '',
        gender = GenderParser.parse(map['gender'] ?? 'male');

  static parseList(List<Map<String, dynamic>> mappedList) {
    final list = <PersonModel>[];
    for (final personModelMapped in mappedList) {
      list.add(PersonModel.fromMap(personModelMapped));
    }

    return list;
  }
}
