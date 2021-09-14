import 'package:equatable/equatable.dart';
import 'package:movie_app/models/screenshots.dart';


class MovieImage extends Equatable {
  final List<Screenshot> backdrops;
  final List<Screenshot> posters;

  const MovieImage({required this.backdrops, required this.posters});

  factory MovieImage.fromJson(Map<String, dynamic> result) {
    if (result == null) {
      return MovieImage(posters: [], backdrops: []);
    }

    return MovieImage(
      backdrops: (result['backdrops'] as List)
          ?.map((b) => Screenshot.fromJson(b))
          ?.toList() ??
          List.empty(),
      posters: (result['posters'] as List)
          ?.map((b) => Screenshot.fromJson(b))
          ?.toList() ??
          List.empty(),
    );
  }

  @override
  List<Object> get props => [backdrops, posters];
}