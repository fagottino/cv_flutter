import 'package:json_annotation/json_annotation.dart';

import 'contact_link_entity.dart';

part 'social_link_entity.g.dart';

@JsonSerializable()
class SocialLinkEntity extends ContactLinkEntity {
  final bool showInHeader;

  SocialLinkEntity({
    required super.link,
    required super.icon,
    required super.name,
    required super.label,
    this.showInHeader = false,
  });

  const SocialLinkEntity.empty()
      : showInHeader = false,
        super.empty();

  factory SocialLinkEntity.fromJson(Map<String, dynamic> json) {
    return _$SocialLinkEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialLinkEntityToJson(this);
}
