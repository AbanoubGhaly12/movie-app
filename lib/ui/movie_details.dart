import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_details.dart';
import 'package:movie_app/widgets/detailed_column.dart';

class MovieDetails extends StatelessWidget {

  MovieDetailsProvider movieProvider ;

  MovieDetails(
      {
      required this.movieProvider});
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        left: true,
        right: true,
        child: Container(
          margin: EdgeInsets.all(10),
          child: DetailedColumn(
            movieProvider: movieProvider,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: flag?Icon(
          Icons.favorite_outline,
          color: Colors.white,
        ):Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
    );


  }
}
