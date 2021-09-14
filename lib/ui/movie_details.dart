import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/detailed_column.dart';

class MovieDetails extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final int voteCount;
  final String voteAverage;
  final String genre;
  MovieDetails(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.voteCount,
      required this.voteAverage,
      required this.genre});

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
            genre: genre,
            title: title,
            imageUrl: imageUrl,
            voteCount: voteCount,
            voteAverage: voteAverage,
            description: description,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.favorite_outline,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
