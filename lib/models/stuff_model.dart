class StuffModel {
  int id;
  String name;
  String description;
  bool favorited;

  StuffModel({this.favorited = false});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_ID: id,
      COLUMN_NAME: name,
      COLUMN_DESCRIPTION: description,
      COLUMN_FAVORITED: favorited ? 1 : 0
    };
    return map;
  }

  StuffModel.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    name = map[COLUMN_NAME];
    description = map[COLUMN_DESCRIPTION];
    favorited = map[COLUMN_FAVORITED] == 1;
  }

  @override
  String toString() {
    return 'StuffModel{id: $id, name: $name, description: $description, favorited: $favorited}';
  }

  static const String TABLE_STUFF = "stuff";
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";
  static const String COLUMN_DESCRIPTION = "description";
  static const String COLUMN_FAVORITED = "favorited";
}
