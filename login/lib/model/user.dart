class User {
  String? name;
  String? Password;
  String? monny;

  User({this.name, this.Password, this.monny});

  Map<String, dynamic> toJson() => {
        'name': name,
        'Password': Password,
        'monny': monny,
      };
}
