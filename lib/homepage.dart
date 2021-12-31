import 'package:covid_19/pages/countyPage.dart';
import 'package:covid_19/pages/swiper_page.dart';
import 'package:covid_19/panels/mosteffectedcountries.dart';
import 'package:covid_19/panels/worldwidepanel.dart';
import 'package:covid_19/widgets/shimmer_world_wide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datasorce.dart';
import 'models/spacific_country_mode.dart';
import 'models/world_cases_model.dart';
import 'panels/infoPanel.dart';
import 'tools/push.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData = {};
  Future fetchWorldWideData() async {
    // await Future.delayed(Duration(seconds: 5));
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));
    final worldCasesModel = worldCasesModelFromJson(response.body);
    worldData = worldCasesModel;
    // setState(() {});
  }

  // List countryData = [];
  List<SpacifcCountryCasesModel> countryData = [];
  Future fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    final _spacifcCountryCasesModel =
        spacifcCountryCasesModelFromJson(response.body);
    // countryData = _spacifcCountryCasesModel;
    setState(() {});
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
    // print('fetchData called');
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              elevation: 0.0,
              expandedHeight: 200.0,
              pinned: false,
              floating: true,
              flexibleSpace: SwiperPage(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Worldwide',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Push.toPage(context, const CountryPage());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: primaryBlack,
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Regional',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      worldData.isEmpty
                          ? const ShimmerWorldWide()
                          : WorldwidePanel(
                              worldData: worldData,
                            ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Most affected Countries',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      countryData.isEmpty
                          ? Container()
                          : MostAffectedPanel(
                              countryData: countryData,
                            ),
                      const InfoPanel(),
                      const SizedBox(height: 20),
                      const Center(
                          child: Text(
                        'WE ARE TOGETHER IN THE FIGHT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                      const SizedBox(height: 50)
                    ],
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
