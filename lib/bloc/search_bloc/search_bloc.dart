import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/search_bloc/search_bloc_events.dart';
import 'package:movie_app/bloc/search_bloc/search_bloc_state.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/services/movies_api.dart';



class SearchBloc extends Bloc<SearchEvent, SearchState> {

  int apiCounter = 1;

  SearchBloc() : super(SearchLoading());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchEventStarted) {
      yield* _mapMovieEventStateToState(event.movieId, event.query,event.pageNumber);
    }
  }

  Stream<SearchState> _mapMovieEventStateToState(
      int movieId, String query,int counter) async* {
    counter =apiCounter++;
    print(counter);
    final service = ApiService(counter);
    yield SearchLoading();
    try {
      List<Movie> movieList;
      print(movieId);
      if (movieId == 0) {
        movieList = (await service.searchForMovie() )!;
      } else {
        //print(movieId);
        movieList = (await service.searchForMovie() )!;
      }

      yield SearchLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield MovieError();
    }
  }
}