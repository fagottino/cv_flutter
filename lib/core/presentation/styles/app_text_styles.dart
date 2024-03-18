import 'package:flutter/widgets.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Default Regular
  static TextStyle defaultRegularTextStyle = const TextStyle(
    color: AppColors.black,
  );

  // Default Bold
  static TextStyle defaultBoldTextStyle = const TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  // Main title
  static TextStyle mainTitleTextStyle = const TextStyle(
    fontSize: 50,
    letterSpacing: 5,
  );

  // Secondary title
  static TextStyle secondaryTitleTextStyle = defaultBoldTextStyle.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  // Secondary title
  static TextStyle secondaryTitleItalicTextStyle = defaultRegularTextStyle.copyWith(
    fontSize: 15,
    fontStyle: FontStyle.italic,
  );

  // Main description
  static TextStyle mainDescriptionTextStyle = mainTitleTextStyle.copyWith(
    fontSize: 23,
    color: AppColors.primaryColor,
    letterSpacing: 5,
  );

  // Title web
  static TextStyle sectionTitleTextStyle = defaultBoldTextStyle.copyWith(
    fontSize: 20,
  );
}
