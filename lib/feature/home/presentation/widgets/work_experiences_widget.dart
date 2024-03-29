import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/app_text_styles.dart';
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
          style: AppTextStyles.sectionTitleTextStyle,
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
                style: AppTextStyles.secondaryTitleTextStyle,
              ),
              Text(
                workExperiencesEntityList[index].dateFromTo,
                style: AppTextStyles.secondaryTitleItalicTextStyle,
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
