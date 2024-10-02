import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class MoviesModel with _$MoviesModel {
  factory MoviesModel({
    @Default('') @JsonKey(name: 'total') String total,
    @Default(0) int page,
    @Default(0) int pages,
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShow> tvShows,
  }) = _MoviesModel;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => _$MoviesModelFromJson(json);
}

@freezed
class TvShow with _$TvShow {
  factory TvShow({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'permalink') @Default('') String permalink,
    @JsonKey(name: 'end_date') @Default('') String endDate,
    @JsonKey(name: 'network') @Default('') String network,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'image_thumbnail_path') @Default('') String imageThumbnailPath,
  }) = _TvShow;

  factory TvShow.fromJson(Map<String, dynamic> json) => _$TvShowFromJson(json);
}

