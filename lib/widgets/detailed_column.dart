import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/text_style.dart';
import 'package:movie_app/models/movie_details.dart';

import 'image container.dart';

class DetailedColumn extends StatelessWidget {

  MovieDetailsProvider movieProvider ;


  DetailedColumn(
      {
      required this.movieProvider,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageContainer(
          imageUrl: movieProvider.imageUrl,
        ),
        SizedBox(
          height: 10,
        ),
        Text('Movie Name: ${movieProvider.title}',style: textStyle,),
        SizedBox(
          height: 10,
        ),
        Text('Vote Average: ${movieProvider.voteAverage}',style: textStyle,),
        SizedBox(
          height: 10,
        ),
        Text('Number of Voters: ${movieProvider.voteCount}',style: textStyle),
        SizedBox(
          height: 10,
        ),
        Text('Genre: ${movieProvider.genre}' ,style: textStyle),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Text(
            'Movie Description: ${movieProvider.description}',
            style: textStyle.copyWith(fontSize: 15,),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
