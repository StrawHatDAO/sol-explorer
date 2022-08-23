import 'package:explorer/api_calls/rpc_method_calls.dart';
import 'package:explorer/functions/helpers.dart';
import 'package:flutter/material.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart';

class TransactionView extends StatefulWidget {
  final String transactionHash;
  const TransactionView(this.transactionHash, {Key? key}) : super(key: key);

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  // Cluster connection
  final client = RpcClient('https://api.mainnet-beta.solana.com');

  late Future<TransactionDetails> transactionDetails;
  late Transaction txInfo;

  @override
  void initState() {
    super.initState();
    print(widget.transactionHash);
    transactionDetails = getTransactionDetails(client, widget.transactionHash);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction View"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<TransactionDetails>(
          future: transactionDetails,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var txData = snapshot.data?.transaction as ParsedTransaction;
              List<double> change = getChange(snapshot.data);

              return Column(
                children: [
                  // Transaction details
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Overview")),
                          DataColumn(label: Text("")),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              const DataCell(
                                Text(
                                  "Signature",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "${txData.signatures[0].substring(0, 30)}...",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              const DataCell(
                                Text(
                                  "Result",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              DataCell(
                                Chip(
                                  label: Text(
                                    result(snapshot.data?.meta),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  backgroundColor:
                                      result(snapshot.data?.meta) == "Success"
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              const DataCell(
                                Text(
                                  "Slot",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              DataCell(
                                Text(
                                  snapshot.data?.slot.toString() ?? "",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              const DataCell(
                                Text(
                                  "Timestamp",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              DataCell(
                                Text(dateFromEpoch(
                                    snapshot.data?.blockTime as int)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              const DataCell(
                                Text(
                                  "Fee",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              DataCell(
                                Text(
                                    "${(snapshot.data?.meta?.fee ?? 5000) / lamportsPerSol} SOL"),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              const DataCell(
                                Text(
                                  "Recent Blockhash",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "${txData.message.recentBlockhash.substring(0, 30)}...",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Datatable for transaction details
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Address")),
                          DataColumn(label: Text("Pre Balance")),
                          DataColumn(label: Text("Post Balance")),
                          DataColumn(label: Text("Change")),
                          DataColumn(label: Text("Details")),
                        ],
                        rows: [
                          for (var i = 0;
                              i < txData.message.accountKeys.length;
                              i++)
                            DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    addressToShortString(
                                        txData.message.accountKeys[i].pubkey),
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    snapshot.data?.meta?.preBalances[i]
                                            .toString() ??
                                        "",
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    snapshot.data?.meta?.postBalances[i]
                                            .toString() ??
                                        "",
                                  ),
                                ),
                                DataCell(
                                  Text(change[i].toString()),
                                ),
                                DataCell(
                                  Text(
                                    snapshot.data?.meta?.preBalances[i]
                                            .toString() ??
                                        "",
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Program Logs",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Table for logs
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      children: snapshot.data?.meta?.logMessages
                              ?.map(
                                (e) => TableRow(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(e),
                                    ),
                                  ],
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              );
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Error: "),
                      Text("${snapshot.error}"),
                    ],
                  ),
                ],
              );
            }
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
