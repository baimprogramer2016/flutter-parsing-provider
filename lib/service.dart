import 'dart:convert';

import 'package:flutter/services.dart';

import 'model.dart';

class ServiceClass {
  Future<DataModel> getDataService() async {
    String json = await rootBundle.loadString("assets/data.json");
    final datajson = jsonDecode(json);

    DataModel datamodel = DataModel.fromJson(datajson);

    return datamodel;
  }
}
