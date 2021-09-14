import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class MovieEventStarted extends MovieEvent {
  final int movieId;
  final String query;
  final int pageNumber;
  final bool refreshIndicator ;

  const MovieEventStarted(this.movieId, this.query, this.pageNumber,this.refreshIndicator);

  @override
  List<Object> get props => [];
}