class User {
  String? name;
  int? age;
  late List<String> professions;

  User({
    this.name,
    this.age,
    this.professions = const [],
  });
}
