import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey,
      child: Container(
        height: 50,
        width: 60,
        margin: const EdgeInsets.all(0.0),
        color: Colors.grey,
      ),
    );
  }
}
