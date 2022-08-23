import 'package:explorer/api_calls/data_modal.dart';
import 'package:explorer/api_calls/get_coin_price.dart';
import 'package:solana/solana.dart';

Future<ClusterDataDetails> getClusterStats(RpcClient client) async {
  final supply = await client.getSupply(commitment: Commitment.confirmed);
  final voteAccounts =
      await client.getVoteAccounts(commitment: Commitment.confirmed);

  int stake = 0;
  for (var element in voteAccounts.current) {
    stake += element.activatedStake;
  }

  int delinquent = 0;
  for (var element in voteAccounts.delinquent) {
    delinquent += element.activatedStake;
  }

  //Coin data
  final coinData = await fetchCoinPrice();

  final data = ClusterDataDetails(
    total: supply.total,
    circulating: supply.circulating,
    nonCirculating: supply.circulating,
    nonCirculatingAccounts: supply.nonCirculatingAccounts,
    acitveStake: stake + delinquent,
    delinquentStake: delinquent,
    coinData: coinData,
  );

  return data;
}
