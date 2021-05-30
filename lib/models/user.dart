class User {
  late String name;
  late int age;
  late List<String> professions;

  User({
    required this.name,
    this.age = 18,
    this.professions = const [],
  });

  User copyWith({String? name, int? age, List<String>? professions}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      professions: professions ?? this.professions,
    );
  }
}
