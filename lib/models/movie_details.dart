class MovieDetailsProvider{
  final String? imageUrl;
  late final String title;
  late final String description;
  late final int voteCount;
  late final String voteAverage;
  late final String genre;
  MovieDetailsProvider(
      {required this.imageUrl,
        required this.title,
        required this.description,
        required this.voteCount,
        required this.voteAverage,
        required this.genre});
}

