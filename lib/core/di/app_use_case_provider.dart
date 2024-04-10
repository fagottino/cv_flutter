import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/domain/repositories/home_repository.dart';
import '../../feature/home/domain/use_cases/get_cv_use_case.dart';

class AppUseCaseProvider extends StatelessWidget {
  const AppUseCaseProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GetCvUseCase>(
          create: (context) => GetCvUseCase(
            homeRepository: context.read<HomeRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
