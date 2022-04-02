enum ShowcaseContentType {
  flutterUI,
  flutterMultithreading,
}

class ShowcaseResponseEntity {
  String name;
  ShowcaseContentType contentType;

  ShowcaseResponseEntity({
    required this.name,
    required this.contentType,
  });

  factory ShowcaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      ShowcaseResponseEntity(
        name: json["name"],
        contentType: json["contentType"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "contentType": contentType,
      };
}
