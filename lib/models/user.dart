class User {
  late String name;
  late int age;
  late List<String> professions;

  User({
    required this.name,
    this.age = 18,
    this.professions = const [],
  });
}
