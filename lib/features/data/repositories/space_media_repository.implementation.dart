import 'package:nasa/core/usecase/errors/exceptions.dart';
import 'package:nasa/features/data/datasources/space_media_datasource.dart';
import 'package:nasa/features/domain/entities/space_media_entity.dart';
import 'package:nasa/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:nasa/features/domain/repositories/space_media_repository.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);
  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
