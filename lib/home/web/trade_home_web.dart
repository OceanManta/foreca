import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foreca/constants.dart';
import 'package:foreca/controllers/candles_controller.dart';
import 'package:foreca/loader.dart';
import 'package:foreca/models/candle.dart';
import 'package:foreca/models/statisitics.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TradeHomeWeb extends StatefulWidget {
  const TradeHomeWeb({Key? key}) : super(key: key);

  @override
  _TradeHomeWebState createState() => _TradeHomeWebState();
}

class _TradeHomeWebState extends State<TradeHomeWeb> {
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
    // get candles from API
    candles = await Provider.of<CandlesNotifier>(context, listen: false)
        .getCandles(selectedInst, 'S5');
    int index = 0;

    // get candle data so that the table can be rendered.
    for (Candle candle in candles!.candles!) {
      candleData.add(CandleData(
        index: index++,
        ask: double.parse('${candle.average}'),
      ));
    }

    getStatistics();
    //update interface
    setState(() {
      _isLoading = false;
    });
  }

  // get the statistics

  Future<void> getStatistics() async {
    statistics = await Provider.of<CandlesNotifier>(context, listen: false)
        .getStatistics(selectedInst, 'S5');
    int index = 0;
    setAverage(statistics!);

    //update interface
    setState(() {
      _isLoadingStatistics = false;
    });
  }

  // caculate average.
  setAverage(Statistic statistic) async {
    average = (statistic.high! + statistic.low!) / 2;
  }

  Future<void> updateCandles() async {
    // get candles from API
    candles = await Provider.of<CandlesNotifier>(context, listen: false)
        .getCandles('BTCUSD', 'S5');
    await getStatistics();
    int index = 0;

    // get candle data so that the table can be rendered.
    for (Candle candle in candles!.candles!) {
      candleData.add(CandleData(
        index: index++,
        ask: double.parse('${candle.average}'),
      ));
    }

    // input table data from candle data so that the table can be rendered.
    if (candleData.length == 23) {
      controller!.updateDataSource(
        addedDataIndexes: [candleData.length - 24],
      );
    } else {
      candleData.removeRange(23, candleData.length - 1);
      controller!.updateDataSource(
        addedDataIndexes: [candleData.length - 23],
        removedDataIndexes: [0],
      );
    }
  }

  //render on the screen

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SafeArea(
          child: Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: klightButtonColor,
                    ),
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
                  Divider(),
                  Text('Updates', style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 10),
                  SizedBox(
                    width: size.width,
                    height: constraints.maxWidth <= 1200
                        ? size.height * 0.7
                        : size.height * 0.5,
                    child: constraints.maxWidth <= 1200
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: size.height * 0.3,
                                  child: buildGraph()),
                              Container(
                                width: size.width,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: klightButtonColor,
                                ),
                                child: _isLoadingStatistics == true
                                    ? Center(child: Loader())
                                    : buildStats(),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                height: size.height * 0.15,
                                width: size.width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kLightPrimaryColor,
                                ),
                                child: GridView.builder(
                                    itemCount: instruments.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 3,
                                            mainAxisSpacing: 5,
                                            childAspectRatio: 3),
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: selectedIndex == index
                                                  ? klightButtonColor
                                                  : Colors.white,
                                            ),
                                            child: Text(
                                              instruments[index],
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )),
                              )
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: constraints.maxWidth <= 1200
                                        ? size.width
                                        : size.width * 0.2,
                                    height: size.height * 0.2,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: klightButtonColor,
                                    ),
                                    child: _isLoadingStatistics == true
                                        ? Center(child: Loader())
                                        : buildStats(),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: constraints.maxWidth <= 1200
                                        ? size.height * 0.5
                                        : size.height * 0.25,
                                    width: size.width * 0.2,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kLightPrimaryColor,
                                    ),
                                    child: GridView.builder(
                                        itemCount: instruments.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 3,
                                                mainAxisSpacing: 3,
                                                childAspectRatio: 3),
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: selectedIndex == index
                                                      ? klightButtonColor
                                                      : Colors.white,
                                                ),
                                                child: Text(
                                                  instruments[index],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            )),
                                  )
                                ],
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                  height: size.height * 0.5,
                                  width: size.width * 0.7,
                                  child: buildGraph()),
                            ],
                          ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: klightButtonColor,
                    ),
                    child: Column(children: [
                      Text('Prices',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ]),
                  )
                ],
              )),
        );
      }),
    );
  }

  Widget buildStats() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Statistics',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
              )),
      Divider(),
      Row(
        children: [
          Text('high'),
          Spacer(),
          Text('\$${statistics!.high}'),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Text('Low'),
          Spacer(),
          Text('\$${statistics!.low}'),
        ],
      ),
      SizedBox(height: 10),
      average != null
          ? Row(
              children: [
                Text('Changes (Hour)'),
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
          Text('\$${statistics!.open}'),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Text('Current Changes (Hour)'),
          Spacer(),
          Text('\$${statistics!.close}'),
        ],
      )
    ]);
  }

  Widget buildGraph() {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: klightButtonColor.withOpacity(0.1),
            ),
            child: _isLoading ? Loader() : _buildDefaultLineChart()));
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
        animationDuration: 21200,
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
        animationDuration: 21200,
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
