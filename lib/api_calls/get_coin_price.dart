import 'dart:convert';

import 'package:explorer/api_calls/data_modal.dart';
import 'package:http/http.dart' as http;

const url =
    "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=solana&order=market_cap_desc&per_page=1&page=1&sparkline=false&price_change_percentage=24h";

Future<CoinData> fetchCoinPrice() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return CoinData.fromJson(jsonResponse[0]);
  } else {
    throw Exception('Failed to load coin price');
  }
}
