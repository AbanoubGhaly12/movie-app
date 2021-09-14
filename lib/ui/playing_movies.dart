import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc_event.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc_state.dart';
import 'package:movie_app/models/movie_details.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/widgets/cashed_images.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'movie_details.dart';

class NowPlayingMovies extends StatefulWidget {
  const NowPlayingMovies({Key? key}) : super(key: key);

  @override
  _NowPlayingMoviesState createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  int counter = 0;
  bool refresh = true;


  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(create: (_) {
          return MovieBloc()..add(MovieEventStarted(0, '', counter, ));
        }),
      ],
      child: Scaffold(
        body: Container(
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieLoaded) {
                List<Movie> movies = state.movieList;

                return SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () {
                    refreshController.refreshCompleted();
                  },
                  onLoading: () {
                    BlocProvider.of<MovieBloc>(context)
                        .add(MovieEventStarted(0, '', counter, ));
                    refreshController.loadComplete();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, itemCount) {
                      Movie movie = movies[itemCount];

                      return ListTile(
                        onTap: () {
                          print(movie.title);

                          print(movie.overview);
                          MovieDetailsProvider movieProvider = MovieDetailsProvider(imageUrl: movie.backdropPath, title: movie.title, description: movie.overview, voteCount: movie.voteCount, voteAverage: movie.voteAverage!, genre: movie.adult == false
                              ? 'Family Movie'
                              : '+18',);





                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                        movieProvider: movieProvider,
                                      )));
                        },
                         leading:movie.backdropPath != null? CircleAvatar(
                      child: MovieCachedImage(imageUrl: movie.backdropPath,),
                      backgroundColor: Colors.transparent,
                      ):Icon(Icons.error_outline),
                        title: Text(movie.title),
                        subtitle: Text('Vote Average:${movie.voteAverage}'),
                        trailing: IconButton(
                          onPressed: () {
                            print(movie.overview);
                          },
                          icon: Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                    itemCount: movies.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                );
              } else {
                return Center(
                    child: Container(
                      child: Icon(Icons.error_outline),
                    ));
              }
            },
          ),
        ),
      ),
    );
  }
}
