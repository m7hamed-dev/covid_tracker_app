import 'package:covid_19/pages/countyPage.dart';
import 'package:covid_19/pages/swiper_page.dart';
import 'package:covid_19/panels/mosteffectedcountries.dart';
import 'package:covid_19/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datasorce.dart';
import 'models/spacific_country_mode.dart';
import 'models/world_cases_model.dart';
import 'panels/infoPanel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData = {};
  Future fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));
    final worldCasesModel = worldCasesModelFromJson(response.body);
    setState(() {
      worldData = worldCasesModel;
      // worldData = json.decode(response.body);
    });
  }

  // List countryData = [];
  List<SpacifcCountryCasesModel> countryData = [];
  Future fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    final _spacifcCountryCasesModel =
        spacifcCountryCasesModelFromJson(response.body);
    setState(() {
      countryData = _spacifcCountryCasesModel;
      // countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      //     IconButton(
      //         icon: Icon(Theme.of(context).brightness == Brightness.light
      //             ? Icons.lightbulb_outline
      //             : Icons.highlight),
      //         onPressed: () {
      //           // DynamicTheme.of(context).setBrightness(
      //           //     Theme.of(context).brightness == Brightness.light
      //           //         ? Brightness.dark
      //           //         : Brightness.light);
      //         })
      //   ],
      //   centerTitle: false,
      //   title: const Text('COVID-19 TRACKER'),
      // ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              elevation: 0.0,
              expandedHeight: 200.0,
              pinned: false,
              floating: true,
              // title: const Icon(Icons.person),
              flexibleSpace: SwiperPage(),
              // flexibleSpace: Container(
              //   // height: 100,
              //   // alignment: Alignment.center,
              //   // padding: const EdgeInsets.all(10),
              //   color: Colors.orange[100],
              //   child: Text(
              //     DataSource.quote,
              //     style: TextStyle(
              //       color: Colors.orange[800],
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CountryPage(),
                                  ),
                                );
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
                          ? const CircularProgressIndicator()
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
