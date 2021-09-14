import 'package:equatable/equatable.dart';

abstract class MovieMostRatedEvent extends Equatable {
  const MovieMostRatedEvent();
}

class MostRatedMovieEventStarted extends MovieMostRatedEvent {
  final int movieId;
  final String query;
  final int pageNumber;

  const MostRatedMovieEventStarted(this.movieId, this.query, this.pageNumber);

  @override
  List<Object> get props => [];
}