import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWorldWide extends StatelessWidget {
  const ShimmerWorldWide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 3.0,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade100,
          highlightColor: Colors.grey,
          child: Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
