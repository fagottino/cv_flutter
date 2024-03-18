import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/app_text_styles.dart';
import '../../../../core/presentation/widgets/responsive.dart';
import '../../domain/entities/driving_license_entity.dart';

class DrivingLicenseWidget extends StatelessWidget {
  const DrivingLicenseWidget({
    super.key,
    required this.drivingLicenseEntityList,
  });

  final List<DrivingLicenseEntity> drivingLicenseEntityList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    'Patenti'.toUpperCase(),
                    style: ResponsiveWidget.isMobile(context)
                        ? AppTextStyles.sectionTitleTextStyle
                        : AppTextStyles.defaultBoldTextStyle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        drivingLicenseEntityList.map((e) => e.value).toList().join(' | '),
                        textAlign: TextAlign.left,
                        style: AppTextStyles.defaultBoldTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
