import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:nasa/core/http_client/http_client.dart';
import 'package:nasa/core/usecase/errors/exceptions.dart';
import 'package:nasa/core/utils/converters/date_to_string_converter.dart';
import 'package:nasa/core/utils/keys/nasa_api_keys.dart';
import 'package:nasa/features/data/datasources/space_media_datasource.dart';
import 'package:nasa/features/data/models/space_media_model.dart';

import 'endpoints/nasa_endpoints.dart';

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final DateToStringConverter converter;
  final http.Client client;
  NasaDatasourceImplementation({
    required this.converter,
    required this.client,
  });

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final dateConverted = DateToStringConverter.convert(date);
    final response = await client.get(NasaEndpoints.getSpaceMedia(
      'DEMO_KEY',
      dateConverted,
    ));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
