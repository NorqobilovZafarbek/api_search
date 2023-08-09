class PostModel {
  int? id;
  String? title;
  String? body;
  List<String>? tags;
  int? userId;
  int? reactions;

  PostModel({
    this.id,
    this.tags,
    this.body,
    this.title,
    this.userId,
    this.reactions,
  });

  factory PostModel.fromJson(Map<String, Object?> json) => PostModel(
        id: json["id"] as int?,
        body: json["body"] as String?,
        reactions: json["reactions"] as int?,
        title: json["title"] as String?,
        userId: json["userId"] as int?,
        tags: List<String>.from((json["tags"] as List?) ?? []),
      );

  Map<String, Object?> toJson() => {
        "id": id,
        "body": body,
        "reactions": reactions,
        "title": title,
        "userId": userId,
        "tags": tags,
      };
}
