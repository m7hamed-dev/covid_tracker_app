import 'package:covid_19/models/spacific_country_mode.dart';
import 'package:covid_19/pages/deatils_page.dart';
import 'package:covid_19/tools/push.dart';
import 'package:covid_19/tools/txt_style.dart';
import 'package:covid_19/widgets/custom_cached_img.dart';
import 'package:covid_19/widgets/shimmer_image.dart';
import 'package:covid_19/widgets/shimmer_loading_countries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  var _error = '';
  List<SpacifcCountryCasesModel> countryData = [];
  List<SpacifcCountryCasesModel> _searchCountryData = [];
  bool isError = false;
  fetchCountryData() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries'));
      final spacifcCountryCasesModel =
          spacifcCountryCasesModelFromJson(response.body);
      _searchCountryData = countryData = spacifcCountryCasesModel;
      setState(() {});
    } catch (e) {
      _error = e.toString();
      isError = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCountryData();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     showSearch(context: context, delegate: Search(countryData));
          //   },
          // )
        ],
        // title: const Text('Country Stats'),
        title: Text('${_searchCountryData.length}'),
      ),
      body: isError
          ? Center(
              child: Text(_error),
            )
          : countryData.isEmpty
              ? const Center(
                  child: ShimmerLoadingCountries(),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: _onChangeVlue,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                width: 1.0,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type in your text",
                          fillColor: Colors.white70,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: _searchCountryData.length,
                        itemBuilder: (context, index) {
                          return CardCountryStatistics(
                            countryCasesModel: _searchCountryData[index],
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          thickness: 10.0,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

  void _onChangeVlue(value) {
    _searchCountryData = _searchController.text.isEmpty
        ? countryData
        : countryData.where((e) {
            if (e.country.toLowerCase().contains(value)) {
              return true;
            }
            return false;
          }).toList();
    setState(() {});
  }
}

class CardCountryStatistics extends StatelessWidget {
  const CardCountryStatistics({
    Key? key,
    required this.countryCasesModel,
  }) : super(key: key);

  final SpacifcCountryCasesModel countryCasesModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _goToDetailsPage(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: 200,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomCachedImg(
                    imageUrl: countryCasesModel.countryInfo.flag,
                    placeHolder: const ShimmerImage(),
                    height: 50,
                    width: 60,
                  ),
                  Text(
                    countryCasesModel.country,
                    style: TxtStyle.style(),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: const <Widget>[
                // Text(
                //   'CONFIRMED:' +
                //       countryData[index]['cases']
                //           .toString(),
                //   style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.red),
                // ),
                // Text(
                //   'ACTIVE:' +
                //       countryData[index]['active']
                //           .toString(),
                //   style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.blue),
                // ),
                // Text(
                //   'RECOVERED:' +
                //       countryData[index]['recovered']
                //           .toString(),
                //   style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.green),
                // ),
                // Text(
                //   'DEATHS:' +
                //       countryData[index]['deaths']
                //           .toString(),
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Theme.of(context).brightness ==
                //               Brightness.dark
                //           ? Colors.grey[100]
                //           : Colors.grey[900]),
                // ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  void _goToDetailsPage(BuildContext context) {
    Push.toPage(context, DetailsPage(countryCasesModel: countryCasesModel));
  }
}
