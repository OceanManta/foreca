import 'package:foreca/models/asks.dart';
import 'package:foreca/models/bids.dart';

class Price {
  final String? type;
  final String? time;

  final Bids? bids;
  final Asks? asks;

  final String? closeoutBid;

  final String? closeoutAsk;

  final bool? tradeable;

  final String? instrument;

  Price(
      {this.type,
      this.time,
      this.bids,
      this.asks,
      this.closeoutBid,
      this.closeoutAsk,
      this.tradeable,
      this.instrument});

  factory Price.fromJson(dynamic json) {
    if (json == null) {
      return Price();
    }

    return Price(
      type: json[''],
      time: json[''],
      closeoutBid: json[''],
      closeoutAsk: json[''],
      tradeable: json[''],
      instrument: json[''],
    );
  }
}
