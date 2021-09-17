import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa/core/usecase/errors/failures.dart';
import 'package:nasa/core/usecase/usecase.dart';
import 'package:nasa/features/domain/entities/space_media_entity.dart';
import 'package:nasa/features/domain/repositories/space_media_repository.dart';
import 'package:nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';


class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository{
  
}

void main() {
  late  GetSpaceMediaFromDateUsecase usecase;
   late ISpaceMediaRepository repository;
    setUp(() {
      repository = MockSpaceMediaRepository();
      usecase =  GetSpaceMediaFromDateUsecase(repository);
    });
    final tSpaceMedia = SpaceMediaEntity(description: 'ABCDEFGEAD', mediaType: 'PHOTO', title: 'SPACE NIGHT');
    final tDate = DateTime(2021,02,02);
    test('Should get space media entity for a given date from the repository', ()  {
    when(repository).calls(#getSpaceMediaFromDate).thenAnswer((_) async => Right<Failure,SpaceMediaEntity>(tSpaceMedia));
    final result = usecase(tDate);
    expect(result, Right(tSpaceMedia));
    verify<ISpaceMediaRepository>(repository);
  });

  test('should return a ServerFailure when don\'t succeed',()async {
    when(repository).calls(#getSpaceMediaFromDate).thenAnswer((_) async => Left<Failure,SpaceMediaEntity>(ServerFailure()));
    final result = await usecase(tDate);

    expect(result, Left(ServerFailure()));
    verify(repository);
  });
}
