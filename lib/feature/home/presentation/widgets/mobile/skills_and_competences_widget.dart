import 'package:flutter/material.dart';

import '../../../../../core/presentation/styles/app_text_styles.dart';
import '../../../domain/entities/skills_and_competences_entity.dart';
import '../section_divider_widget.dart';

class SkillsAndCompetences extends StatelessWidget {
  const SkillsAndCompetences({
    super.key,
    required this.skillsAndCompetencesEntityList,
  });

  final List<SkillsAndCompetencesEntity> skillsAndCompetencesEntityList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Competenze'.toUpperCase(),
          style: AppTextStyles.sectionTitleTextStyle,
        ),
        // Divider
        const SizedBox(
          height: 10,
        ),
        // Competenze
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skillsAndCompetencesEntityList[index].title,
                style: AppTextStyles.secondaryTitleTextStyle,
              ),
              Text(
                skillsAndCompetencesEntityList[index].description,
              ),
            ],
          ),
          separatorBuilder: (context, index) => const SectionDividerWidget(),
          itemCount: skillsAndCompetencesEntityList.length,
        ),
      ],
    );
  }
}
