import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/presentation/styles/app_colors.dart';
import '../../domain/entities/cv_entity.dart';
import '../blocs/vertical_divider_cubit.dart';
import '../utils/personal_information_icon_extension.dart';
import 'driving_license_widget.dart';
import 'educations_widget.dart';
import 'languages_widget.dart';
import 'made_with_flutter_widget.dart';
import 'personal_information_widget.dart';
import 'profile_photo_widget.dart';
import 'social_links_widget.dart';
import 'work_experiences_widget.dart';

part 'section_divider_widget.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({
    super.key,
    required this.cvEntity,
  });

  final CvEntity cvEntity;

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> with WidgetsBindingObserver {
  GlobalKey bodyKey = GlobalKey();
  GlobalKey footerKey = GlobalKey();

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    context.read<VerticalDividerCubit>().getAndSetBodyHeight(
          globalKey: bodyKey,
        );
    context.read<VerticalDividerCubit>().getAndSetFooterHeight(
          globalKey: footerKey,
        );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_HomePageWebState());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<VerticalDividerCubit>().getAndSetBodyHeight(
            globalKey: bodyKey,
          );
      context.read<VerticalDividerCubit>().getAndSetFooterHeight(
            globalKey: footerKey,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 25,
        title: SocialLinksWidget(
          socialLinkEntityList: widget.cvEntity.socialLinkEntityList,
        ),
      ),
      body: SingleChildScrollView(
        child: SelectionArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Informazioni personali
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Foto
                          const Center(
                            child: ProfilePhotoWidget(),
                          ),
                          // Contatti
                          ...widget.cvEntity.contactsEntityList.map(
                            (e) => PersonalInformationWidget(
                              icon: e.icon.getIcon,
                              text: e.label,
                              link: e.link,
                            ),
                          ),
                          // Città
                          PersonalInformationWidget(
                            icon: FontAwesomeIcons.houseChimney,
                            text: widget.cvEntity.city,
                          ),
                          // Compleanno
                          PersonalInformationWidget(
                            icon: FontAwesomeIcons.cakeCandles,
                            text: widget.cvEntity.birthDate,
                          ),
                          // Divider
                          const SectionDividerWidget(),
                          // Istruzione
                          Visibility(
                            visible: widget.cvEntity.educationsEntityList.isNotEmpty,
                            child: EducationsWidget(
                              educationsEntityList: widget.cvEntity.educationsEntityList,
                            ),
                          ),
                          // Divider
                          const SectionDividerWidget(),
                          // Lingue
                          Visibility(
                            visible: widget.cvEntity.educationsEntityList.isNotEmpty,
                            child: LanguagesWidget(
                              languagesEntityList: widget.cvEntity.languagesEntityList,
                            ),
                          ),
                          // SizedBox
                          const SectionDividerWidget(),
                          // Istruzione
                          Visibility(
                            visible: widget.cvEntity.drivingLicenseEntityList.isNotEmpty,
                            child: DrivingLicenseWidget(
                              drivingLicenseEntityList: widget.cvEntity.drivingLicenseEntityList,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Profilo + Esperienze Lavorative
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            BlocBuilder<VerticalDividerCubit, VerticalDividerState>(
                              buildWhen: (previous, current) =>
                                  (previous as Successfully).bodyHeight !=
                                  (current as Successfully).bodyHeight,
                              builder: (context, state) {
                                return SizedBox(
                                  height: (state as Successfully).bodyHeight,
                                  child: const VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    color: AppColors.primaryColor,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              flex: 4,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  context.read<VerticalDividerCubit>().getAndSetBodyHeight(
                                        globalKey: bodyKey,
                                      );
                                  return Column(
                                    key: bodyKey,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Nome + Cognome
                                      Text(
                                        '${widget.cvEntity.name} ${widget.cvEntity.surname}',
                                        style: const TextStyle(
                                          fontSize: 50,
                                          color: AppColors.primaryColor,
                                          letterSpacing: 10,
                                        ),
                                      ),
                                      // Ruolo
                                      Text(
                                        widget.cvEntity.role,
                                        style: const TextStyle(
                                          fontSize: 23,
                                          color: AppColors.black,
                                          letterSpacing: 5,
                                        ),
                                      ),
                                      // Divider
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      // Profilo
                                      Text(
                                        'Profilo'.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Descrizione profilo
                                      Text(
                                        widget.cvEntity.description,
                                      ),
                                      // Divider
                                      const SectionDividerWidget(),
                                      // Esperienze lavorative
                                      Visibility(
                                        visible:
                                            widget.cvEntity.workExperiencesEntityList.isNotEmpty,
                                        child: WorkExperiencesWidget(
                                          workExperiencesEntityList:
                                              widget.cvEntity.workExperiencesEntityList,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Privacy + Conoscenze
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Privacy
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Spacer
                                const Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 70,
                                  ),
                                ),
                                // Titolo
                                Flexible(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Privacy'.toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox
                            const SizedBox(
                              height: 10,
                            ),
                            // Testo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Spacer
                                const Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 70,
                                  ),
                                ),
                                // Testo
                                Flexible(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.cvEntity.privacy,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Vertical Divider
                    BlocBuilder<VerticalDividerCubit, VerticalDividerState>(
                      buildWhen: (previous, current) =>
                          (previous as Successfully).footerHeight !=
                          (current as Successfully).footerHeight,
                      builder: (context, state) {
                        return SizedBox(
                          width: 1,
                          height: (state as Successfully).footerHeight,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                            ),
                            child: const Text(''),
                          ),
                        );
                      },
                    ),
                    // Competenze
                    Expanded(
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
                                        widget.cvEntity.skillsAndCompetencesEntityList[index].title,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        widget.cvEntity.skillsAndCompetencesEntityList[index]
                                            .description,
                                      ),
                                    ],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SectionDividerWidget(),
                                  itemCount: widget.cvEntity.skillsAndCompetencesEntityList.length,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // Divider
                const SectionDividerWidget(),
                // Made with Flutter
                const Center(
                  child: MadeWithFlutterWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
