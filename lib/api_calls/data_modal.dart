class ClusterDataDetails {
  const ClusterDataDetails({
    required this.total,
    required this.circulating,
    required this.nonCirculating,
    required this.nonCirculatingAccounts,
    required this.acitveStake,
    required this.delinquentStake,
    required this.coinData,
  });

  /// Total supply in lamports.
  final int total;

  /// Circulating supply in lamports.
  final int circulating;

  /// Non-circulating supply in lamports.
  final int nonCirculating;

  /// An array of account addresses of non-circulating accounts, as strings. If
  /// `excludeNonCirculatingAccountsList` is enabled, the returned array will be
  /// empty.
  final List<String> nonCirculatingAccounts;

  // Current active stake
  final int acitveStake;

  // Delinquent stake
  final int delinquentStake;

  //coin data
  final CoinData coinData;
}

class CoinData {
  final double price;
  final int marketCap;
  final int volume24h;
  final int marketCapRank;
  final double priceChangePercentage24h;

  const CoinData({
    required this.price,
    required this.marketCap,
    required this.marketCapRank,
    required this.volume24h,
    required this.priceChangePercentage24h,
  });

  factory CoinData.fromJson(Map<String, dynamic> json) {
    return CoinData(
      price: json['current_price'],
      marketCap: json['market_cap'],
      marketCapRank: json['market_cap_rank'],
      volume24h: json['total_volume'],
      priceChangePercentage24h: json['price_change_percentage_24h'],
    );
  }
}
