import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../../../../core/presentation/styles/app_colors.dart';
import '../../../../../core/presentation/styles/app_text_styles.dart';
import '../../../domain/entities/cv_entity.dart';
import '../../utils/personal_information_icon_extension.dart';
import '../driving_license_widget.dart';
import '../educations_widget.dart';
import '../languages_widget.dart';
import '../made_with_flutter_widget.dart';
import '../profile_photo_widget.dart';
import '../section_divider_widget.dart';
import '../social_links_widget.dart';
import '../work_experiences_widget.dart';
import 'personal_information_widget.dart';
import 'privacy_widget.dart';
import 'skills_and_competences_widget.dart';

class HomePageBodyMobileWidget extends StatelessWidget {
  HomePageBodyMobileWidget({
    super.key,
    required this.cvEntity,
  });

  final CvEntity cvEntity;
  final ScrollController _webSmoothScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 25,
        title: SocialLinksWidget(
          socialLinkEntityList: cvEntity.socialLinkEntityList,
        ),
      ),
      body: WebSmoothScroll(
        controller: _webSmoothScrollController,
        child: SingleChildScrollView(
          child: SelectionArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contatti + città + compleanno
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        // Contatti
                        ...cvEntity.contactsEntityList.map(
                          (e) => PersonalInformationWidget(
                            icon: e.icon.getIcon,
                            text: e.label,
                          ),
                        ),
                        // Città
                        Flexible(
                          child: PersonalInformationWidget(
                            icon: FontAwesomeIcons.houseChimney,
                            text: cvEntity.city,
                          ),
                        ),
                        // Compleanno
                        Flexible(
                          child: PersonalInformationWidget(
                            icon: FontAwesomeIcons.cakeCandles,
                            text: cvEntity.birthDate,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Divider
                  const SectionDividerWidget(),
                  // Foto + Nome + Cognome
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Foto profilo
                      const ProfilePhotoWidget(
                        radius: 80,
                      ),
                      // Nome + Cognome
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nome
                            Text(
                              cvEntity.name,
                              style: AppTextStyles.mainTitleTextStyle,
                            ),
                            // Cognome
                            Text(
                              cvEntity.surname,
                              style: AppTextStyles.mainTitleTextStyle,
                            ),
                            // Ruolo
                            Text(
                              cvEntity.role,
                              style: AppTextStyles.mainDescriptionTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Divider
                  const SectionDividerWidget(),
                  // Profilo
                  Text(
                    'Profilo'.toUpperCase(),
                    style: AppTextStyles.sectionTitleTextStyle,
                  ),
                  // Divider
                  const SizedBox(
                    height: 10,
                  ),
                  // Descrizione profilo
                  Text(
                    cvEntity.description,
                  ),
                  // Divider
                  const SectionDividerWidget(),
                  // Esperienze lavorative
                  Visibility(
                    visible: cvEntity.workExperiencesEntityList.isNotEmpty,
                    child: WorkExperiencesWidget(
                      workExperiencesEntityList: cvEntity.workExperiencesEntityList,
                    ),
                  ),
                  // Divider
                  const SectionDividerWidget(),
                  // Istruzione
                  Visibility(
                    visible: cvEntity.educationsEntityList.isNotEmpty,
                    child: EducationsWidget(
                      educationsEntityList: cvEntity.educationsEntityList,
                    ),
                  ),
                  // Divider
                  const SectionDividerWidget(),
                  // Lingue
                  Visibility(
                    visible: cvEntity.educationsEntityList.isNotEmpty,
                    child: LanguagesWidget(
                      languagesEntityList: cvEntity.languagesEntityList,
                    ),
                  ),
                  // SizedBox
                  const SectionDividerWidget(),
                  // Patenti
                  Visibility(
                    visible: cvEntity.drivingLicenseEntityList.isNotEmpty,
                    child: DrivingLicenseWidget(
                      drivingLicenseEntityList: cvEntity.drivingLicenseEntityList,
                    ),
                  ),
                  // Divider
                  const SectionDividerWidget(),
                  // Competenze
                  SkillsAndCompetences(
                    skillsAndCompetencesEntityList: cvEntity.skillsAndCompetencesEntityList,
                  ),
                  // Divider
                  const SectionDividerWidget(),
                  // Privacy
                  PrivacyWidget(
                    text: cvEntity.privacy,
                  ),
                  // Divider
                  const SectionDividerWidget(),
                  // Divider
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  // Divider
                  const SizedBox(
                    height: 20,
                  ),
                  // Made with Flutter
                  const Center(
                    child: MadeWithFlutterWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
