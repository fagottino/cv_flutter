import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfBannerWidget extends StatelessWidget {
  const PdfBannerWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(
          Uri.https(
            'aorlando.it',
            'assets/assets/files/cv-aorlando.pdf',
          ),
          webOnlyWindowName: '_blank',
        );
      },
      child: Stack(
        children: <Widget>[
          child,
          Positioned(
            right: 0,
            // bottom: 0,
            child: SizedBox(
              width: 50,
              height: 50,
              child: CustomPaint(
                painter: BannerPainter(
                  message: 'PDF VERSION',
                  textDirection: Directionality.of(context),
                  layoutDirection: Directionality.of(context),
                  location: BannerLocation.topEnd,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
