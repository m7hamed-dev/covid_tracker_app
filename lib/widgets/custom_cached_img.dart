import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImg extends StatelessWidget {
  const CustomCachedImg({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.placeHolder,
  }) : super(key: key);
  final String imageUrl;
  final double? width;
  final double? height;
  final Widget? placeHolder;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 40,
      height: height ?? 40,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) =>
          placeHolder ?? const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
