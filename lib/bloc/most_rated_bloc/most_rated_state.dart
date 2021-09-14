import 'package:equatable/equatable.dart';
import 'package:movie_app/models/movies_model.dart';

abstract class MovieMostRatedState extends Equatable {
  const MovieMostRatedState();

  @override
  List<Object> get props => [];
}

class MovieMostRatedLoading extends MovieMostRatedState {}

class MostRatedMovieLoaded extends MovieMostRatedState {
  final List<Movie> mostRatedMovieList;
  const MostRatedMovieLoaded(this.mostRatedMovieList);

  @override
  List<Object> get props => [mostRatedMovieList];
}

class MovieMostRatedError extends MovieMostRatedState {}