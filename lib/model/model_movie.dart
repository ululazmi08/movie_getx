// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates? dates;
  int page;
  List<Result>? results;
  int totalPages;
  int totalResults;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
    page: json["page"] == null ? null : json["page"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    totalResults: json["total_results"] == null ? null : json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "dates": dates == null ? null : dates!.toJson(),
    "page": page == null ? null : page,
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages == null ? null : totalPages,
    "total_results": totalResults == null ? null : totalResults,
  };
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime? maximum;
  DateTime? minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    maximum: json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
    minimum: json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
  );

  Map<String, dynamic> toJson() => {
    "maximum": maximum == null ? null : "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
    "minimum": minimum == null ? null : "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
  };
}

class Result {
  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    // required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int>? genreIds;
  int id;
  // OriginalLanguage? originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"] == null ? null : json["adult"],
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"] == null ? null : json["id"],
    // originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    overview: json["overview"] == null ? null : json["overview"],
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"] == null ? null : json["title"],
    video: json["video"] == null ? null : json["video"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult == null ? null : adult,
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id == null ? null : id,
    // "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle == null ? null : originalTitle,
    "overview": overview == null ? null : overview,
    "popularity": popularity == null ? null : popularity,
    "poster_path": posterPath == null ? null : posterPath,
    "release_date": releaseDate == null ? null : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title == null ? null : title,
    "video": video == null ? null : video,
    "vote_average": voteAverage == null ? null : voteAverage,
    "vote_count": voteCount == null ? null : voteCount,
  };
}

// enum OriginalLanguage { EN }
//
// final originalLanguageValues = EnumValues({
//   "en": OriginalLanguage.EN
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
