import 'package:json_annotation/json_annotation.dart';

part 'contacts_entity.g.dart';

@JsonSerializable()
class ContactsEntity {
  final String label;
  final String link;
  final String icon;

  ContactsEntity({
    required this.link,
    required this.icon,
    required this.label,
  });

  const ContactsEntity.empty()
      : link = '',
        icon = '',
        label = '';

  factory ContactsEntity.fromJson(Map<String, dynamic> json) {
    return _$ContactsEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactsEntityToJson(this);
}
