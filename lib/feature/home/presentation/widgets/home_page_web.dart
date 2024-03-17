import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/presentation/styles/app_colors.dart';
import '../../domain/entities/cv_entity.dart';
import '../blocs/vertical_divider_cubit.dart';
import '../utils/personal_information_icon_extension.dart';
import 'driving_license_widget.dart';
import 'educations_widget.dart';
import 'languages_widget.dart';
import 'personal_information_widget.dart';
import 'work_experiences_widget.dart';

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
    getBodyHeight();
    getFooterHeight();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_HomePageWebState());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getBodyHeight();
      getFooterHeight();
    });
    super.initState();
  }

  void getBodyHeight() {
    final keyContext = bodyKey.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      context.read<VerticalDividerCubit>().setBodyHeight(
            height: box.size.height,
          );
    }
  }

  void getFooterHeight() {
    final keyContext = footerKey.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      context.read<VerticalDividerCubit>().setFooterHeight(
            height: box.size.height,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 25,
        title: SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => launchUrl(
                  Uri.parse(
                    widget.cvEntity.socialLinkEntityList[index].link,
                  ),
                ),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: FaIcon(
                    widget.cvEntity.socialLinkEntityList[index].icon.getIcon,
                    size: 20,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: widget.cvEntity.socialLinkEntityList
                  .where((element) => element.showInHeader)
                  .length,
            ),
          ),
        ),
        // centerTitle: true,
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
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 20,
                              ),
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage(
                                  'images/fagottino.png',
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
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
                          const SizedBox(
                            height: 30,
                          ),
                          // Istruzione
                          Visibility(
                            visible: widget.cvEntity.educationsEntityList.isNotEmpty,
                            child: EducationsWidget(
                              educationsEntityList: widget.cvEntity.educationsEntityList,
                            ),
                          ),
                          // Divider
                          const SizedBox(
                            height: 30,
                          ),
                          // Lingue
                          Visibility(
                            visible: widget.cvEntity.educationsEntityList.isNotEmpty,
                            child: LanguagesWidget(
                              languagesEntityList: widget.cvEntity.languagesEntityList,
                            ),
                          ),
                          // SizedBox
                          const SizedBox(
                            height: 30,
                          ),
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
                                  getBodyHeight();
                                  return Column(
                                    key: bodyKey,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
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
                                      Text(
                                        'Profilo'.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        widget.cvEntity.description,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      // Divider
                                      const SizedBox(
                                        height: 30,
                                      ),
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
                            getFooterHeight();
                            return Column(
                              key: footerKey,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Divider
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Competenze'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                  separatorBuilder: (context, index) => const SizedBox(
                                    height: 30,
                                  ),
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
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Made with',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.heart,
                              size: 16,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const TextSpan(
                          text: 'with',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            width: 4,
                          ),
                        ),
                        TextSpan(
                          text: 'Flutter',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrl(
                                Uri.parse(
                                  'https://flutter.dev/',
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
