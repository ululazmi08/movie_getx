// To parse this JSON data, do
//
//     final gallery = galleryFromJson(jsonString);

import 'dart:convert';

Gallery galleryFromJson(String str) => Gallery.fromJson(json.decode(str));

String galleryToJson(Gallery data) => json.encode(data.toJson());

class Gallery {
  Gallery({
    this.backdrops,
    this.id,
    this.logos,
    this.posters,
  });

  List<Backdrop>? backdrops;
  int? id;
  List<Backdrop>? logos;
  List<Posters>? posters;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    backdrops: json["backdrops"] == null ? null : List<Backdrop>.from(json["backdrops"].map((x) => Backdrop.fromJson(x))),
    id: json["id"] == null ? null : json["id"],
    logos: json["logos"] == null ? null : List<Backdrop>.from(json["logos"].map((x) => Backdrop.fromJson(x))),
    posters: json["posters"] == null ? null : List<Posters>.from(json["posters"].map((x) => Posters.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "backdrops": backdrops == null ? null : List<dynamic>.from(backdrops!.map((x) => x.toJson())),
    "id": id == null ? null : id,
    "logos": logos == null ? null : List<dynamic>.from(logos!.map((x) => x.toJson())),
    "posters": posters == null ? null : List<dynamic>.from(posters!.map((x) => x.toJson())),
  };
}

class Backdrop {
  Backdrop({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
    aspectRatio: json["aspect_ratio"] == null ? null : json["aspect_ratio"].toDouble(),
    height: json["height"] == null ? null : json["height"],
    iso6391: json["iso_639_1"] == null ? null : json["iso_639_1"],
    filePath: json["file_path"] == null ? null : json["file_path"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
    width: json["width"] == null ? null : json["width"],
  );

  Map<String, dynamic> toJson() => {
    "aspect_ratio": aspectRatio == null ? null : aspectRatio,
    "height": height == null ? null : height,
    "iso_639_1": iso6391 == null ? null : iso6391,
    "file_path": filePath == null ? null : filePath,
    "vote_average": voteAverage == null ? null : voteAverage,
    "vote_count": voteCount == null ? null : voteCount,
    "width": width == null ? null : width,
  };
}

class Posters {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Posters({this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width});

  Posters.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = this.aspectRatio;
    data['height'] = this.height;
    data['iso_639_1'] = this.iso6391;
    data['file_path'] = this.filePath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['width'] = this.width;
    return data;
  }
}
