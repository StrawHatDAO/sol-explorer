import 'package:charts_flutter/flutter.dart' as charts;

class TpsData {
  final int minutesAgo;
  final int tps;
  final charts.Color barColor;

  TpsData(
      {required this.minutesAgo, required this.tps, required this.barColor});
}
