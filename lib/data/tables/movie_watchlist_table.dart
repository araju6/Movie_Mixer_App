import 'package:hive/hive.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';

part 'movie_watchlist_table.g.dart';

@HiveType(typeId: 1)
class MovieWatchlistTable extends MovieEntity{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  MovieWatchlistTable({
    this.id,
    this.title,
    this.posterPath,
}): super(
    id: id,
    title: title,
    posterPath: posterPath,
    backdropPath: '',
      releaseDate: '',
    voteAverage: 0,
  );

  factory MovieWatchlistTable.fromMovieEntity(MovieEntity movieEntity){
    return MovieWatchlistTable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
    );
  }

}