class Bids {
  final List<Bid>? bids;

  Bids({this.bids});
}

class Bid {
  final String? price;
  final int? liquidity;

  Bid({this.price, this.liquidity});

  factory Bid.fromJson(Map<String, dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json == null) {
      return Bid();
    }
    return Bid(
      price: json['price'],
      liquidity: json['liquidity'],
    );
  }
}
