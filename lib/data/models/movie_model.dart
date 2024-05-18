import 'package:movie_mixer/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final int id;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final int voteCount;
  final bool adult;
  final String backdropPath;
  final bool video;
  final List<int> genreIds;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final double popularity;
  final String mediaType;

  MovieModel(
      {this.id,
        this.voteAverage,
        this.overview,
        this.releaseDate,
        this.voteCount,
        this.adult,
        this.backdropPath,
        this.video,
        this.genreIds,
        this.title,
        this.originalLanguage,
        this.originalTitle,
        this.posterPath,
        this.popularity,
        this.mediaType}) : super(
    id: id,
    title: title,
    backdropPath: backdropPath,
    posterPath: posterPath,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
    overview: overview,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
    id : json['id'],
    voteAverage : json['vote_average']?.toDouble() ?? 0.0,
    overview : json['overview'],
    releaseDate : json['release_date'],
    voteCount : json['vote_count'],
    adult : json['adult'],
    backdropPath : json['backdrop_path'],
    video : json['video'],
    genreIds : json['genre_ids'].cast<int>(),
    title : json['title'],
    originalLanguage : json['original_language'],
    originalTitle : json['original_title'],
    posterPath : json['poster_path'],
    popularity : json['popularity']?.toDouble() ?? 0.0,
    mediaType : json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['vote_count'] = this.voteCount;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['video'] = this.video;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
