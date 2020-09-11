class Source {
  String id;
  String name;

  Source({this.id, this.name});

  //factory constructor to lazily create a new instance
  //of the source
  factory Source.fromJson(Map<String, dynamic> parsedJson) {
    return Source(
      id: parsedJson['id'],
      name: parsedJson['name'],
    );
  }
}
