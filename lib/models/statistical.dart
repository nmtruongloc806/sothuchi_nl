import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Statistical {
  final String day;
  final int total;
  final charts.Color barColor;

  Statistical(
      {@required this.day, @required this.total, @required this.barColor});

  static List<Statistical> getDataExample() {
    return [
      Statistical(
          day: "6/1",
          total: 10,
          barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple[200])),
      Statistical(
          day: "7/1",
          total: 10,
          barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple[200])),
      Statistical(
          day: "8/1",
          total: 105,
          barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple[200])),
      Statistical(
          day: "9/1",
          total: 105,
          barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple[200])),
      Statistical(
          day: "10/1",
          total: 105,
          barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple[200])),
      Statistical(
          day: "11/1",
          total: 105,
          barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple[200])),
      Statistical(
          day: "12/1",
          total: 105,
          barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple[200])),
    ];
  }
}
