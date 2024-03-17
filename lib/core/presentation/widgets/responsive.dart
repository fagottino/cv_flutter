import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    this.desktop,
    this.tablet,
  });
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  // This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          // If our width is more than 1100 then we consider it a desktop
          constraints.maxWidth >= 1100 && desktop != null
              ? desktop!
              // If width it less then 1100 and more then 850 we consider it as tablet
              : constraints.maxWidth >= 850 && tablet != null
                  ? tablet!
                  // Or less then that we called it mobile
                  : mobile,
    );
  }
}
