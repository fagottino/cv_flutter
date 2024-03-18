import 'package:flutter/material.dart';

class PrivacyWidget extends StatelessWidget {
  const PrivacyWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: 70,
                  ),
                ),
                // Titolo
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Privacy'.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox
            const SizedBox(
              height: 10,
            ),
            // Testo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Spacer
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: 70,
                  ),
                ),
                // Testo
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      text,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
