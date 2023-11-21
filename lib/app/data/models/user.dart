class User {
  String name;
  String email;
  String id;
  String picture;
  int saldo;

  User(
      {required this.email,
      required this.id,
      required this.name,
      required this.saldo,
      required this.picture});

  factory User.fromMap(Map map) => User(
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      picture: map['picture'] ?? '',
      saldo: map['saldo'] ?? 0);

  toMap() => {
        "email": email,
        "id": id,
        "name": name,
        "saldo": saldo,
        'picture': picture
      };
}
