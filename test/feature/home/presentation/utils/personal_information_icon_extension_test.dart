import 'package:aorlando/feature/home/presentation/utils/personal_information_icon_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PersonalInformationIconExtension', () {
    test('returns the expected icon for supported values', () {
      expect('inbox'.getIcon, FontAwesomeIcons.envelope);
      expect('globe'.getIcon, FontAwesomeIcons.globe);
      expect('telegram'.getIcon, FontAwesomeIcons.telegram);
      expect('linkedin'.getIcon, FontAwesomeIcons.linkedin);
      expect('github'.getIcon, FontAwesomeIcons.github);
      expect('x'.getIcon, FontAwesomeIcons.twitter);
      expect('instagram'.getIcon, FontAwesomeIcons.instagram);
    });

    test('returns the fallback icon for null or unsupported values', () {
      String? unsupportedValue = 'unknown';
      String? nullValue;

      expect(unsupportedValue.getIcon, FontAwesomeIcons.question);
      expect(nullValue.getIcon, FontAwesomeIcons.question);
    });
  });
}
