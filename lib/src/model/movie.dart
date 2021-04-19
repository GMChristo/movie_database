import 'dart:convert';

class Movie {
  int id;
  String title;
  String poster_path;
  String release_date;

  Movie();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': poster_path,
      'release_date': release_date,
    };
  }

  Movie.fromMap(Map<String, dynamic> map) {
      id = map['id'];
      title = map['title'];
      poster_path = map['poster_path'];
      release_date = map['release_date'];
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
