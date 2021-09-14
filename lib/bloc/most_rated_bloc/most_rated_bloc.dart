import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/services/movies_api.dart';
import 'most_rated_event.dart';
import 'most_rated_state.dart';


class MostRatedMovieBloc extends Bloc<MovieMostRatedEvent, MovieMostRatedState> {
  int apiCounter = 0;

  MostRatedMovieBloc() : super(MovieMostRatedLoading());

  @override
  Stream<MovieMostRatedState> mapEventToState(MovieMostRatedEvent event) async* {
    if (event is MostRatedMovieEventStarted) {
      yield* _mapMovieEventStateToState(event.movieId, event.query);
    }
  }

  Stream<MovieMostRatedState> _mapMovieEventStateToState(
      int movieId, String query) async* {
    apiCounter++;
    final service = ApiService(apiCounter);
    yield MovieMostRatedLoading();
    try {
      List<Movie> movieList;
      if (movieId == 0) {
        movieList = await service.getTopRatedMovie();
      } else {
        //print(movieId);
        movieList = await service.getTopRatedMovie();
      }

      yield MostRatedMovieLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield MovieMostRatedError();
    }
  }
}