import 'package:aorlando/core/presentation/widgets/flavor_banner.dart';
import 'package:aorlando/feature/home/presentation/widgets/web/home_page_body_web_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/responsive.dart';
import '../../domain/entities/cv_entity.dart';
import '../blocs/home_cubit.dart';
import '../widgets/mobile/home_page_body_mobile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return switch (state) {
          Initial() => const Center(child: CircularProgressIndicator()),
          InProgress() => const Center(child: CircularProgressIndicator()),
          Error() => const Center(child: CircularProgressIndicator()),
          Successfully(cvEntity: CvEntity cvEntity) => PdfBannerWidget(
              child: ResponsiveWidget(
                mobile: HomePageBodyMobileWidget(cvEntity: cvEntity),
                tablet: HomePageBodyWebWidget(cvEntity: cvEntity),
                desktop: HomePageBodyWebWidget(cvEntity: cvEntity),
              ),
            ),
        };
      },
    );
  }
}
