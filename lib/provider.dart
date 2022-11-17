import 'package:flutter/cupertino.dart';
import 'package:provider_fetch4/service.dart';

import 'model.dart';

class DataProvider extends ChangeNotifier {
  ServiceClass _service = ServiceClass();
  DataModel? _datamodel;
  DataModel? get datamodel => _datamodel;

  Future<void> getDataProvider() async {
    final dataservice = await _service.getDataService();
    _datamodel = dataservice;

    notifyListeners();
  }
}
