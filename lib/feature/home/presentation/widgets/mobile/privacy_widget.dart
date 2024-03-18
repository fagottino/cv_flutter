import 'package:flutter/material.dart';

import '../../../../../core/presentation/styles/app_text_styles.dart';

class PrivacyWidget extends StatelessWidget {
  const PrivacyWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Privacy'.toUpperCase(),
          style: AppTextStyles.sectionTitleTextStyle,
        ),
        // Testo privacy
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
          ),
        ),
      ],
    );
  }
}
