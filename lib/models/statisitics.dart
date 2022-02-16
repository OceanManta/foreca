class Statistics {
  String? instrument;
  List<Statistic>? statistics;
  Statistics({this.instrument, this.statistics});

  factory Statistics.fromJson(dynamic json) {
    if (json == null) {
      return Statistics();
    }

    return Statistics();
  }
}

class Statistic {
  double? average;
  String? hour;
  double? high;
  double? low;
  double? ask;
  double? open;
  double? close;

  Statistic({
    this.ask,
    this.open,
    this.close,
    this.average,
    this.high,
    this.hour,
    this.low,
  });

  factory Statistic.fromJson(dynamic json) {
    if (json == null) {
      return Statistic();
    }

    return Statistic(
      high: json['high'],
      low: json['low'],
      hour: json['time'],
      open: json['open']['hour'],
      close: json['changes']['price']['hour'],
    );
  }
}
