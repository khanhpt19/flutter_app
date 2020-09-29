import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/failures/failure.dart';
import 'package:flutter_app/domain/entities/movie_entity.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

/// [SearchMovieByTitle] searchs  movies with [title] condition from repository.
@lazySingleton
class SearchMovieByTitle implements UseCase<List<MovieEntity>, Params> {
  Repository repository;

  SearchMovieByTitle({@required this.repository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(Params params) async {
    return await repository.searchMovieByTitle(params.title);
  }
}

class Params {
  /// dsad
  final String title;

  Params(this.title);
}
