class Place {
  final String title;
  final String contents;
  final String imageUrl;
  final String address;
  final List<dynamic> hashtags;

  Place(
      {required this.title,
      required this.contents,
      required this.imageUrl,
      required this.address,
      required this.hashtags});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        title: json['title'],
        contents: json['contents'],
        imageUrl: json['img'],
        address: json['address'],
        hashtags: json['hashtags']);
  }
}

class PreviewPlace {
  final int placeId;
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
        imageUrl: json['img']);
  }
}
