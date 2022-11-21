import 'package:solana/dto.dart';
import 'package:solana/solana.dart';

Future<TransactionDetails> getTransactionDetails(
    RpcClient client, String txId) async {
  final txData =
      await client.getTransaction(txId, encoding: Encoding.jsonParsed);
  return txData!;
}

Future<Account> getAccountDetails(RpcClient client, String address) async {
  final txData =
      await client.getAccountInfo(address, encoding: Encoding.jsonParsed);
  return txData!;
}

Future<List<TransactionSignatureInformation>> getTransactions(
    RpcClient client, String address) async {
  final txList = await client.getSignaturesForAddress(address);
  return txList.toList();
}
