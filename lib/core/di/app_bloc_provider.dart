import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/domain/use_cases/get_cv_use_case.dart';
import '../../feature/home/presentation/blocs/home_cubit.dart';
import '../../feature/home/presentation/blocs/vertical_divider_cubit.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;

  const AppBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (blocProviderContext) => HomeCubit(
            getCvUseCase: RepositoryProvider.of<GetCvUseCase>(context),
          ),
        ),
        BlocProvider<VerticalDividerCubit>(
          create: (blocProviderContext) => VerticalDividerCubit(),
        ),
      ],
      child: child,
    );
  }
}
