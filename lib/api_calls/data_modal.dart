class ClusterDataDetails {
  const ClusterDataDetails({
    required this.total,
    required this.circulating,
    required this.nonCirculating,
    required this.acitveStake,
    required this.delinquentStake,
    required this.circulatingPercent,
    required this.nonCirculatingPercent,
    required this.totalSolDelinquentRatio,
    required this.coinData,
  });

  /// Total supply in lamports.
  final double total;

  /// Circulating supply in lamports.
  final double circulating;

  /// Non-circulating supply in lamports.
  final double nonCirculating;

  // Current active stake
  final double acitveStake;

  // Delinquent stake
  final double delinquentStake;

  // double circulatingPercentage
  final double circulatingPercent;

  // double non-circulatingPercentage
  final double nonCirculatingPercent;

  // total totalSolDelinquentRatio in %
  final double totalSolDelinquentRatio;

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
