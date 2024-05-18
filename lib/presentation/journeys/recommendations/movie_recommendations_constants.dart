import 'recommendations.dart';

class MovieRecommendationsConstants {
  static const List<Recommendations> movieTabs = const [
    const Recommendations(index: 0, title: 'Favorites'),
    const Recommendations(index: 1, title: 'History'),
    const Recommendations(index: 2, title: 'Watchlist'),
  ];
}