import 'dart:convert';

List<Rows> RowsFromJson(List rows) =>
    List<Rows>.from(rows.map((x) => Rows.fromJson(x)));

String RowToJson(List<Rows> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rows {
  Rows({
    required this.description,
    required this.imageHref,
    required this.title,
  });

  String title;
  String description;
  String imageHref;
  factory Rows.fromJson(Map<String, dynamic> json) => Rows(
        description: json["description"] != null ? json["description"] : "",
        imageHref:  json["imageHref"] != null ? Uri.decodeFull( json["imageHref"] ): "",
        title: json["title"] != null ? json["title"] : "",
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "imageHref": imageHref,
        "title": title,
      };
}
