class Place {}

class PreviewPlace {
  final String placeId;
  final String title;
  final String contents;
  final String imageUrl;

  PreviewPlace(
      {required this.placeId,
      required this.title,
      required this.contents,
      required this.imageUrl});

  factory PreviewPlace.fromJson(Map<String, dynamic> json) {
    return PreviewPlace(
        placeId: json['id'],
        title: json['title'],
        contents: json['contents'],
        imageUrl: json['imageUrl']);
  }
}
