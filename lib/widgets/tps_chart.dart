import 'package:explorer/widgets/tps_data.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TpsChart extends StatelessWidget {
  final List<TpsData> data;

  const TpsChart({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<TpsData, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (TpsData data, _) => data.minutesAgo.toString(),
          measureFn: (TpsData data, _) => data.tps,
          colorFn: (TpsData data, _) => data.barColor)
    ];

    return charts.BarChart(series, animate: true);
  }
}
