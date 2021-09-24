import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa/features/data/models/space_media_model.dart';
import 'package:nasa/features/domain/entities/space_media_entity.dart';

import '../../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
      description: 'ABCDEFG', mediaType: 'aa', mediaUrl: 'dasd', title: 'aaa');
  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });
  test("should return a valid model", () {
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    final result = SpaceMediaModel.fromJson(jsonMap);
    expect(result, tSpaceMediaModel);
  });
  test('should return a json map containing the proper data', () {
    final expectedMap = {
      "explanation": "Meteors can be colurful",
      "media_type": "image",
      "title": "A corlorful quadrantid",
      "url": "http://aadasdd.com.br"
    };
    final result = tSpaceMediaModel.toJson();
    expect(result, expectedMap);
  });
}
