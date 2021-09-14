import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/most_rated_bloc/most_rated_event.dart';
import 'package:movie_app/bloc/most_rated_bloc/most_rated_state.dart';

import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/bloc/most_rated_bloc/most_rated_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'movie_details.dart';

class MostRatedMovie extends StatefulWidget {
  const MostRatedMovie({Key? key}) : super(key: key);

  @override
  _MostRatedMovieState createState() => _MostRatedMovieState();
}

class _MostRatedMovieState extends State<MostRatedMovie> {
  var counter = 1;
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MostRatedMovieBloc>(
          create: (_) => MostRatedMovieBloc()
            ..add(MostRatedMovieEventStarted(0, '', counter)),
        ),
      ],
      child: Scaffold(
        body: Container(
          child: BlocBuilder<MostRatedMovieBloc, MovieMostRatedState>(
            builder: (context, state) {
              if (state is MovieMostRatedLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MostRatedMovieLoaded) {
                List<Movie> movies = state.mostRatedMovieList;
                bool refresh = true;

                return SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: ()  {

                    refreshController.refreshCompleted();

                  },
                  onLoading: ()  {

                    BlocProvider.of<MostRatedMovieBloc>(context)
                        .add(MostRatedMovieEventStarted(0, '', counter, ));
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
                                    voteAverage: movie.voteAverage.toString(),
                                    title: movie.originalTitle,
                                    description: movie.overview,
                                    voteCount: movie.voteCount,
                                    imageUrl: movie.backdropPath!,
                                    genre: movie.adult == false
                                        ? 'Family Movie'
                                        : '+18',
                                  )));
                        },
                        leading:movie.backdropPath != Null? CircleAvatar(
                          child: CachedNetworkImage(
                              imageUrl: 'https://image.tmdb.org/t/p/original/${movie.backdropPath}'),
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
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                    itemCount: movies.length ,
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
