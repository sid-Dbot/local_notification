import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:new_notification/noti.dart';

import 'package:fl_chart/fl_chart.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(const MyApp());
// }

import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF0F2F6),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 300,
            child: LineChart(
              // curve: Curves.easeInCubic,
              LineChartData(
                  lineTouchData: LineTouchData(
                      getTouchLineEnd: (barData, spotIndex) =>
                          barData.spots[spotIndex].y + 5,
                      getTouchLineStart: (barData, spotIndex) =>
                          barData.spots[spotIndex].y - 5,
                      getTouchedSpotIndicator: (barData, spotIndexes) => [
                            TouchedSpotIndicatorData(
                                FlLine(dashArray: [4, 4], color: Colors.grey),
                                FlDotData())
                          ],
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.white,
                        getTooltipItems: (touchedSpots) {
                          return [
                            LineTooltipItem(
                                'May 9, 2023',
                                TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400)),
                          ];
                        },
                      )),
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                        dotData: FlDotData(show: false),
                        isCurved: true,
                        color: Color(0xff0B72EB),
                        spots: [
                          const FlSpot(0, 20),
                          const FlSpot(1, 3),
                          const FlSpot(2, 10),
                          const FlSpot(3, 7),
                          const FlSpot(4, 15),
                          const FlSpot(5, 13),
                          const FlSpot(6, 17),
                          const FlSpot(7, 15),
                          const FlSpot(8, 2)
                        ])
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
