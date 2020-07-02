import 'package:flutter/material.dart';

import '../models/state.dart';
import '../helpers/api.dart';

class Data with ChangeNotifier {
  List<States> _items = [];

  List<States> get items {
    return [..._items];
  }

  States findById(String id) {
    return _items.firstWhere((state) => state.id == id);
  }

  int get itemCount {
    // print(_items.length);
    return _items.length;
  }

  Future<void> fetchStates() async {
    final dataList = await Api.getAllStatesData();
    // print(dataList.values);
    // print(dataList.map().toList());
    // print(dataList.runtimeType);
    // print(dataList['state']);
    dataList['state'].forEach((item) => _items.add(States(
          stateName: item['name'],
          id: item['_id'],
          active: item['active'],
          cured: item['cured'],
          death: item['death'],
          total: item['total'],
        )));
    // for maps
    // dataList.forEach((k, v) => _items.add(States(stateName: k, data: v)));
    // dataList.entries.forEach((e) => _items.add(States(stateName: e.key, data: e.value)));
    notifyListeners();
  }
}
