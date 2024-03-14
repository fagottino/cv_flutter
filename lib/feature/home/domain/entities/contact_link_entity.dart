import 'package:json_annotation/json_annotation.dart';

part 'contact_link_entity.g.dart';

@JsonSerializable()
class ContactLinkEntity {
  final String link;
  final String icon;
  final String name;
  final String label;

  ContactLinkEntity({
    required this.link,
    required this.icon,
    required this.name,
    required this.label,
  });

  const ContactLinkEntity.empty()
      : link = '',
        icon = '',
        name = '',
        label = '';

  factory ContactLinkEntity.fromJson(Map<String, dynamic> json) {
    return _$ContactLinkEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactLinkEntityToJson(this);
}
