final String tableItem = 'items';

class ItemFields {
  static final String id = "_id";
  static final String title = "_title";
  static final String username = "_username";
  static final String password = "_password";
}

class Item {
  final int? id;
  final String title;
  final String username;
  final String password;

  const Item(
      {this.id,
      required this.title,
      required this.username,
      required this.password});

  static Item fromJson(Map<String, Object?> json) => Item(
        id: json[ItemFields.id] as int?,
        title: json[ItemFields.title] as String,
        username: json[ItemFields.username] as String,
        password: json[ItemFields.password] as String,
      );

  Map<String, Object?> toJson() => {
        ItemFields.id: id,
        ItemFields.title: title,
        ItemFields.username: username,
        ItemFields.password: password
      };
}
