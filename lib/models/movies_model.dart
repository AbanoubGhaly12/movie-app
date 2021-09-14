class Moviedetail {
  Moviedetail({
    required this.totalPages,
    required this.totalResults,
  });

  late final int totalPages;
  late final int totalResults;

  Moviedetail.fromJson(Map<String, dynamic> json){

    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}


class Movie {
  Movie({
    required this.adult,
    required this.backdropPath ,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String? backdropPath;
  late final int id;
  late final String originalTitle;
  late final String overview;
  late final String title;
  late final String? voteAverage;
  late final int voteCount;

  Movie.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    title = json['title'];
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['id'] = id;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['title'] = title;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}










//
// class Movie {
//   final String backdropPath;
//   final int id;
//   final String originalTitle;
//   final String overview;
//   final String title;
//   final int voteCount;
//   final String voteAverage;
//   final bool adult;
//   String error = '';
//
//
//   Movie({
//     required this.backdropPath,
//     required this.id,
//     required this.originalTitle,
//     required this.overview,
//     required this.title,
//     required this.voteCount,
//     required this.voteAverage,
//     required this.adult,
//     //required this.genreName,
//   });
//
//   factory Movie.fromJson(dynamic json) {
//     if (json == null) {
//       return Movie(
//         title: '',
//         id: 0,
//         originalTitle: '',
//         overview: '',
//         voteCount: 0,
//         voteAverage: '',
//         backdropPath: '',
//         adult: false,
//        // genreName: '',
//       );
//     }
//
//     return Movie(
//       backdropPath: json['backdrop_path'],
//       id: json['id'],
//       originalTitle: json['original_title'],
//       overview: json['overview'],
//       title: json['title'],
//       voteCount: json['vote_count'],
//       voteAverage: json['vote_average'].toString(),
//       adult: json['adult'],
//    );
//   }
// }

