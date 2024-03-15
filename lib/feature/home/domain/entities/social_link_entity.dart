import 'package:json_annotation/json_annotation.dart';

part 'social_link_entity.g.dart';

@JsonSerializable()
class SocialLinkEntity {
  final String link, icon, name, label;

  final bool showInHeader;

  SocialLinkEntity({
    required this.link,
    required this.icon,
    required this.name,
    required this.label,
    this.showInHeader = false,
  });

  const SocialLinkEntity.empty()
      : link = '',
      icon = '',
      name = '',
      label = '',
      showInHeader = false;

  factory SocialLinkEntity.fromJson(Map<String, dynamic> json) {
    return _$SocialLinkEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialLinkEntityToJson(this);
}
