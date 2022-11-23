import 'package:explorer/widgets/tps_chart.dart';
import 'package:explorer/widgets/tps_data.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatefulWidget {
  final List<TpsData> data;
  const BarGraph({super.key, required this.data});

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Transactions Per Second by 1 minute",
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(child: TpsChart(data: widget.data)),
          ],
        ),
      ),
    );
  }
}
