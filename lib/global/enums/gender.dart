enum Gender { male, female, na }

extension GenderParser on Gender {
  static Gender parse(String value) {
    return Gender.values.firstWhere(
      (element) {
        return element.name.toLowerCase() == value.toLowerCase();
      },
    );
  }
}
