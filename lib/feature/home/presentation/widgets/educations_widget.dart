import 'package:flutter/material.dart';

import '../../domain/entities/educations_entity.dart';

class EducationsWidget extends StatelessWidget {
  const EducationsWidget({
    super.key,
    required this.educationsEntity,
  });

  final EducationsEntity educationsEntity;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    educationsEntity.institute,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  educationsEntity.title,
                ),
                Text(
                  educationsEntity.dateFromTo,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
