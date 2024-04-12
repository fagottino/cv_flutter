import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/data/repositories_impl/home_repository_impl.dart';
import '../../feature/home/domain/repositories/home_repository.dart';
import '../data/data_sources/assets_data_source.dart';
import '../domain/data_sources/local/local_data_source.dart';

class AppRepositoryProvider extends StatelessWidget {
  final Widget child;

  const AppRepositoryProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalDataSource>(
          create: (context) => AssetsDataSource(),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(
            localDataSource: context.read<LocalDataSource>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
