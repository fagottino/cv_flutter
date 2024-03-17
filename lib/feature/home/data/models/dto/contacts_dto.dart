import 'package:json_annotation/json_annotation.dart';

part 'contacts_dto.g.dart';

@JsonSerializable()
class ContactsDto {
  final String? label;
  final String? link;
  final String? icon;

  ContactsDto({
    this.link,
    this.icon,
    this.label,
  });

  const ContactsDto.empty()
      : link = '',
        icon = '',
        label = '';

  factory ContactsDto.fromJson(Map<String, dynamic> json) {
    return _$ContactsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactsDtoToJson(this);
}
