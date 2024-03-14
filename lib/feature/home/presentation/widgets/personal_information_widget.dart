import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
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
          const SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       top: 15,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Flexible(
  //           child: FaIcon(
  //             icon,
  //             size: 20,
  //           ),
  //         ),
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         Flexible(
  //           child: Align(
  //             alignment: Alignment.centerLeft,
  //             child: Text(
  //               text,
  //               textAlign: TextAlign.left,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
