import 'package:flutter/material.dart';

import 'cashed_images.dart';

class ImageContainer extends StatelessWidget {
  final String? imageUrl;
  ImageContainer({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(),
              child: MovieCachedImage(
                imageUrl: imageUrl,
              ),
            ),
          )
        : Container(
            child: Text('error loading'),
          );
  }
}
