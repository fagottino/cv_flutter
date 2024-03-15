import 'package:json_annotation/json_annotation.dart';

part 'social_link_dto.g.dart';

@JsonSerializable()
class SocialLinkDto {
  final String? link, icon, name, label;
  final bool? showInHeader;

  SocialLinkDto({
    this.link,
    this.icon,
    this.name,
    this.label,
    this.showInHeader = false,
  });

  const SocialLinkDto.empty()
      : link = '',
      icon = '',
      name = '',
      label = '',
      showInHeader = false;

  factory SocialLinkDto.fromJson(Map<String, dynamic> json) {
    return _$SocialLinkDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialLinkDtoToJson(this);
}
