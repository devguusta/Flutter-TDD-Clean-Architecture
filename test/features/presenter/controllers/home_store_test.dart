import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa/core/usecase/errors/failures.dart';
import 'package:nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:nasa/presenter/controllers/home_store.dart';

import '../../../mocks/date_mock.dart';
import '../../../mocks/space_media_entity_mock.dart';

class MockGetSpaceMediaFromDateUsecase extends Mock
    implements GetSpaceMediaFromDateUsecase {}

main() {
  late HomeStore store;
  late GetSpaceMediaFromDateUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetSpaceMediaFromDateUsecase();
    store = HomeStore(mockUsecase);
  });

  test("should return a SpaceMedia from the usecase", () async {
    when(() => mockUsecase(any())).thenAnswer((_) async => Right(tSpaceMedia));

    store.getSpaceMediaFromDate(tDate);

    store.observer(onState: (state) {
      expect(state, tSpaceMedia);
      verify(() => mockUsecase(tDate)).called(1);
    });
  });

  final tFailure = ServerFailure();
  test("should return a Failure from the usecase when there is an error",
      () async {
    when(() => mockUsecase(any())).thenAnswer((_) async => Left(tFailure));

    store.getSpaceMediaFromDate(tDate);

    store.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockUsecase(tDate)).called(1);
    });
  });
}
