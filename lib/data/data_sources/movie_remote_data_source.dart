import 'dart:math';
import 'package:hive/hive.dart';
import 'package:movie_mixer/data/core/api_client.dart';
import 'package:movie_mixer/data/models/movie_detail_model.dart';
import 'package:movie_mixer/data/models/movie_model.dart';
import 'package:movie_mixer/data/models/movies_result_model.dart';
import 'package:movie_mixer/data/tables/movie_history_table.dart';
import 'package:movie_mixer/data/tables/movie_table.dart';
import 'package:movie_mixer/data/tables/movie_watchlist_table.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> getSearchedMovies(String searchTerm);
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<MovieModel>> getRecommendations();
  Future<List<MovieModel>> getRecommendations2();
  Future<List<MovieModel>> getRecommendations3();

}
class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies =  MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async  {
    final response = await _client.get('movie/popular');
    final movies =  MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies =  MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies =  MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie =  MovieDetailModel.fromJson(response);
    return movie;
  }

  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm) async{
    final response = await _client.get('search/movie',
    params: {
      'query': searchTerm,
    }
    );
    final movies =  MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getRecommendations() async {
    var rng = Random();
    int a;
    @override
      final movieBox = await Hive.openBox('movieBox');
      final movieIds = movieBox.keys;
      List<MovieTable> movies1 = [];
      movieIds.forEach((movieId) {
        movies1.add(movieBox.get(movieId));
      });
    if (movies1.length==null){
      a = 675353;}
    if(movies1.length==1){
      a = movies1[0].id;}
    else{
      a ??= movies1.elementAt(rng.nextInt(movies1.length)).id;}
    final response = await _client.get('movie/$a/recommendations');
    final movies =  MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getRecommendations2() async {
    var rng = Random();
    int a;

    @override
    final movieBox2 = await Hive.openBox('movieBox2');
    final movieIds2 = movieBox2.keys;
    List<MovieHistoryTable> movies2 = [];
    movieIds2.forEach((movieId2) {
      movies2.add(movieBox2.get(movieId2));
    });

    if (movies2.length==null){
      a = 675353;
    }
    if(movies2.length==1){
      a = movies2[0].id;
    }
    else{
      a ??= movies2.elementAt(rng.nextInt(movies2.length)).id;
    }


    final response = await _client.get('movie/$a/similar');
    final movies =  MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getRecommendations3() async {
    var rng = Random();
    int a;

    @override
    final movieBox1 = await Hive.openBox('movieBox1');
    final movieIds1 = movieBox1.keys;
    List<MovieWatchlistTable> movies1 = [];
    movieIds1.forEach((movieId1) {
    movies1.add(movieBox1.get(movieId1));
    });

    if (movies1.length==null){
      a = 675353;
    }
    if(movies1.length==1){
      a = movies1[0].id;
    }
    else{
      a ??= movies1.elementAt(rng.nextInt(movies1.length)).id;
    }


    final response = await _client.get('movie/$a/recommendations');
    final movies =  MoviesResultModel.fromJson(response).movies;
    return movies;
  }
}