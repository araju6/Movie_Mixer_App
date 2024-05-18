
import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_mixer/data/core/api_client.dart';
import 'package:movie_mixer/data/data_sources/movie_history_local_data_source.dart';
import 'package:movie_mixer/data/data_sources/movie_local_data_source.dart';
import 'package:movie_mixer/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_mixer/data/data_sources/movie_watchlist_local_data_source.dart';
import 'package:movie_mixer/data/repositories/movie_repository_impl.dart';
import 'package:movie_mixer/domain/repositories/movie_repository.dart';
import 'package:movie_mixer/domain/usecases/check_if_movie_favorite.dart';
import 'package:movie_mixer/domain/usecases/check_if_movie_history.dart';
import 'package:movie_mixer/domain/usecases/check_if_movie_watchlist.dart';
import 'package:movie_mixer/domain/usecases/delete_favorite_movie.dart';
import 'package:movie_mixer/domain/usecases/delete_history_movie.dart';
import 'package:movie_mixer/domain/usecases/delete_watchlist_movie.dart';
import 'package:movie_mixer/domain/usecases/get_coming_soon.dart';
import 'package:movie_mixer/domain/usecases/get_favorite_movies.dart';
import 'package:movie_mixer/domain/usecases/get_history.dart';
import 'package:movie_mixer/domain/usecases/get_playing_now.dart';
import 'package:movie_mixer/domain/usecases/get_popular.dart';
import 'package:movie_mixer/domain/usecases/get_movie_detail.dart';
import 'package:movie_mixer/domain/usecases/get_trending.dart';
import 'package:movie_mixer/domain/usecases/get_watchlist.dart';
import 'package:movie_mixer/domain/usecases/save_history_movie.dart';
import 'package:movie_mixer/domain/usecases/save_movie.dart';
import 'package:movie_mixer/domain/usecases/save_watchlist_movie.dart';
import 'package:movie_mixer/domain/usecases/search_movies.dart';
import 'package:movie_mixer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movie_mixer/presentation/blocs/history/history_bloc.dart';
import 'package:movie_mixer/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_mixer/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_mixer/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_mixer/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_mixer/presentation/blocs/recommendations/recommendations_bloc.dart';
import 'package:movie_mixer/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_mixer/presentation/blocs/watchlist/watchlist_bloc.dart';
import 'package:movie_mixer/domain/usecases/get_recommendations.dart';
import 'package:movie_mixer/domain/usecases/get_recommendations2.dart';
import 'package:movie_mixer/domain/usecases/get_recommendations3.dart';


final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl());

  getItInstance.registerLazySingleton<MovieWatchlistLocalDataSource>(
          () => MovieWatchlistDataSourceImpl());

  getItInstance.registerLazySingleton<MovieHistoryLocalDataSource>(
          () => MovieHistoryLocalDataSourceImpl());


  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
          () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
          () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
          () => GetMovieDetail(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
          () => MovieRepositoryImpl(getItInstance(), getItInstance(), getItInstance(), getItInstance(),
          ));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(
        () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
        () => MovieTabbedBloc(
      getPopular: getItInstance(),
      getComingSoon: getItInstance(),
      getPlayingNow: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
        () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
          favoriteBloc: getItInstance(),
          watchlistBloc: getItInstance(),
          historyBloc: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<SearchMovies>(
          () => SearchMovies(getItInstance()));

  getItInstance.registerFactory(
        () => SearchMovieBloc(
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<SaveMovie>(
          () => SaveMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetMovies>(
          () => GetMovies(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
          () => DeleteFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
          () => CheckIfFavoriteMovie(getItInstance()));

  getItInstance.registerFactory(() => FavoriteBloc(saveMovie: getItInstance(),
      getMovies: getItInstance(), deleteFavoriteMovie: getItInstance(),
      checkIfFavoriteMovie: getItInstance()));

  getItInstance.registerLazySingleton<SaveWatchlistMovie>(
          () => SaveWatchlistMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetWatchlistMovies>(
          () => GetWatchlistMovies(getItInstance()));

  getItInstance.registerLazySingleton<DeleteWatchlistMovie>(
          () => DeleteWatchlistMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfWatchlistMovie>(
          () => CheckIfWatchlistMovie(getItInstance()));

  getItInstance.registerFactory(() => WatchlistBloc(saveWatchlistMovie: getItInstance(),
      getWatchlistMovies: getItInstance(), deleteWatchlistMovie: getItInstance(),
      checkIfWatchlistMovie: getItInstance()));

  getItInstance.registerLazySingleton<SaveHistoryMovie>(
          () => SaveHistoryMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetHistoryMovies>(
          () => GetHistoryMovies(getItInstance()));

  getItInstance.registerLazySingleton<DeleteHistoryMovie>(
          () => DeleteHistoryMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfHistoryMovie>(
          () => CheckIfHistoryMovie(getItInstance()));

  getItInstance.registerFactory(() => HistoryBloc(saveHistoryMovie: getItInstance(),
      getHistoryMovies: getItInstance(), deleteHistoryMovie: getItInstance(),
      checkIfHistoryMovie: getItInstance()));

  getItInstance
      .registerLazySingleton<GetRecommendations>(() => GetRecommendations(getItInstance()));

  getItInstance
      .registerLazySingleton<GetRecommendations2>(() => GetRecommendations2(getItInstance(), ));

  getItInstance
      .registerLazySingleton<GetRecommendations3>(() => GetRecommendations3(getItInstance()));

  getItInstance.registerFactory(() => RecommendationsBloc(getRecommendations: getItInstance(), getRecommendations2: getItInstance(), getRecommendations3: getItInstance()));

}