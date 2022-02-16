import 'package:flutter/material.dart';
import 'package:foreca/controllers/api.dart';
import 'package:foreca/models/prices.dart';

class PriceNotifier with ChangeNotifier {
  final String accountNr = 'OANDA-ACCOUNT_ID';
  final String instruments = 'EUR_USD';

  Future<List<Price>> getPricelist() async {
    final url =
        'https://api-fxpractice.oanda.com/v3/accounts/$accountNr/pricing?instruments=$instruments ';
    final response = await ApiRequest(url: url).get();

    List<Price> prices =
        (response['prices'] as List).map((p) => Price.fromJson(p)).toList();
    return prices;
  }

  Future<Price> getPrice(String instrument) async {
    final url =
        'https://api-fxpractice.oanda.com/v3/accounts/SaccountNr/pricing?instruments=$instruments';
    final response = await ApiRequest(url: url).get();

    return Price.fromJson(response);
  }
}
