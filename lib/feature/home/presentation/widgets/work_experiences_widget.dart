import 'package:flutter/material.dart';

import '../../domain/entities/work_experiences_entity.dart';

class WorkExperiencesWidget extends StatelessWidget {
  const WorkExperiencesWidget({
    super.key,
    required this.workExperiencesEntityList,
  });

  final List<WorkExperiencesEntity> workExperiencesEntityList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Esperienze Lavorative'.toUpperCase(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Divider
        const SizedBox(
          height: 10,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${workExperiencesEntityList[index].company} | ${workExperiencesEntityList[index].title}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                workExperiencesEntityList[index].dateFromTo,
                style: const TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                workExperiencesEntityList[index].description,
              ),
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: workExperiencesEntityList.length,
        ),
      ],
    );
  }
}
