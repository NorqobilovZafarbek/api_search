class TodoModel {
  String? id;
  String? title;
  String? description;

  TodoModel({
    this.id,
    this.title,
    this.description,
  });

  @override
  String toString() {
    return 'TodoModel{id: $id, title: $title, description: $description}';
  }

  factory TodoModel.fromJson(Map<String?, Object?> json) =>
      TodoModel(
        id: json["id"] as String?,
        title: json["title"] as String?,
        description: json["description"] as String?,
      );

  Map<String, Object?> toJson() =>
      {
        "id": id,
        "title": title,
        "description": description,
      };

  factory TodoModel.fromMap(Map<String, Object?> map) {
    return TodoModel(
      id: map["id"] as String?,
      title: map["title"] as String?,
      description: map["description"] as String?,
    );
  }

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
    };
  }


}
