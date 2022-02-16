import 'package:flutter/material.dart';
import 'package:foreca/controllers/api.dart';
import 'package:foreca/models/candle.dart';
import 'package:foreca/models/statisitics.dart';
import 'package:intl/intl.dart';

class CandlesNotifier with ChangeNotifier {
  Candles? candles;
  Statistic? statistics;

  set setCandles(Candles? candles) => this.candles = candles;

  Future<Candles?> getCandles(String instruments, String granularity) async {
    // get data from API from the past 1 day
    final today = DateFormat('mm,HH,dd').format(DateTime.now());
    DateTime date = DateTime.now().subtract(Duration(days: 1));
    var dateSince = date.millisecondsSinceEpoch / 1000;

    final url =
        'https://apiv2.bitcoinaverage.com/indices/global/history/$instruments?since=$dateSince&resolution=hour';

    try {
      // get request
      final response = await ApiRequest(url: url, data: null).get();
      // print(response);
      candles = Candles.fromJson(response); // convert json into a candle object
      notifyListeners();
      return candles;
    } catch (error) {
      throw Exception('Exceptiob occured with error $error');
    }
  }

  Future<Statistic?> getStatistics(
      String instruments, String granularity) async {
    final today = DateFormat('mm,HH,dd').format(DateTime.now());
    DateTime date = DateTime.now().subtract(Duration(days: 1));
    var dateSince = date.millisecondsSinceEpoch / 1000;

    final url =
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$instruments';
    // 'https://apiv2.bitcoinaverage.com/exchanges/history/ohlc/bitstamp/$instruments';

    // try {
    final response = await ApiRequest(url: url, data: null).get();
    print(response);
    statistics =
        Statistic.fromJson(response); // convert json into a statistics object
    notifyListeners();
    return statistics!;
    // } catch (error) {
    //   throw Exception('Exceptiob occured with error $error');
    // }
  }
}
