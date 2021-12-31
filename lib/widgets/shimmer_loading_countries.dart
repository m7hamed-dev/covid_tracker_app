import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingCountries extends StatelessWidget {
  const ShimmerLoadingCountries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade100,
          highlightColor: Colors.grey,
          child: Container(
            height: 100,
            margin: const EdgeInsets.all(10.0),
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
