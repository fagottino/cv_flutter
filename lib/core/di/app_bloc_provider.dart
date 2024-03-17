import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/domain/repositories/home_repository.dart';
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
            homeRepository: RepositoryProvider.of<HomeRepository>(context),
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
