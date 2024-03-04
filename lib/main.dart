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
  List<FlSpot> data = [
    const FlSpot(1, 300000.9),
    const FlSpot(2, 299900.9),
    const FlSpot(3, 299800.9),
    const FlSpot(4, 299700.9),
    const FlSpot(5, 299600.9),
    const FlSpot(6, 299500.9),
    const FlSpot(7, 299400.9),
    const FlSpot(8, 2000),
    const FlSpot(9, 700000),
    const FlSpot(10, 15000),
    const FlSpot(11, 13000),
    const FlSpot(12, 430000),
    const FlSpot(13, 370000),
    const FlSpot(14, 1500),
    const FlSpot(15, 2000),
    const FlSpot(16, 70000),
    const FlSpot(17, 200000),
    const FlSpot(18, 30000),
    const FlSpot(19, 100000),
    const FlSpot(20, 7000),
    const FlSpot(21, 15000),
    const FlSpot(22, 13000),
    const FlSpot(23, 170000),
    const FlSpot(24, 15000),
    const FlSpot(25, 20000.10),
    const FlSpot(26, 70000),
    const FlSpot(27, 150000),
    const FlSpot(28, 603000),
    const FlSpot(29, 703000),
    const FlSpot(30, 17000),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF0F2F6),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 200,
            child: LineChart(
              // curve: Curves.easeInCubic,
              LineChartData(
                  lineTouchData: LineTouchData(
                      getTouchLineEnd: (barData, spotIndex) =>
                          barData.spots[spotIndex].y + 100000,
                      getTouchLineStart: (barData, spotIndex) => 0,
                      touchCallback: (event, touchResponse) {
                        if (event is FlTapUpEvent) {
                          // handle tap here
                        }
                      },
                      getTouchedSpotIndicator: (barData, spotIndexes) => [
                            TouchedSpotIndicatorData(
                                FlLine(
                                  dashArray: [4, 4],
                                  color: Colors.grey,
                                ),
                                FlDotData())
                          ],
                      touchTooltipData: LineTouchTooltipData(
                        maxContentWidth: 150,
                        tooltipRoundedRadius: 8,
                        fitInsideHorizontally: true,
                        tooltipBgColor: Colors.white,
                        getTooltipItems: (touchedSpots) {
                          return [
                            LineTooltipItem(
                                'May 9, 2023',
                                TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(text: '\nBalance'),
                                  TextSpan(
                                      text:
                                          "\nRs. ${touchedSpots[0].y.toString()}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))
                                ]),
                          ];
                        },
                      )),
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      // preventCurveOverShooting: true,
                      dotData: FlDotData(show: false),
                      isCurved: true,
                      color: Color(0xff0B72EB),
                      spots: data,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
