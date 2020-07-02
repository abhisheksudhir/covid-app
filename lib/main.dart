import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/data.dart';
import './screens/state_list_screen.dart';
import './screens/state_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Data(),
      child: MaterialApp(
        title: 'Covid App',
        theme: ThemeData(
          // brightness: Brightness.light,
          primarySwatch: Colors.red,
          accentColor: Colors.orange,
        ),
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColor: Colors.black,
        //   accentColor: Colors.white,
        // ),
        home: StateListScreen(),
        routes: {
          StateScreen.routeName: (ctx) => StateScreen(),
        },
      ),
    );
  }
}
