import 'package:flutter/material.dart';

import '../../domain/entities/languages_entity.dart';

class LanguagesWidget extends StatelessWidget {
  const LanguagesWidget({
    super.key,
    required this.languagesEntity,
  });

  final LanguagesEntity languagesEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 5,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${languagesEntity.title} | ${languagesEntity.level}',
                textAlign: TextAlign.left,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
