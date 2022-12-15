import 'package:movies_app/movies/domain/entities/genres.dart';

class GenresModle extends Genres{

  GenresModle({
    required super.name,
  required super.id,
});

  factory GenresModle.fromJson(Map<String, dynamic> json) => GenresModle(
        name: json["name"],
        id: json['id'],
        );


}