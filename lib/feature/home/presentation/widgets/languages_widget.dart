import 'package:flutter/material.dart';

import '../../domain/entities/languages_entity.dart';

class LanguagesWidget extends StatelessWidget {
  const LanguagesWidget({
    super.key,
    required this.languagesEntityList,
  });

  final List<LanguagesEntity> languagesEntityList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                flex: 1,
                child: SizedBox(
                  width: 70,
                ),
              ),
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lingue'.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // const Spacer(),
            ],
          ),
          // Divider
          const SizedBox(
            height: 20,
          ),
          // Lingue
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
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
                      '${languagesEntityList[index].title} | ${languagesEntityList[index].level}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemCount: languagesEntityList.length,
          ),
        ],
      ),
    );
  }
}
