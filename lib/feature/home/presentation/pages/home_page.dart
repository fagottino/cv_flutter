import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/presentation/styles/app_colors.dart';
import '../../domain/entities/cv_entity.dart';
import '../blocs/home_cubit.dart';
import '../widgets/educations_widget.dart';
import '../widgets/languages_widget.dart';
import '../widgets/personal_information_widget.dart';

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
  }

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Foto
                            const Center(
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage(
                                  'images/fagottino.png',
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            // Email
                            PersonalInformationWidget(
                              icon: FontAwesomeIcons.envelope,
                              text: cvEntity.email,
                            ),
                            // Telegram
                            PersonalInformationWidget(
                              icon: FontAwesomeIcons.telegram,
                              text: cvEntity.city,
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
                              child: Text(
                                'Educazione'.toUpperCase(),
                              ),
                            ),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => EducationsWidget(
                                educationsEntity: cvEntity.educationsEntityList[index],
                              ),
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 30,
                              ),
                              itemCount: cvEntity.educationsEntityList.length,
                            ),
                            // Lingue
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => LanguagesWidget(
                                languagesEntity: cvEntity.languagesEntityList[index],
                              ),
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 30,
                              ),
                              itemCount: cvEntity.languagesEntityList.length,
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
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${cvEntity.name.toUpperCase()} ${cvEntity.surname.toUpperCase()}',
                              ),
                              Text(
                                cvEntity.role.toUpperCase(),
                              ),
                            ],
                          ),
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
