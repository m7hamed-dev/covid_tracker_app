import 'package:covid_19/api/api_method.dart';
import 'package:flutter/material.dart';

class ApiProvider extends APIsMethod with ChangeNotifier {
  @override
  Future create() async {
    return 1;
  }

  @override
  Future getALL() async {}

  @override
  Future getOne() async {}
}
