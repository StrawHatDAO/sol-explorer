import 'package:intl/intl.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart';

String lamportstoMillions(double? value) {
  double inMillions = value! / 1000000;
  return '${inMillions.toStringAsFixed(1)}M';
}

String volumeToMillions(int? value) {
  double inMillions = value! / 1000000;
  return '${inMillions.toStringAsFixed(1)}M';
}

String volumeToBillions(int? value) {
  double inMillions = value! / 1000000000;
  return '${inMillions.toStringAsFixed(1)}B';
}

String circulationPercentage(double? circulating, double? total) {
  double circulatingPercentage = circulating! / total!;
  return (circulatingPercentage * 100).toStringAsFixed(1);
}

Map<String, dynamic> getParsedTransactionDetails(
    TransactionDetails? transactionDetails) {
  var tx = transactionDetails?.transaction as ParsedTransaction;
  var preBalances = transactionDetails?.meta?.preBalances;
  var postBalances = transactionDetails?.meta?.postBalances;

  var change = [];
  for (dynamic i = 0; i < preBalances?.length; i++) {
    dynamic pre = preBalances?[i];
    dynamic post = postBalances?[i];
    change.add(pre - post);
  }

  Map<String, dynamic> txData = {
    'message': tx.message,
    'preBalances': preBalances,
    'postBalances': postBalances,
    'change': change,
    'transaction': tx
  };
  return txData;
}

List<double> getChange(TransactionDetails? transactionDetails) {
  var preBalances = transactionDetails?.meta?.preBalances;
  var postBalances = transactionDetails?.meta?.postBalances;

  List<double> change = [];
  for (dynamic i = 0; i < preBalances?.length; i++) {
    dynamic pre = preBalances?[i];
    dynamic post = postBalances?[i];
    change.add((post - pre) / lamportsPerSol);
  }

  return change;
}

String addressToShortString(String? address) {
  switch (address) {
    case "11111111111111111111111111111111":
      return "System Program";
    case "ATokenGPvbdGVxr1b2hvZbsiqW5xWH25efTNsLJA8knL":
      return "AToken Program";
    case "SysvarRent111111111111111111111111111111111":
      return "Sysvar: Rent";
    case "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA":
      return "Token Program";
    case "22Y43yTVxuUkoRKdm9thyRhQ3SdgQS7c7kB6UNCiaczD":
      return "Serum Swap";
    case "9xQeWvG816bUx9EPjHmaT23yvVM2ZWbrrpZb9PusVFin":
      return "Serum Dex V3";
    case "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v":
      return "USDC";
    case "SysvarC1ock11111111111111111111111111111111":
      return "Sysvar: C1ock";
    case "Crt7UoUR6QgrFrN7j8rmSQpUTNWNSitSwWvsWGf1qZ5t":
      return "Saber Router";
    case "SSwpkEEcbUqx4vtoEByFjSkhKdCT862DNVb52nZg1UZ":
      return "Saber Swap";
    case "So11111111111111111111111111111111111111112":
      return "Wrapped SOL";
    default:
      return "${address?.substring(0, 8)}...";
  }
}

String dateFromEpoch(int value) {
  var date = DateTime.fromMillisecondsSinceEpoch(value * 1000);
  var formatted = DateFormat('MMM dd yyyy, hh:mm a').format(date);
  return formatted;
}

String result(Meta? meta) {
  if (meta?.err == null) {
    return "Success";
  } else {
    return meta?.err?.keys.first ?? "Fail";
  }
}
