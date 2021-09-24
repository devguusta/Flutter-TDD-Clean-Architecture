import 'dart:convert';

import 'package:nasa/core/http_client/http_client.dart';
import 'package:nasa/core/usecase/errors/exceptions.dart';
import 'package:nasa/core/utils/converters/date_to_string_converter.dart';
import 'package:nasa/core/utils/keys/nasa_api_keys.dart';
import 'package:nasa/features/data/datasources/space_media_datasource.dart';
import 'package:nasa/features/data/models/space_media_model.dart';

import 'endpoints/nasa_endpoints.dart';

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  NasaDatasourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client.get(NasaEndPoints.apod(
        NasaApiKeys.apiKey, DateToStringConverter.convert(date)));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
