import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/presentation/styles/app_text_styles.dart';
import '../../../domain/entities/skills_and_competences_entity.dart';
import '../../blocs/vertical_divider_cubit.dart';
import '../section_divider_widget.dart';

class SkillsAndCompetences extends StatelessWidget {
  const SkillsAndCompetences({
    super.key,
    required this.footerKey,
    required this.skillsAndCompetencesEntityList,
  });

  final GlobalKey footerKey;
  final List<SkillsAndCompetencesEntity> skillsAndCompetencesEntityList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 50,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            context.read<VerticalDividerCubit>().getAndSetFooterHeight(
                  globalKey: footerKey,
                );
            return Column(
              key: footerKey,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Divider
                const SectionDividerWidget(),
                // Competenze
                Text(
                  'Competenze'.toUpperCase(),
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
                        skillsAndCompetencesEntityList[index].title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
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
          },
        ),
      ),
    );
  }
}
