import 'package:flutter/material.dart';
import 'package:movie_app/ui/most_rated_movies.dart';
import 'package:movie_app/ui/playing_movies.dart';
import 'package:movie_app/ui/search_for_movie.dart';

class TabBarControllerWidget extends StatelessWidget {
  const TabBarControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        NowPlayingMovies(),
        MostRatedMovie(),
        SearchView(),
      ],
    );
  }
}