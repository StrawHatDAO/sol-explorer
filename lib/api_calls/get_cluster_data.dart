import 'dart:convert';
import 'package:explorer/api_calls/data_modal.dart';
import 'package:explorer/api_calls/get_coin_price.dart';
import 'package:http/http.dart' as http;

Future<ClusterDataDetails> getClusterStats() async {
  const url = "https://api.solscan.io/chaininfo";

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);

    //Coin data
    final coinData = await fetchCoinPrice();

    final data = ClusterDataDetails(
      total: jsonResponse['data']['solSupply']['total'],
      circulating: jsonResponse['data']['solSupply']['circulating'],
      nonCirculating: jsonResponse['data']['solSupply']['nonCirculating'],
      acitveStake: jsonResponse['data']['solStakeOverview']['total'],
      delinquentStake: jsonResponse['data']['solStakeOverview']
          ['totalSolDelinquent'],
      circulatingPercent: jsonResponse['data']['solSupply']
          ['circulatingPercent'],
      nonCirculatingPercent: jsonResponse['data']['solSupply']
          ['nonCirculatingPercent'],
      totalSolDelinquentRatio: jsonResponse['data']['solStakeOverview']
          ['totalSolDelinquentRatio'],
      coinData: coinData,
    );

    return data;
  } else {
    throw Exception('Failed to load coin price');
  }
}
