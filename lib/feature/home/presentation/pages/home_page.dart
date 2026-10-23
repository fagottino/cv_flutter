import 'package:aorlando/core/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_error_state_widget.dart';
import '../../../../core/presentation/widgets/pdf_banner_widget.dart';
import '../../../../core/presentation/widgets/responsive_widget.dart';
import '../../domain/entities/cv_entity.dart';
import '../blocs/home_cubit.dart';
import '../widgets/mobile/home_page_body_mobile_widget.dart';
import '../widgets/web/home_page_body_web_widget.dart';

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
          Successfully(cvEntity: CvEntity cvEntity) => PdfBannerWidget(
            child: ResponsiveWidget(
              mobile: HomePageBodyMobileWidget(cvEntity: cvEntity),
              tablet: HomePageBodyWebWidget(cvEntity: cvEntity),
              desktop: HomePageBodyWebWidget(cvEntity: cvEntity),
            ),
          ),
          Error(:final errorMessage) => Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              toolbarHeight: 25,
            ),
            body: AppErrorStateWidget(
              message: errorMessage,
              onRetry: () {
                context.read<HomeCubit>().initData();
              },
            ),
          ),
          _ => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        };
      },
    );
  }
}
