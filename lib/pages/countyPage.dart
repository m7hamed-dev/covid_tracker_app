import 'package:covid_19/models/spacific_country_mode.dart';
import 'package:covid_19/pages/deatils_page.dart';
import 'package:covid_19/widgets/shimmer_loading_countries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<SpacifcCountryCasesModel> countryData = [];
  List<SpacifcCountryCasesModel> _searchCountryData = [];

  fetchCountryData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries'));
    setState(() {
      final spacifcCountryCasesModel =
          spacifcCountryCasesModelFromJson(response.body);
      _searchCountryData = countryData = spacifcCountryCasesModel;
      // searchCountryData = countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
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
      body: countryData.isEmpty
          ? const Center(
              child: ShimmerLoadingCountries(),
            )
          : Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    _searchCountryData = _searchController.text.isEmpty
                        ? countryData
                        : countryData.where((e) {
                            if (e.country.contains(value)) {
                              return true;
                            }
                            return false;
                          }).toList();
                    setState(() {});
                  },
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
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DetailsPage(
              countryCasesModel: countryCasesModel,
            );
          },
        ));
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
                  Image.network(
                    countryCasesModel.countryInfo.flag,
                    height: 50,
                    width: 60,
                  ),
                  Text(
                    countryCasesModel.country,
                    style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        ),
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
}
