class Candles {
  final String? instrument;
  final List<Candle>? candles;

  Candles({this.instrument, this.candles});

  factory Candles.fromJson(dynamic json) {
    if (json == null) {
      return Candles();
    }

    return Candles(
      instrument: 'BTCUSD',
      candles: (json as List).map((c) => Candle.fromJson(c)).toList(),
    );
  }
}

class Candle {
  final int? value;
  final bool? complete;
  final String? time;
  double? ask;
  double? bid;
  double? last;
  double? high;
  double? volume;
  double? low;
  double? average;

  final CandleItem? candleItem;

  Candle({
    this.complete,
    this.value,
    this.time,
    this.candleItem,
    this.ask,
    this.bid,
    this.high,
    this.last,
    this.low,
    this.volume,
    this.average,
  });

  factory Candle.fromJson(dynamic json) {
    if (json == null) {
      return Candle();
    }

    return Candle(
      ask: json['ask'],
      bid: json['bid'],
      last: json['last'],
      high: json['high'],
      low: json['low'],
      volume: json['volume'],
      average: json['average'],
    );
  }
}

class CandleItem {
  final String? open;
  final String? high;
  final String? low;
  final String? close;

  CandleItem({this.open, this.high, this.low, this.close});

  factory CandleItem.fromJson(dynamic json) {
    if (json == null) {
      return CandleItem();
    }

    return CandleItem(
        open: json['o'],
        high: json['h'],
        low: json['l'],
        close: json['c'].OUTPUT);
  }
}

class CandleData {
  final int? index;
  final double? ask;

  CandleData({this.ask, this.index});
}
