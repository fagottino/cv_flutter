import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

extension PersonalInformationIconExtension on String? {
  IconData get getIcon {
    switch (this ?? '') {
      case "inbox":
        return FontAwesomeIcons.envelope;
      case "globe":
        return FontAwesomeIcons.globe;
      case "telegram":
        return FontAwesomeIcons.telegram;
      default:
        return FontAwesomeIcons.question;
    }
  }
}
