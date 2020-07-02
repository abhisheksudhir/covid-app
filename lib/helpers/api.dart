import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static dynamic getAllStatesData() async{
    // final url = 'https://api.covidindiatracker.com/state_data.json';
    final url = 'http://covid19-india-adhikansh.herokuapp.com/states';
    final response = await http.get(url);
    // print(json.decode(response.body));
    return json.decode(response.body);
  }
}
