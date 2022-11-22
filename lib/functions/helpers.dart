import 'package:explorer/functions/programs.dart';
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
  if (programs.containsKey(address)) {
    return programs[address]!;
  } else {
    return '${address!.substring(0, 8)}...${address.substring(address.length - 4, address.length)}';
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

String logMessageFormat(String message) {
  List<String> messageList = message.split(" ");
  if (messageList.length >= 2 && messageList[1].length > 20) {
    String program = addressToShortString(messageList[1]);
    messageList[1] = program;
  } else if (messageList.length >= 3 && messageList[2].length > 20) {
    String program = addressToShortString(messageList[2]);
    messageList[2] = program;
  }
  return messageList.join(" ");
}
