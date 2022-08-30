import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (_, __) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (_, __, ___) {
        return const Center(
          child: Text('An error occurred'),
        );
      },
    );
  }
}
