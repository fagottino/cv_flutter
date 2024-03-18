import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MadeWithFlutterWidget extends StatelessWidget {
  const MadeWithFlutterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Made with',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const WidgetSpan(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: Icon(
                FontAwesomeIcons.heart,
                size: 16,
                color: Colors.red,
              ),
            ),
          ),
          const TextSpan(
            text: 'with',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(
              width: 4,
            ),
          ),
          TextSpan(
            text: 'Flutter',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(
                  Uri.parse(
                    'https://flutter.dev/',
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
