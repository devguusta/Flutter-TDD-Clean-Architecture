import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa/core/http_client/http_client.dart';
import 'package:nasa/core/usecase/errors/exceptions.dart';
import 'package:nasa/features/data/datasources/space_media_datasource.dart';
import 'package:nasa/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:nasa/features/data/models/space_media_model.dart';

import '../../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = NasaDatasourceImplementation(client);
  });
  final tDateTime = DateTime(2021, 02, 02);
  final urlExpected = "https://apod.nasa.gov/apod/ap210924.html";
  void successMock() {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
  }

  test('should call the get method with correct url', () async {
    successMock();

    await datasource.getSpaceMediaFromDate(tDateTime);
    verify(() => client.get(urlExpected)).called(1);
  });

  test('should return a SpaceMediaModel when is success', () async {
    successMock();

    final tSpaceMediaModelExpected = SpaceMediaModel(
        description: "Meteors can be colurful",
        mediaType: "image",
        title: "A corlorful quadrantid",
        mediaUrl: "http://aadasdd.com.br");
    final result = await datasource.getSpaceMediaFromDate(tDateTime);
    expect(result, tSpaceMediaModelExpected);
  });
  test('should throw a ServerException when the call is unsuccessful', ()async{
    when(() => client.get(any())).thenAnswer((_)async => HttpResponse(data: 'something went wrong', statusCode: 400));

    final result = datasource.getSpaceMediaFromDate(tDateTime);

    expect(()=> result, throwsA(ServerException()));
  });
}
