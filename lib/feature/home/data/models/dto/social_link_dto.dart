import 'package:json_annotation/json_annotation.dart';

import 'contact_link_dto.dart';

part 'social_link_dto.g.dart';

@JsonSerializable()
class SocialLinkDto extends ContactLinkDto {
  final bool? showInHeader;

  SocialLinkDto({
    super.link,
    super.icon,
    super.name,
    super.label,
    this.showInHeader = false,
  });

  const SocialLinkDto.empty()
      : showInHeader = false,
        super.empty();

  factory SocialLinkDto.fromJson(Map<String, dynamic> json) {
    return _$SocialLinkDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialLinkDtoToJson(this);
}
