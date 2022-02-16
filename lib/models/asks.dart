class Asks {
  final List<Ask>? asks;
  Asks({this.asks});
}

class Ask {
  final String? price;
  final int? liquidity;

  Ask({this.price, this.liquidity});

  factory Ask.fromJson(Map<String, dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json == null) {
      return Ask();
    }

    return Ask(
      price: json['price'],
      liquidity: json['liquidity'],
    );
  }
}
