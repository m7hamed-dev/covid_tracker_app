import 'package:covid_19/pages/swiper_page.dart';
import 'package:covid_19/panels/mosteffectedcountries.dart';
import 'package:covid_19/panels/worldwidepanel.dart';
import 'package:covid_19/tools/constants.dart';
import 'package:covid_19/tools/txt_style.dart';
import 'package:covid_19/widgets/shimmer_world_wide.dart';
import 'package:covid_19/widgets/symptoms_disease.dart';
import 'package:covid_19/widgets/tips_advice.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datasorce.dart';
import 'models/spacific_country_mode.dart';
import 'models/world_cases_model.dart';
import 'pages/county_page.dart';
import 'panels/infoPanel.dart';
import 'tools/push.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData = {};
  bool _isError = false;
  String _error = '';
  Future<void> fetchWorldWideData() async {
    try {
      http.Response response =
          await http.get(Uri.parse(Constants.uriWorldWide));
      final worldCasesModel = worldCasesModelFromJson(response.body);
      worldData = worldCasesModel;
    } catch (e) {
      _isError = true;
      _error = 'connection error !!';
      setState(() {});
    }
  }

  List<SpacifcCountryCasesModel> countryData = [];
  Future<void> fetchCountryData() async {
    http.Response response =
        await http.get(Uri.parse(Constants.uriAllCountries));
    final _spacifcCountryCasesModel =
        spacifcCountryCasesModelFromJson(response.body);
    // countryData = _spacifcCountryCasesModel;
    setState(() {});
  }

  Future<void> fetchData() async {
    await fetchWorldWideData();
    await fetchCountryData();
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
      backgroundColor: Colors.white,
      body: _isError
          ? InternetErrorWidget(error: _error)
          : SafeArea(
              child: RefreshIndicator(
                onRefresh: fetchData,
                child: CustomScrollView(
                  slivers: [
                    // appbar
                    const SliverAppBar(
                      elevation: 0.0,
                      expandedHeight: 200.0,
                      pinned: false,
                      floating: true,
                      flexibleSpace: SwiperPage(),
                    ),
                    //
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Text(
                                      'Worldwide',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: _goToCountryPage,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: primaryBlack,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
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
                              // data
                              worldData.isEmpty
                                  ? const ShimmerWorldWide()
                                  : WorldwidePanel(worldData: worldData),
                              //
                              const SymptomsDisease(),
                              //
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  'TipsAdvice',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const TipsAdvice(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  'Most affected Countries',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
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
            ),
    );
  }

  void _goToCountryPage() {
    Push.toPage(context, const CountryPage());
  }
}

class InternetErrorWidget extends StatelessWidget {
  const InternetErrorWidget({
    Key? key,
    required String error,
  })  : _error = error,
        super(key: key);

  final String _error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _error,
        style: TxtStyle.style(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
