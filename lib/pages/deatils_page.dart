import 'dart:ui';

import 'package:covid_19/models/spacific_country_mode.dart';
import 'package:covid_19/panels/mosteffectedcountries.dart';
import 'package:covid_19/panels/worldwidepanel.dart';
import 'package:covid_19/widgets/card_counter.dart';
import 'package:covid_19/widgets/custom_cached_img.dart';
import 'package:covid_19/widgets/my_divider.dart';
import 'package:covid_19/widgets/symptoms_disease.dart';
import 'package:covid_19/widgets/tips_advice.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final SpacifcCountryCasesModel countryCasesModel;

  const DetailsPage({Key? key, required this.countryCasesModel})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double _height = 100.0;
  int _duration = 1000;
  Color _titleColor = Colors.amber;

  Future<void> changeHeight() async {
    await Future.delayed(const Duration(milliseconds: 1000)).then((_) {
      _height = 150.0;
      _titleColor = Colors.black.withOpacity(.2);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    changeHeight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     widget.countryCasesModel.country,
      //   ),
      // ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //
            SliverAppBar(
              elevation: 0.0,
              expandedHeight: 150,
              pinned: false,
              floating: true,
              title: AnimatedContainer(
                padding: const EdgeInsets.all(5.0),
                duration: Duration(milliseconds: _duration),
                decoration: BoxDecoration(
                  color: _titleColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(widget.countryCasesModel.country),
              ),
              flexibleSpace: CustomCachedImg(
                height: 150.0,
                imageUrl: widget.countryCasesModel.countryInfo.flag,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SymptomsDisease'),
                      const SymptomsDisease(),
                      //
                      const MyDivider(),
                      Text('advice'),
                      const TipsAdvice(),
                      CardCounter(data: widget.countryCasesModel),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
