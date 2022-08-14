enum Gender { male, female }

extension GenderParser on Gender {
  static Gender parse(String value) => Gender.values.firstWhere(
        (element) => element.name == value,
      );
}
