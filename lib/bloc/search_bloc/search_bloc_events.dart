import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchEventStarted extends SearchEvent {
  final int movieId;
  final String query;
  final int pageNumber;


  const SearchEventStarted(this.movieId, this.query, this.pageNumber,);

  @override
  List<Object> get props => [];
}