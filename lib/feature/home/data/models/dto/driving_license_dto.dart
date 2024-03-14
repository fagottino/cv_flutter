import 'package:json_annotation/json_annotation.dart';

part 'driving_license_dto.g.dart';

@JsonSerializable()
class DrivingLicenseDto {
  final String value;

  DrivingLicenseDto({
    required this.value,
  });

  const DrivingLicenseDto.empty()
      : value = '';

  factory DrivingLicenseDto.fromJson(Map<String, dynamic> json) {
    return _$DrivingLicenseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DrivingLicenseDtoToJson(this);
}
