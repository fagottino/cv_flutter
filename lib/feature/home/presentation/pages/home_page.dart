import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/presentation/styles/app_colors.dart';
import '../../domain/entities/cv_entity.dart';
import '../blocs/home_cubit.dart';
import '../utils/personal_information_icon_extension.dart';
import '../widgets/educations_widget.dart';
import '../widgets/languages_widget.dart';
import '../widgets/personal_information_widget.dart';
import '../widgets/work_experiences_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().initData();
    });
    leftScrollController.addListener(() {
      debugPrint(
        "leftController offset ${leftScrollController.offset}  position ${leftScrollController.position}",
      );
      rightScrollController.jumpTo(leftScrollController.offset);
    });

    rightScrollController.addListener(() {
      debugPrint(
        "rightScrollController offset ${rightScrollController.offset}  position ${rightScrollController.position}",
      );
      leftScrollController.jumpTo(rightScrollController.offset);
    });
  }

  final ScrollController leftScrollController = ScrollController();
  final ScrollController rightScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return switch (state) {
          Initial() => const Center(child: CircularProgressIndicator()),
          InProgress() => const Center(child: CircularProgressIndicator()),
          Error() => const Center(child: CircularProgressIndicator()),
          Successfully(cvEntity: CvEntity cvEntity) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                toolbarHeight: 25,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 15,
                    right: 15,
                    bottom: 50,
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
                                ...cvEntity.contactsEntityList.map(
                                  (e) => PersonalInformationWidget(
                                    icon: e.icon.getIcon,
                                    text: e.label ?? '',
                                  ),
                                ),
                                // Città
                                PersonalInformationWidget(
                                  icon: FontAwesomeIcons.houseChimney,
                                  text: cvEntity.city,
                                ),
                                // Compleanno
                                PersonalInformationWidget(
                                  icon: FontAwesomeIcons.cakeCandles,
                                  text: cvEntity.birthDate,
                                ),
                                // Divider
                                const SizedBox(
                                  height: 30,
                                ),
                                // Istruzione
                                Visibility(
                                  visible: cvEntity.educationsEntityList.isNotEmpty,
                                  child: EducationsWidget(
                                    educationsEntityList: cvEntity.educationsEntityList,
                                  ),
                                ),
                                // Divider
                                const SizedBox(
                                  height: 30,
                                ),
                                // Lingue
                                Visibility(
                                  visible: cvEntity.educationsEntityList.isNotEmpty,
                                  child: LanguagesWidget(
                                    languagesEntityList: cvEntity.languagesEntityList,
                                  ),
                                ),
                                // SizedBox
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          // Vertical Divider
                          SizedBox(
                            width: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                              ),
                              child: const Text(''),
                            ),
                          ),
                          // Profilo + Esperienze Lavorative
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${cvEntity.name} ${cvEntity.surname}',
                                    style: const TextStyle(
                                      fontSize: 50,
                                      color: AppColors.primaryColor,
                                      letterSpacing: 10,
                                    ),
                                  ),
                                  // Ruolo
                                  Text(
                                    cvEntity.role,
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
                                    cvEntity.description,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  // Divider
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Visibility(
                                    visible: cvEntity.workExperiencesEntityList.isNotEmpty,
                                    child: WorkExperiencesWidget(
                                      workExperiencesEntityList: cvEntity.workExperiencesEntityList,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Privacy + Conoscenze
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Privacy
                            Expanded(
                              flex: 1,
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
                                      // const Spacer(),
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
                                            cvEntity.privacy,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Vertical Divider
                            SizedBox(
                              width: 1,
                              height: MediaQuery.of(context).size.height,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                ),
                                child: const Text(''),
                              ),
                            ),
                            // Competenze
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                              cvEntity.skillsAndCompetencesEntityList[index].title),
                                          Text(cvEntity
                                              .skillsAndCompetencesEntityList[index].description),
                                        ],
                                      ),
                                      separatorBuilder: (context, index) => const SizedBox(
                                        height: 30,
                                      ),
                                      itemCount: cvEntity.skillsAndCompetencesEntityList.length,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        };
      },
    );
  }
}
