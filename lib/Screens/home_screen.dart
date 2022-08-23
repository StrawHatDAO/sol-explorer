import 'package:explorer/Screens/account_view.dart';
import 'package:explorer/Screens/transaction_view.dart';
import 'package:explorer/api_calls/data_modal.dart';
import 'package:explorer/api_calls/get_cluster_data.dart';
import 'package:explorer/functions/helpers.dart';
import 'package:flutter/material.dart';
import 'package:solana/solana.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Cluster connection
  final client = RpcClient('https://api.mainnet-beta.solana.com');
  // Cluster details
  late Future<ClusterDataDetails> clusterData;

  @override
  void initState() {
    super.initState();
    clusterData = getClusterStats(client);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solana Explorer"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 40,
              child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search..',
                    hintText: 'Enter an account address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {},
                  onSubmitted: (String value) => {
                        if (value.length == 44)
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccountView(value),
                              ),
                            ),
                          }
                        else if (value.length == 88)
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransactionView(value),
                              ),
                            ),
                          }
                        else
                          {
                            // TODO: Show error message
                            print("Invalid address/signature"),
                            print(value)
                          }
                      }),
            ),
          ),
          FutureBuilder<ClusterDataDetails>(
            future: clusterData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return InkWell(
                  onTap: (() => print(snapshot)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          dataCard(
                            context,
                            "Total Supply",
                            "${lamportstoMillions(snapshot.data?.circulating)} / 527M"
                                .toString(),
                            "${circulationPercentage(snapshot.data?.circulating, snapshot.data?.total)}% is circulating",
                          ),
                          dataCard(
                            context,
                            "Active Stake",
                            "${lamportstoMillions(snapshot.data?.acitveStake)} / 527M"
                                .toString(),
                            "Delinquent stake: ${circulationPercentage(snapshot.data?.delinquentStake, snapshot.data?.acitveStake)}%",
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 15,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Price",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade100,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30.0)),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 0.0)),
                                          ),
                                          child: Text(
                                            "Rank #${snapshot.data?.coinData.marketCapRank}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "\$${snapshot.data?.coinData.price}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "${snapshot.data?.coinData.priceChangePercentage24h.toStringAsFixed(2)}%",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "24h Vol: \$${volumeToMillions(snapshot.data?.coinData.volume24h)}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      const Text(
                                        " MCap: \$15.5B",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container dataCard(
      BuildContext context, String title, String value, String subtitle) {
    // Screen size
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      width: (width / 2) - 15,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
