import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class MovieCachedImage extends StatelessWidget {
  final String? imageUrl;
  MovieCachedImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: 'https://image.tmdb.org/t/p/original/$imageUrl',);
  }
}
