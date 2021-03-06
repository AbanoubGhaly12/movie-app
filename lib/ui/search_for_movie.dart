import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/search_bloc/search_bloc.dart';
import 'package:movie_app/bloc/search_bloc/search_bloc_events.dart';
import 'package:movie_app/bloc/search_bloc/search_bloc_state.dart';
import 'package:movie_app/models/movie_details.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/widgets/cashed_images.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'movie_details.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int counter = 0;
  bool refresh = true;
  var item ;


  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(create: (_) {
          return SearchBloc()..add(SearchEventStarted(0, '', counter,));
        }),
      ],
      child: Scaffold(
        body: Container(
          child:
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SearchLoaded) {
                      List<Movie> movies = state.searchList;

                      return Column(
                        children: [
                          TextField(onChanged: (value){}),

                          Expanded(
                            child: SmartRefresher(
                              controller: refreshController,
                              enablePullUp: true,
                              onRefresh: () {
                                refreshController.refreshCompleted();
                              },
                              onLoading: () {
                                //fetching more data
                                BlocProvider.of<SearchBloc>(context)
                                    .add(SearchEventStarted(0, '', counter, ));
                                refreshController.loadComplete();
                              },
                              child: ListView.separated(
                                itemBuilder: (context, itemCount) {
                                  Movie movie = movies[itemCount];
                                  item = movie;

                                  return ListTile(
                                    onTap: () {
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
                                    leading: CircleAvatar(
                                      child: MovieCachedImage(imageUrl: movie.backdropPath,),
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
                            ),
                          ),
                        ],
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
