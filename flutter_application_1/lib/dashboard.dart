import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<charts.Series<MonthData, String>> _createAverageWashData() {
    final data = [
      MonthData('January', 24),
      MonthData('February', 26),
      MonthData('March', 20),
    ];

    return [
      charts.Series<MonthData, String>(
        id: 'Average Wash Cycles',
        domainFn: (MonthData sales, _) => sales.month,
        measureFn: (MonthData sales, _) => sales.amount.toDouble(),
        data: data,
        // Different colors for each bar based on index
        colorFn: (MonthData sales, int? index) {
          // Check if index is not null before using %
          if (index != null) {
            switch (index % 3) {
              case 0:
                return charts.ColorUtil.fromDartColor(Color(int.parse('0xFF089AE3')));
              case 1:
                return charts.ColorUtil.fromDartColor(Color(int.parse('0xFF1452A7')));
              case 2:
                return charts.ColorUtil.fromDartColor(Color(int.parse('0xFF7732CD')));
              default:
                return charts.MaterialPalette.blue.shadeDefault;
            }
          }
          // Default color if index is null (though should not happen in this case)
          return charts.MaterialPalette.blue.shadeDefault;
        },
        // Label accessor to display the amount on top of each bar
        labelAccessorFn: (MonthData row, _) => '${row.amount}',
      ),
    ];
  }

  List<charts.Series<MonthData, String>> _createAverageDryData() {
    final data = [
      MonthData('January', 18),
      MonthData('February', 20),
      MonthData('March', 15),
    ];

    return [
     charts.Series<MonthData, String>(
        id: 'Average Dry Income',
        domainFn: (MonthData sales, _) => sales.month,
        measureFn: (MonthData sales, _) => sales.amount.toDouble(),
        data: data,

        colorFn: (MonthData sales, int? index) {
          // Check if index is not null before using %
          if (index != null) {
            switch (index % 3) {
              case 0:
                return charts.ColorUtil.fromDartColor(Color(int.parse('0xFF089AE3')));
              case 1:
                return charts.ColorUtil.fromDartColor(Color(int.parse('0xFF1452A7')));
              case 2:
                return charts.ColorUtil.fromDartColor(Color(int.parse('0xFF7732CD')));
              default:
                return charts.MaterialPalette.blue.shadeDefault;
            }
          }
          // Default color if index is null (though should not happen in this case)
          return charts.MaterialPalette.blue.shadeDefault;
        },
        // Label accessor to display the amount on top of each bar
        labelAccessorFn: (MonthData row, _) => '${row.amount}',
      ),
    ];
  }

  late Stream<QuerySnapshot> incomeDataStream;

  @override
  void initState() {
    super.initState();
    incomeDataStream = FirebaseFirestore.instance.collection('cycle').snapshots();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Dashboard'),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            'Real-time Income Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream: incomeDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DocumentSnapshot> docs = snapshot.data!.docs;

                double totalDryIncome = 0;
                double totalWashIncome = 0;
                double totalIncome = 0;

                for (var doc in docs) {
                  totalDryIncome += (doc['dry income'] ?? 0).toDouble();
                  totalWashIncome += (doc['wash income'] ?? 0).toDouble();
                  totalIncome += (doc['total income'] ?? 0).toDouble();
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIncomeCard('Dry Income', totalDryIncome, Colors.black),
                    _buildIncomeCard('Wash Income', totalWashIncome, Colors.black),
                    _buildIncomeCard('Total Income', totalIncome, Colors.black),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            'Average Wash Cycles',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: charts.BarChart(
              _createAverageWashData(),
              animate: true,
              vertical: true,
              barRendererDecorator: charts.BarLabelDecorator<String>(),
              domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.SmallTickRendererSpec(labelRotation: 0)),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Average Dry Cycles',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: charts.BarChart(
              _createAverageDryData(),
              animate: true,
              vertical: true,
              barRendererDecorator: charts.BarLabelDecorator<String>(),
              domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.SmallTickRendererSpec(labelRotation: 0)),
            ),
          ),
        ],
      ),
    ),
  );
}
}


Widget _buildIncomeCard(String title, double amount, Color color) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Rp ${amount.toStringAsFixed(0).replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match m) => '${m[1]},',
            )}',
            style: TextStyle(fontSize: 18, color: color),
          ),
        ],
      ),
    ),
  );
}

class MonthData {
  final String month;
  final int amount;

  MonthData(this.month, this.amount);
}

// void main() {
//   runApp(MaterialApp(
//     home: dashboard(),
//   ));
// }
