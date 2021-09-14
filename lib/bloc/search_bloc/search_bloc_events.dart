import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchEventStarted extends SearchEvent {
  final int movieId;
  final String query;
  final int pageNumber;
  final String movieName ;

  const SearchEventStarted(this.movieId, this.query, this.pageNumber,this.movieName);

  @override
  List<Object> get props => [];
}