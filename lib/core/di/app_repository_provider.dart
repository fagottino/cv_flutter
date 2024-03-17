import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/data/repositories_impl/home_repository_impl.dart';
import '../../feature/home/domain/repositories/home_repository.dart';

class AppRepositoryProvider extends StatelessWidget {
  final Widget child;

  const AppRepositoryProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(),
        ),
      ],
      child: child,
    );
  }
}
