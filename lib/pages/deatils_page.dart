import 'dart:ui';

import 'package:covid_19/models/spacific_country_mode.dart';
import 'package:covid_19/widgets/custom_cached_img.dart';
import 'package:covid_19/widgets/symptoms_disease.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final SpacifcCountryCasesModel countryCasesModel;

  const DetailsPage({Key? key, required this.countryCasesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     widget.countryCasesModel.country,
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            expandedHeight: 100.0,
            pinned: false,
            floating: true,
            title: Text(countryCasesModel.country),
            flexibleSpace: SizedBox(
              height: 100.0,
              // child: Wrap(
              child: ListView(
                children: [
                  CustomCachedImg(
                    height: 50.0,
                    imageUrl: countryCasesModel.countryInfo.flag,
                    // height: 50,
                    // width: 60,
                  ),
                  // Row(
                  //   children: [
                  //     Counter(number: 1, color: Colors.amber, title: 'title'),
                  //     Counter(number: 1, color: Colors.amber, title: 'title'),
                  //     Counter(number: 1, color: Colors.amber, title: 'title'),
                  //     Counter(number: 1, color: Colors.amber, title: 'title'),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Row(
          //         children: [
          //           Counter(number: 1, color: Colors.amber, title: 'title'),
          //           Counter(number: 1, color: Colors.amber, title: 'title'),
          //           Counter(number: 1, color: Colors.amber, title: 'title'),
          //           Counter(number: 1, color: Colors.amber, title: 'title'),
          //         ],
          //       );
          //     },
          //     childCount: 1,
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    const SymptomsDisease(),
                    const SymptomsDisease(),
                    const SymptomsDisease(),
                    const SymptomsDisease(),
                    const SymptomsDisease(),
                    const SymptomsDisease(),
                    const SymptomsDisease(),
                    const SymptomsDisease(),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Text(
          //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          //       );
          //     },
          //     childCount: 11,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Counter({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(
          title,
          // style: kSubTextStyle,
        ),
      ],
    );
  }
}
