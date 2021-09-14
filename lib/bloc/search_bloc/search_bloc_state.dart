import 'package:equatable/equatable.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movies_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> searchList;
  const SearchLoaded(this.searchList);

  @override
  List<Object> get props => [searchList];
}

class MovieError extends SearchState {}