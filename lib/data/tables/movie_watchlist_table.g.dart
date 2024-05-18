// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_watchlist_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieWatchlistTableAdapter extends TypeAdapter<MovieWatchlistTable> {
  @override
  final int typeId = 1;

  @override
  MovieWatchlistTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieWatchlistTable(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieWatchlistTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieWatchlistTableAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}