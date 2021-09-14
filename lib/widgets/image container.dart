import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  ImageContainer({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(),
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/original/$imageUrl',
        ),
      ),
    );
  }
}
