import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';

import '../providers/data.dart';

class StateScreen extends StatelessWidget {
  static const routeName = '/state-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedState =
        Provider.of<Data>(context, listen: false).findById(id);
    final Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Deaths", () => selectedState.death.toDouble());
    dataMap.putIfAbsent("Active Cases", () => selectedState.active.toDouble());
    dataMap.putIfAbsent("Cured Cases", () => selectedState.cured.toDouble());
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedState.stateName),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32.0,
        chartRadius: MediaQuery.of(context).size.width *0.8,
        
        showChartValuesInPercentage: true,
        showChartValues: true,
        showChartValuesOutside: true,
        chartValueBackgroundColor: Colors.grey[200],
        colorList: [Colors.red, Colors.orangeAccent, Colors.greenAccent],
        showLegends: true,
        legendPosition: LegendPosition.bottom,
        decimalPlaces: 1,
        showChartValueLabel: true,
        initialAngle: 0,
        chartValueStyle: defaultChartValueStyle.copyWith(
          color: Colors.blueGrey[900].withOpacity(0.9),
        ),
        chartType: ChartType.disc,
    ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total Cases:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${selectedState.total}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total Deaths:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${selectedState.death}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Active Cases:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${selectedState.active}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Cured Cases:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${selectedState.cured}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
