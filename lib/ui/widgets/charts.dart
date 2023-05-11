import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderWidth: 0,
      primaryXAxis: CategoryAxis(
        axisLine: const AxisLine(
          dashArray: <double>[5, 5],
        ),
        isVisible: false,
      ),
      primaryYAxis: CategoryAxis(
        axisLine: const AxisLine(
          dashArray: <double>[5, 5],
        ),
        isVisible: false,
      ),
      enableAxisAnimation: true,
      plotAreaBorderWidth: 0,
      series: <ChartSeries>[
        LineSeries<ChartData, int>(
          dataSource: chartData,
          color: Colors.white,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}

final List<ChartData> chartData = [
  ChartData(2010, 35),
  ChartData(2011, 28),
  ChartData(2012, 34),
  ChartData(2013, 32),
  ChartData(2014, 40),
  ChartData(2016, 33),
  ChartData(2018, 53),
  ChartData(2020, 75),
  ChartData(2022, 54),
  ChartData(2024, 40)
];
