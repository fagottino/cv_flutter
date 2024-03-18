import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/app_text_styles.dart';
import '../../../../core/presentation/widgets/responsive.dart';
import '../../domain/entities/educations_entity.dart';

class EducationsWidget extends StatelessWidget {
  const EducationsWidget({
    super.key,
    required this.educationsEntityList,
  });

  final List<EducationsEntity> educationsEntityList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titolo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: !ResponsiveWidget.isMobile(context),
                child: const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: 70,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Educazione'.toUpperCase(),
                    style: ResponsiveWidget.isMobile(context)
                        ? AppTextStyles.sectionTitleTextStyle
                        : AppTextStyles.defaultBoldTextStyle,
                  ),
                ),
              ),
              // const Spacer(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Visibility(
                  visible: !ResponsiveWidget.isMobile(context),
                  child: const Flexible(
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
                ),
                SizedBox(
                  width: !ResponsiveWidget.isMobile(context) ? 10 : null,
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          educationsEntityList[index].institute,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        educationsEntityList[index].title,
                      ),
                      Text(
                        educationsEntityList[index].dateFromTo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemCount: educationsEntityList.length,
          ),
        ],
      ),
    );
  }
}
