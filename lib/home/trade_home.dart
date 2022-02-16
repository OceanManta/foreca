import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foreca/constants.dart';
import 'package:foreca/controllers/candles_controller.dart';
import 'package:foreca/loader.dart';
import 'package:foreca/models/candle.dart';
import 'package:foreca/models/statisitics.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TradeHome extends StatefulWidget {
  const TradeHome({Key? key}) : super(key: key);

  @override
  _TradeHomeState createState() => _TradeHomeState();
}

class _TradeHomeState extends State<TradeHome> {
  bool isCardView = true;
  bool _isLoading = true;
  Candles? candles;
  List<CandleData> candleData = [];
  bool _isLoadingStatistics = true;
  String selectedInst = 'BTCUSD';
  Statistic? statistics;
  ChartSeriesController? controller;
  int selectedIndex = 0;
  Timer? timer;
  double? average;

  List<String> instruments = [
    'BTCUSD',
    'LTCUSD',
    'ETHUSD',
    'BTCEUR',
    'LTCEUR',
    'ETHEUR',
    'LTCBTC',
    'LTCUSD',
    'LTCEUR',
    'ETHUSD',
    'ETHEUR',
    'ETHBTC',
  ];

  @override
  void initState() {
    super.initState();

    getCandles();
  }

  Future<void> getCandles() async {
    candles = await Provider.of<CandlesNotifier>(context, listen: false)
        .getCandles(selectedInst, 'S5');
    int index = 0;

    for (Candle candle in candles!.candles!) {
      candleData.add(CandleData(
        index: index++,
        ask: double.parse('${candle.average}'),
      ));
    }

    // setState(() {});
    getStatistics();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getStatistics() async {
    statistics = await Provider.of<CandlesNotifier>(context, listen: false)
        .getStatistics(selectedInst, 'S5');
    int index = 0;
    setAverage(statistics!);

    setState(() {
      _isLoadingStatistics = false;
    });
  }

  setAverage(Statistic statistic) async {
    average = (statistic.high! + statistic.low!) / 2;
  }

  Future<void> updateCandles() async {
    // candleData.clear();
    // Future.delayed(Duration(seconds: 5));
    int store = candleData.length;
    candles = await Provider.of<CandlesNotifier>(context, listen: false)
        .getCandles('BTCUSD', 'S5');
    await getStatistics();
    int index = 0;

    for (Candle candle in candles!.candles!) {
      candleData.add(CandleData(
        index: index++,
        ask: double.parse('${candle.average}'),
      ));
    }
    // candleData.removeAt(0);
    // store - candleData.length;

    // for (Candle candle in candles!.candles!) {
    print('updating');
    print(candleData.length);
    if (candleData.length == 23) {
      controller!.updateDataSource(
        addedDataIndexes: [candleData.length - 24],
        // removedDataIndexes: [0],
      );
    } else {
      candleData.removeRange(23, candleData.length - 1);
      controller!.updateDataSource(
        addedDataIndexes: [candleData.length - 23],
        removedDataIndexes: [0],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Text('Hi Mr Norman',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
                    ],
                  ),
                ),
                Text('Updates', style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 10),
                _isLoading ? Loader() : _buildDefaultLineChart(),
                Container(
                  constraints: BoxConstraints(minHeight: size.height * 0.1),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: klightButtonColor,
                  ),
                  child: _isLoadingStatistics == true
                      ? Center(child: Loader())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text('Statistics',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                              Divider(),
                              Row(
                                children: [
                                  Text('high'),
                                  Spacer(),
                                  Text('${statistics!.high}'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text('Low'),
                                  Spacer(),
                                  Text('${statistics!.low}'),
                                ],
                              ),
                              SizedBox(height: 10),
                              average != null
                                  ? Row(
                                      children: [
                                        Text('Average'),
                                        Spacer(),
                                        Text('${average!}'),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text('Open (Hour)'),
                                  Spacer(),
                                  Text('${statistics!.open}'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text('Changes (Hour)'),
                                  Spacer(),
                                  Text('${statistics!.close}'),
                                ],
                              )
                            ]),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  height: size.height * 0.2,
                  width: size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kLightPrimaryColor,
                  ),
                  child: GridView.builder(
                      itemCount: instruments.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 5,
                          childAspectRatio: 3),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              //update interface
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selectedIndex == index
                                    ? klightButtonColor
                                    : Colors.white,
                              ),
                              child: Text(
                                instruments[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )),
                )
              ],
            )),
      ),
    );
  }

  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'BTCUSD - Forex Candle'),
      legend: Legend(
          isVisible: isCardView ? false : true,
          overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          labelFormat: '\${value}',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<CandleData, num>> _getDefaultLineSeries() {
    return <LineSeries<CandleData, num>>[
      LineSeries<CandleData, num>(
        animationDuration: 2500,
        onRendererCreated: (controller) {
          this.controller = controller;
          timer = Timer.periodic(Duration(seconds: 5), (timer) {
            updateCandles();
          });
        },
        dataSource: candleData,
        xValueMapper: (CandleData c, _) => c.index,
        yValueMapper: (CandleData c, _) => c.ask,
        width: 2,
        // markerSettings: const MarkerSettings(isVisible: true),
      ),
      LineSeries<CandleData, num>(
        animationDuration: 2500,
        dataSource: candleData,
        width: 2,
        xValueMapper: (CandleData c, _) => c.index,
        yValueMapper: (CandleData c, _) => c.ask,
        // markerSettings: const MarkerSettings(isVisible: true),
      )
    ];
  }

  @override
  void dispose() {
    candleData.clear();
    timer!.cancel();
    super.dispose();
  }
}
