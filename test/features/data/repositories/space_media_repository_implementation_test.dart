import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa/core/usecase/errors/exceptions.dart';
import 'package:nasa/core/usecase/errors/failures.dart';
import 'package:nasa/features/data/datasources/space_media_datasource.dart';
import 'package:nasa/features/data/models/space_media_model.dart';
import 'package:nasa/features/data/repositories/space_media_repository.implementation.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late var datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });
  final tSpaceMediaModel = SpaceMediaModel(
      description: 'ABCDEFG', mediaType: 'aa', mediaUrl: 'dasd', title: 'aaa');
  final tDate = DateTime(2021, 02, 02);
  test('should return space media model hen callls the datasource', () async {
    // Arrange
    when(() => (datasource.getSpaceMediaFromDate))
        .thenAnswer((_) async => tSpaceMediaModel);
    // Act
    final result = await repository.getSpaceMediaFromDate(tDate);

    //Assert
    expect(result, Right(tSpaceMediaModel));
    verify(datasource)
        .called(getSpaceMediaFromDate)
        .withArgs(positinal: [tDate]).once();
  });
  test('Should return a server failure when calls the datasource', () async {
    //Arrange
    when(() => (datasource.getSpaceMediaFromDate)).thenThrow(ServerException());

    //Act
    final result = await repository.getSpaceMediaFromDate(tDate);

    //Assert
    expect(result, Left(ServerFailure()));
    verify(datasource)
        .called(getSpaceMediaFromDate)
        .withArgs(positinal: [tDate]).once();
  });
}
