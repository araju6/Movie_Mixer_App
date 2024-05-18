import 'package:hive/hive.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';

part 'movie_history_table.g.dart';

@HiveType(typeId: 2)
class MovieHistoryTable extends MovieEntity{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  MovieHistoryTable({
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

  factory MovieHistoryTable.fromMovieEntity(MovieEntity movieEntity){
    return MovieHistoryTable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
    );
  }

}