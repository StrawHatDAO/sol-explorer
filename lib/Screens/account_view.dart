import 'package:explorer/Screens/transaction_view.dart';
import 'package:explorer/api_calls/rpc_method_calls.dart';
import 'package:flutter/material.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart';
import 'package:flutter/services.dart';

class AccountView extends StatefulWidget {
  final String accountAdderss;
  const AccountView(this.accountAdderss, {Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  // Cluster connection
  final client = RpcClient('https://api.mainnet-beta.solana.com');

  late Future<Account> accountDetails;
  late Future<List<TransactionSignatureInformation>> accountTransactions;

  @override
  void initState() {
    super.initState();
    accountTransactions = getTransactions(client, widget.accountAdderss);
    accountDetails = getAccountDetails(client, widget.accountAdderss);
  }

  final Key _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Account View"),
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
        future: accountDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  DataTable(
                    columns: const [
                      DataColumn(label: Text("Overview")),
                      DataColumn(label: Text("")),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            InkWell(
                              // ignore: avoid_print
                              onTap: () => print(accountTransactions),
                              child: const Text(
                                "Address",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              "${widget.accountAdderss.substring(0, 40)}...",
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          const DataCell(
                            Text(
                              "Lamports",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          DataCell(
                            Text(
                              (snapshot.data.lamports).toString(),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          const DataCell(
                            Text(
                              "Executable",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          DataCell(
                            Text(
                              snapshot.data.executable ? "Yes" : "No",
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          const DataCell(
                            Text(
                              "Rent Epoch",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          DataCell(
                            Text(snapshot.data.rentEpoch.toString()),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Recent Transactions",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: FutureBuilder(
                        future: accountTransactions,
                        builder: (BuildContext context,
                            AsyncSnapshot asyncSnapshot) {
                          if (asyncSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Column(
                                children: const [
                                  CircularProgressIndicator(),
                                ],
                              ),
                            );
                          } else if (asyncSnapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: asyncSnapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                TransactionSignatureInformation transaction =
                                    asyncSnapshot.data[index];
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(children: [
                                    Flexible(
                                        child: GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TransactionView(
                                              transaction.signature),
                                        ),
                                      ),
                                      onLongPress: () => Clipboard.setData(
                                        ClipboardData(
                                          text:
                                              transaction.signature.toString(),
                                        ),
                                      ).then(
                                        (_) => ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Signature copied to clipboard"),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        transaction.signature,
                                        style: TextStyle(
                                            color: transaction.err == null
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                    )),
                                  ]),
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        }),
                  )
                ],
              ),
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
