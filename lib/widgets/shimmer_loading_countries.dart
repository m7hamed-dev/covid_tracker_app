import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingCountries extends StatelessWidget {
  const ShimmerLoadingCountries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade300,
          child: Column(
            children: [
              index == 0
                  ? Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.all(15.0),
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.blue,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.blue,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
