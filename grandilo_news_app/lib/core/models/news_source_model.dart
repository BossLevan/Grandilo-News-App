class Source {
  String id;
  String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> parsedJson) {
    return Source(
      id: parsedJson['id'],
      name: parsedJson['name'],
    );
  }
}
