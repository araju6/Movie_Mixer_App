import 'package:hive/hive.dart';
import 'package:movie_mixer/data/tables/movie_watchlist_table.dart';

abstract class MovieWatchlistLocalDataSource{
  Future<void> saveWatchlistMovie(MovieWatchlistTable movieWatchlistTable);
  Future<List<MovieWatchlistTable>> getWatchlistMovies();
  Future<void> deleteWatchlistMovie(int movieId1);
  Future<bool> checkIfMovieWatchlist(int movieId1);
}

class MovieWatchlistDataSourceImpl extends MovieWatchlistLocalDataSource {

  @override
  Future<bool> checkIfMovieWatchlist(int movieId1) async {
    final movieBox1 = await Hive.openBox('movieBox1');
    return movieBox1.containsKey(movieId1);
  }

  @override
  Future<void> deleteWatchlistMovie(int movieId1) async {
    final movieBox1 = await Hive.openBox('movieBox1');
    await movieBox1.delete(movieId1);
  }

  @override
  Future<List<MovieWatchlistTable>> getWatchlistMovies() async {
    final movieBox1 = await Hive.openBox('movieBox1');
    final movieIds1 = movieBox1.keys;
    List<MovieWatchlistTable> movies = [];
    movieIds1.forEach((movieId1) {
      movies.add(movieBox1.get(movieId1));
    });

    return movies;
  }

  @override
  Future<void> saveWatchlistMovie(MovieWatchlistTable movieWatchlistTable) async {
    final movieBox1 = await Hive.openBox('movieBox1');
    await movieBox1.put(movieWatchlistTable.id, movieWatchlistTable);
  }
}