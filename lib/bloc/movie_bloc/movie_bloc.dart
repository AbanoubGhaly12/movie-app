import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/services/movies_api.dart';

import 'movie_bloc_event.dart';
import 'movie_bloc_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {

  int apiCounter = 1;

  MovieBloc() : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStateToState(event.movieId, event.query,event.pageNumber);
    }
  }

  Stream<MovieState> _mapMovieEventStateToState(
      int movieId, String query,int counter) async* {
    counter =apiCounter++;
    print(counter);
    final service = ApiService(counter);
    yield MovieLoading();
    try {
      List<Movie> movieList;
      print(movieId);
      if (movieId == 0) {
        movieList = (await service.getNowPlayingMovie())!;
      } else {
        //print(movieId);
        movieList = (await service.getNowPlayingMovie())!;
      }

      yield MovieLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield MovieError();
    }
  }
}