import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/text_style.dart';

import 'image container.dart';

class DetailedColumn extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final int voteCount;
  final String voteAverage;
  final String genre;
  DetailedColumn(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.voteCount,
      required this.voteAverage,
      required this.genre});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageContainer(
          imageUrl: imageUrl,
        ),
        SizedBox(
          height: 10,
        ),
        Text('Movie Name: $title',style: textStyle,),
        SizedBox(
          height: 10,
        ),
        Text('Vote Average: $voteAverage',style: textStyle,),
        SizedBox(
          height: 10,
        ),
        Text('Number of Voters: $voteCount',style: textStyle),
        SizedBox(
          height: 10,
        ),
        Text('Genre: $genre' ,style: textStyle),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Text(
            'Movie Description: $description',
            style: textStyle.copyWith(fontSize: 15,),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
