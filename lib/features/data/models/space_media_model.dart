import 'package:nasa/features/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  SpaceMediaModel(
      {required String description,
      required String mediaType,
      required String title,
      required String mediaUrl})
      : super(
            description: description,
            mediaType: mediaType,
            title: title,
            mediaUrl: mediaUrl);

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) =>
      SpaceMediaModel(
          description: json['explanation'],
          mediaType: json['media_type'],
          mediaUrl: json['url'],
          title: json['title']);

  Map<String,dynamic> toJson() => {
    'explanation': description,
    'media_type': mediaType,
    'url': mediaUrl,
    'title': title,
  };
}
