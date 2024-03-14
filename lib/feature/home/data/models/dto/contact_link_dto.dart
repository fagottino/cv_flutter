import 'package:json_annotation/json_annotation.dart';

part 'contact_link_dto.g.dart';

@JsonSerializable()
class ContactLinkDto {
  final String? link;
  final String? icon;
  final String? name;
  final String? label;

  ContactLinkDto({
    this.link,
    this.icon,
    this.name,
    this.label,
  });

  const ContactLinkDto.empty()
      : link = '',
        icon = '',
        name = '',
        label = '';

  factory ContactLinkDto.fromJson(Map<String, dynamic> json) {
    return _$ContactLinkDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactLinkDtoToJson(this);
}
