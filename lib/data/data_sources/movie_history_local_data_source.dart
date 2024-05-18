import 'package:hive/hive.dart';
import 'package:movie_mixer/data/tables/movie_history_table.dart';

abstract class MovieHistoryLocalDataSource{
  Future<void> saveHistoryMovie(MovieHistoryTable movieHistoryTable);
  Future<List<MovieHistoryTable>> getHistoryMovies();
  Future<void> deleteHistoryMovie(int movieId2);
  Future<bool> checkIfMovieHistory(int movieId2);
}

class MovieHistoryLocalDataSourceImpl extends MovieHistoryLocalDataSource {

  final movieBox2 = Hive.openBox('movieBox2');


  @override
  Future<bool> checkIfMovieHistory(int movieId2) async {
    final movieBox2 = await Hive.openBox('movieBox2');
    return movieBox2.containsKey(movieId2);
  }

  @override
  Future<void> deleteHistoryMovie(int movieId2) async {
    final movieBox2 = await Hive.openBox('movieBox2');
    await movieBox2.delete(movieId2);
  }

  @override
  Future<List<MovieHistoryTable>> getHistoryMovies() async {
    final movieBox2 = await Hive.openBox('movieBox2');
    final movieIds2 = movieBox2.keys;
    List<MovieHistoryTable> movies = [];
    movieIds2.forEach((movieId2) {
      movies.add(movieBox2.get(movieId2));
    });
    return movies;
  }

  @override
  Future<void> saveHistoryMovie(MovieHistoryTable movieHistoryTable) async {
    final movieBox2 = await Hive.openBox('movieBox2');
    await movieBox2.put(movieHistoryTable.id, movieHistoryTable);
  }
}