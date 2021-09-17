import 'dart:convert';

import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  final String description;
  final String mediaType;
  final String title;
  final String? mediaUrl;
  SpaceMediaEntity({
    required this.description,
    required this.mediaType,
    required this.title,
    this.mediaUrl,
  });


  SpaceMediaEntity copyWith({
    String? description,
    String? mediaType,
    String? title,
    String? mediaUrl,
  }) {
    return SpaceMediaEntity(
      description: description ?? this.description,
      mediaType: mediaType ?? this.mediaType,
      title: title ?? this.title,
      mediaUrl: mediaUrl ?? this.mediaUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'mediaType': mediaType,
      'title': title,
      'mediaUrl': mediaUrl,
    };
  }

  factory SpaceMediaEntity.fromMap(Map<String, dynamic> map) {
    return SpaceMediaEntity(
      description: map['description'],
      mediaType: map['mediaType'],
      title: map['title'],
      mediaUrl: map['mediaUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpaceMediaEntity.fromJson(String source) => SpaceMediaEntity.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [description, mediaType, title, mediaUrl!];
}
