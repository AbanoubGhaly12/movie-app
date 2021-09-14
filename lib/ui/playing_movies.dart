import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc_event.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc_state.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/services/movies_api.dart';
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
          return MovieBloc()..add(MovieEventStarted(0, '', counter, refresh));
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
                bool refresh = true;

                return SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () {
                    refreshController.refreshCompleted();
                  },
                  onLoading: () {
                    BlocProvider.of<MovieBloc>(context)
                        .add(MovieEventStarted(0, '', counter, refresh));
                    refreshController.loadComplete();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, itemCount) {
                      Movie movie = movies[itemCount];

                      return ListTile(
                        onTap: () {
                          print(movie.title);

                          print(movie.overview);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                        voteAverage:
                                            movie.voteAverage.toString(),
                                        title: movie.originalTitle,
                                        description: movie.overview,
                                        voteCount: movie.voteCount,
                                        imageUrl: movie.backdropPath!,
                                        genre: movie.adult == false
                                            ? 'Family Movie'
                                            : '+18',
                                      )));
                        },
                        leading: CircleAvatar(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
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
                  child: Text('No Data Fetched'),
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}
