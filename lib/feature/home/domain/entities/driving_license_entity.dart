import 'package:json_annotation/json_annotation.dart';

part 'driving_license_entity.g.dart';

@JsonSerializable()
class DrivingLicenseEntity {
  final String value;

  DrivingLicenseEntity({
    required this.value,
  });

  const DrivingLicenseEntity.empty()
      : value = '';

  factory DrivingLicenseEntity.fromJson(Map<String, dynamic> json) {
    return _$DrivingLicenseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DrivingLicenseEntityToJson(this);
}
