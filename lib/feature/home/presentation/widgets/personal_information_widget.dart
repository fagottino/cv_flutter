import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({super.key, required this.icon, required this.text, this.link});

  final IconData icon;
  final String text;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      child: GestureDetector(
        onTap: link?.isEmpty ?? true ? null : () => launchUrl(Uri.parse(link!)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Icona
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: FaIcon(
                  icon,
                  size: 20,
                ),
              ),
            ),
            // SizedBox
            const SizedBox(
              width: 10,
            ),
            // Testo
            Flexible(
              flex: 2,
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: MouseRegion(
                    cursor:
                        link?.isEmpty ?? true ? SystemMouseCursors.text : SystemMouseCursors.click,
                    child: AbsorbPointer(
                      absorbing: link?.isEmpty ?? true,
                      child: Text(
                        text,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
