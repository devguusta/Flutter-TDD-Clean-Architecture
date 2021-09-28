import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa/presenter/controllers/home_store.dart';
import 'package:nasa/presenter/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:nasa/presenter/pages/picture_page.dart';
import 'core/http_client/http_client.dart';
import 'core/utils/converters/date_to_string_converter.dart';
import 'features/data/datasources/space_media_datasource_implementation.dart';
import 'features/data/repositories/space_media_repository.implementation.dart';
import 'features/domain/usecases/get_space_media_from_date_usecase.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(i())),
    Bind((i) => GetSpaceMediaFromDateUsecase(i())),
    Bind((i) => SpaceMediaRepositoryImplementation(i())),
    Bind((i) => NasaDatasourceImplementation(converter: i(), client: i())),
    Bind((i) => DateToStringConverter()),
    Bind((i) => http.Client()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('/picture', child: (_, __) => PicturePage()),
  ];
}
